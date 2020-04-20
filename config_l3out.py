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
	print ("-l|--l3out:   L3out Name")
	print ("-t|--tenant:  tenant Name")
	print ("-c|--creds:   Pass credentials file in this format:")
	print ("	APIC IP,username,password\n")
	print ("-h|--help: print help message\n\n")
	sys.exit(1)

def get_subnets(data,subnets,np):
	if data['totalCount'] == '0':
		print ("WARNING: No subnets found for node profile " + np )
	else:
		for routes in data['imdata']:
			for keys in routes:
				if keys == 'ipRouteP':
					subnets.append(routes[keys]['attributes']['ip'])

	return subnets

def get_node_profiles(data):
	np = []
	for l3extLNodeP in data['imdata']:
		np.append((l3extLNodeP['l3extLNodeP']['attributes']['name']))

	return np

def main(argv):
	errfound = 0	
	f_ip = ""
	f_un=""
	f_pw=""

	if len(argv) == 0:
		usage()


	try:
		opts,args = getopt.getopt(argv,"l:c:ht:",["l3out=","creds=","help","tenant"])
	except getopt.GetoptError as err:
		print (str(err))
		sys.exit(2)
	else:
		for opt,arg in opts:
			if opt in ("-h","--help"):
				usage()
			if opt in ("-l","--l3out"):
				l3out = arg
			if opt in ("-t","--tenant"):
				tenant = arg
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
		l3out
	except NameError:
		print ("L3Out name not specified (-l|--l3out)")
		sys.exit(9)
	try:
		tenant
	except NameError:
		print ("Tenant name not specified (-t|--tenant)")
		sys.exit(9)
	try:
		creds	
	except NameError:
		print ("Credentials file not passed (-c|--creds)")
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


	requests.packages.urllib3.disable_warnings()
	
	headers = { "aaaUser" : { "attributes" : { "name" : f_un, "pwd" : f_pw }  } }

	response = requests.post("https://" + str(f_ip) + "/api/aaaLogin.json", json=headers, verify=False, timeout=10)

	if response.status_code != 200:
		print ("Login failed to APIC: " + f_ip + ".  Please check IP and credentials.")
		sys.exit(9)


	token = response.json()["imdata"][0]["aaaLogin"]["attributes"]["token"]
	cookie = { 'APIC-cookie' : token }

	subnets = []
	# Get logical node profiles
	url = "https://" + f_ip + "/api/node/mo/uni/tn-" + tenant + "/out-" + l3out + ".json?query-target=children&target-subtree-class=l3extLNodeP"
	response = requests.get("%s" % (url), cookies=cookie, verify=False,  timeout=10)

	if response.status_code == 200:
		nodeprofs = get_node_profiles(response.json())
		
		if len(nodeprofs) == 0:
			print ("ERROR: No nodeprofiles found for L3Out %s " % l3out)
		else:
			for np in nodeprofs:
				url="https://" + f_ip + "/api/node/mo/uni/tn-" + tenant + "/out-" + l3out + "/lnodep-" + np + ".json?query-target=subtree&target-subtree-class=l3extRsNodeL3OutAtt&target-subtree-class=l3extRsNodeL3OutAtt,ipRouteP,l3extLoopBackIfP&query-target=subtree"
				response = requests.get("%s" % (url), cookies=cookie, verify=False,  timeout=10)
		
				if response.status_code == 200:
					subnets = get_subnets(response.json(),subnets,np)
				else:
					print ("ERROR: Unable to pull subnet info for L3Oout/NodeProfile: %s/%s " %(l3out,np))
		if len(subnets) == 0:
			print ("ERROR: No subnets found in Node profiles for L3Out %s" % l3out)	
		else:
			sorted_subnets = sorted(set(subnets))
			print (len(sorted_subnets))

	else:
		print ("Failed to get Node Profile for L3Out: %s" % l3out)

if __name__ == '__main__':
		main(sys.argv[1:])
