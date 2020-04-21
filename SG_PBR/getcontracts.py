#!/usr/bin/env python3

import sys
import requests
import json
import getpass
import getopt
import os
import ipaddress

def usage():
    print ("\n\nUsage: " +  sys.argv[0] + " -f|file <inputfile>")
    print ("")
    print ("-f|--file:   Pass input file of EPGs to check, one per line.  Format should be:")
    print ("	EPG|L3Out,tenant,ap|l3out,epg|extepg	\n")
    print ("L3Out ex:	L3Out,Audit,L3Out_AUD-DDT-DC1-SDE,epL3Out_AUD-DDT-DC1-SDE	\n")
    print ("EPG   ex:	EPG,Audit,Audit,AUD-DDT-DC1-SDE-ND-SWG-1	\n")
    print ("-c|--creds:   Pass credentials file in this format:")
    print ("	APIC IP,username,password\n")
    print ("-h|--help: print help message\n\n")
    sys.exit(1)

def main(argv):
    	errfound = 0	
    	f_ip = ""
    	f_un=""
    	f_pw=""

    	if len(argv) == 0:
    		usage()


    	try:
        	opts,args = getopt.getopt(argv,"f:c:h",["file=","creds=","help"])
    	except getopt.GetoptError as err:
       		print (str(err))
        	sys.exit(2)
    	else:
    		for opt,arg in opts:
    			if opt in ("-h","--help"):
    				usage()
    			if opt in ("-f","--file"):
    				infile = arg
    			if opt in ("-c","--creds"):
    				creds = arg
    				if not os.path.isfile(creds):
                                	print (sys.argv[0] + " credentials file %s NOT found" % creds)
                                	sys.exit(1)
    				else:
    					with open (creds) as data:
    						lines = data.read().splitlines()
                    
    					for data in lines:
    						d = data.split(",")
    						f_ip = d[0]
                       
    						try:
    							ipaddress.ip_address(f_ip)
    						except:
    							print ("Invalid IP %s, line %s" % (f_ip,lines.index(data)+1))
    							errfound = 1
                       
    						try:
    							f_un = d[1]
    						except IndexError:
    							print ("No APIC Username defined in creds file.  Expecting username in the 2nd column, line %s" % (lines.index(data)+1))
    							errfound = 1
                        
    						try:
    							f_pw = d[2]
    						except IndexError:
    							print ("No APIC Password passed in creds file.  Expecting password in the 3rd column, line %s" % (lines.index(data)+1)) 
    							errfound = 1
                    
    					if errfound:
    						print ("\nPlease correct creds file passed to the -c|--creds option and try again")    
    						sys.exit(9)
    


    	try:
    		infile
    	except NameError:
    		print ("Input file not passed (-f|--file)")
    		sys.exit(9)
    	try:
    		creds	
    	except NameError:
    		print ("Credentials file not passed (-c|--creds)")
    		sys.exit(9)

    	if not os.path.isfile(infile):
    		print (sys.argv[0] + " Input File %s NOT found" % infile)
    		sys.exit(9)

    	if len(f_ip) == 0:
        	print ("No IP address found in credentials file")
        	sys.exit(9)

    	if len(f_un) == 0:
        	print ("No Username found in credentials file")
        	sys.exit(9)
    	if len(f_pw) == 0:
    		print ("No password found in credentials file")
    		sys.exit(9)

	#username = input("\n\nEnter APIC username and press enter: \n\n")
	#password = getpass.getpass("\n\nEnter APIC password and press enter: \n\n")
	#apic = input("\n\nEnter APIC IP and press enter: \n\n")

    	requests.packages.urllib3.disable_warnings()
	
    	headers = { "aaaUser" : { "attributes" : { "name" : f_un, "pwd" : f_pw }  } }

    	response = requests.post("https://" + str(f_ip) + "/api/aaaLogin.json", json=headers, verify=False, timeout=10)

    	if response.status_code != 200:
    		print ("Login failed to APIC: " + f_ip + ".  Please check IP and credentials.")
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
			
		
    		url="https://" + f_ip + "/api/node/mo/uni/tn-" + tenant + middle_part + epgname + ".json?query-target=subtree&target-subtree-class=fvRsCons&target-subtree-class=fvRsConsIf,fvRsProtBy,fvRsProv"
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
