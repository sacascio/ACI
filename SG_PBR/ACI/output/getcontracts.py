#!/usr/bin/env python3

import sys
import requests
import json
import getpass
import getopt
import os

def usage():
    print ("Usage: " +  sys.argv[0] + " -f|file <inputfile>")
    print ("")
    print ("-f|--file:   Pass input file of EPGs to check, one per line.  Format should be:")
    print ("tenant,ap,epg")
    print ("-h|--help: print help message")
    sys.exit(1)

def main(argv):
	try:
        	opts,args = getopt.getopt(argv,"f:",["file=","help"])
	except getopt.GetoptError as err:
       		print (str(err))
        	sys.exit(2)
	else:
		for opt,arg in opts:
			if opt in ("-h","--help"):
				usage()
			if opt in ("-f","--file"):
				infile = arg

	try:
		infile
	except NameError:
		print ("Input file not passed (-f|--file)")
		sys.exit(9)

	if not os.path.isfile(infile):
		print (sys.argv[0] + " Input File %s NOT found" % infile)
		sys.exit(9)

	username = input("\n\nEnter APIC username and press enter: \n\n")
	password = getpass.getpass("\n\nEnter APIC password and press enter: \n\n")
	apic = input("\n\nEnter APIC IP and press enter: \n\n")

	requests.packages.urllib3.disable_warnings()
	
	headers = { "aaaUser" : { "attributes" : { "name" : username, "pwd" : password }  } }

	response = requests.post("https://" + str(apic) + "/api/aaaLogin.json", json=headers, verify=False, timeout=10)

	if response.status_code != 200:
		print ("Login failed to APIC: " + apic + ".  Please check IP and credentials.")
		sys.exit(9)


	with open (infile) as f:
		epgs = f.readlines()
	token = response.json()["imdata"][0]["aaaLogin"]["attributes"]["token"]
	cookie = { 'APIC-cookie' : token }

	output_file = infile + "_output"
	f = open(output_file,"w")

	for x in epgs:
		xx = x.split(",")
		construct_type = xx[0]
		tenant = xx[1]
		ap = xx[2]
		epgname = xx[3]
		epgname = epgname.rstrip()

		if construct_type == 'EPG':
			middle_part = "/ap-" + ap + "/epg-"
		else:
			middle_part = "/out-" + ap + "/instP-"
			
		
		url="https://" + apic + "/api/node/mo/uni/tn-" + tenant + middle_part + epgname + ".json?query-target=subtree&target-subtree-class=fvRsCons&target-subtree-class=fvRsConsIf,fvRsProtBy,fvRsProv"
	
		response = requests.get("%s" % (url),
                             cookies=cookie,
                             verify=False,  # disable SSH certificate verification
                             timeout=10)

		if response.status_code == 200:
			for i in response.json()["imdata"]:
				for k in i.keys():
					contract = i[k]['attributes']['tnVzBrCPName']
					state    = i[k]['attributes']['state']

					if k == 'fvRsProv':
						p_or_c = 'Provider'
					else:
						p_or_c = 'Consumer'

					f.write(construct_type + ": " + epgname + ", " +  p_or_c + ": " + contract + ", status: " + state + "\n")

		else:
			print ("Failed to get Provide contract info for EPG: %s" % epgname)
	f.close()
if __name__ == '__main__':
        main(sys.argv[1:])
