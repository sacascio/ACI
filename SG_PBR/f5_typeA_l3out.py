#!/usr/bin/env python3

import re
import sys
import requests
import json
import getpass
import getopt
import os
import ipaddress

def usage():
	print ("\n\nUsage: " +  sys.argv[0] + " -l|--l3out <l3out> -t|--tenant <tenant> -c|--creds <aci_creds_file>" )
	print ("")
	print ("-l|--l3out:   L3out Name")
	print ("-t|--tenant:  tenant Name")
	print ("-c|--creds:   Pass credentials file in this format:")
	print ("	APIC IP,username,password\n")
	print ("-h|--help: print help message\n\n")
	sys.exit(1)

def getextepg(l3out,ip,cookie,tenant):

	url = "https://" + ip + "/api/node/mo/uni/tn-" + tenant + "/out-" + l3out + ".json?query-target=children&target-subtree-class=l3extInstP"
	response = requests.get("%s" % (url), cookies=cookie, verify=False,  timeout=10)
	data = response.json()

	if response.status_code == 200:
		if data['totalCount'] != '1':
			print ("WARNING: %s External EPG's found in L3Out %s"  % (data['totalCount'],l3out))

		else:
			for ext in data['imdata']:
				extepg = ext['l3extInstP']['attributes']['name']
				return extepg

def getextepgcontracts(l3out,ip,cookie,tenant,extepg):
	extepgcontracts  = {}
	extepgcontracts['fvRsProv'] = []
	extepgcontracts['fvRsCons'] = []

	for p in ('fvRsProv','fvRsCons'):
		url = "https://" + ip + "/api/node/mo/uni/tn-" + tenant + "/out-" + l3out  + "/instP-" + extepg + ".json?query-target=children&target-subtree-class=" + p
		response = requests.get("%s" % (url), cookies=cookie, verify=False,  timeout=10)
		data = response.json()

		if response.status_code == 200:
			if data['totalCount'] == '0':
				print ("WARNING: External EPG %s has no %s contracts"  % (extepg,p))
			else:
				for d in data['imdata']:
					extepgcontracts[p].append(d[p]['attributes']['tnVzBrCPName'])
		else:
			print ("ERROR: Could not get contracts for L3out %s"  % (l3out))

	return extepgcontracts

def removeextepgcontracts(l3out,ip,cookie,tenant,extepg,extepgcontracts,sgcontract):
	ttype_map = {}
	ttype_map['fvRsProv'] = 'rsprov'
	ttype_map['fvRsCons'] = 'rscons'

	for t in extepgcontracts:
		for c in extepgcontracts[t]:
			if c == sgcontract:
				#print ("OK: Skipping %s" % (sgcontract))
				continue

			url = "https://" + ip + "/api/node/mo/uni/tn-" + tenant + "/out-" + l3out  + "/instP-" + extepg + ".json"

			payload = {
				  "l3extInstP": {
    					"attributes": {
      					"dn": "uni/tn-" + tenant + "/out-" + l3out  + "/instP-" + extepg,
					"status": "modified"
					},
    					"children": [
      					{
						t : {
          						"attributes": {
							"dn": "uni/tn-" + tenant + "/out-" + l3out  + "/instP-" + extepg + "/" + ttype_map[t] + "-" + c,
							"status": "deleted"
							},
          						"children": []
        					}
      					}
    					]
  				}
			}
	
			response = requests.post("%s" % (url), cookies=cookie, json=payload,verify=False,  timeout=10)

			if response.status_code == 200:
                		print ("OK: %s Contract %s removed from External EPG %s" % (t,c,extepg))
			else:
				print (response.json())
			
def addextepgcontracts(l3out,ip,cookie,tenant,extepg,sgcontract):
	url = "https://" + ip + "/api/node/mo/uni/tn-" + tenant + "/out-" + l3out  + "/instP-" + extepg + ".json"

	payload = {
			'fvRsProv' : {
          				"attributes": {
					"status": "created,modified",
					"tnVzBrCPName" : sgcontract
					},
          				"children": []
        		}
      		}
	
	response = requests.post("%s" % (url), cookies=cookie, json=payload,verify=False,  timeout=10)

	if response.status_code == 200:
       		print ("OK: Provide Contract %s added to External EPG %s" % (sgcontract,extepg))
	else:
		print (response.json())

def add_extepg_to_pg(tenant,l3out,extepg,ip,cookie):
	
	url = "https://" + ip + "/api/node/mo/uni/tn-" + tenant + "/out-" + l3out + "/instP-" + extepg + ".json"

	json = { 
		"l3extInstP":
		{
			"attributes":
			{
				"dn":"uni/tn-" + tenant + "/out-" + l3out + "/instP-" + extepg,
				"prefGrMemb":"include"
			},
			"children" : 
				[]
		}
		}	
	
	response = requests.post("%s" % (url), cookies=cookie, json=json,verify=False,  timeout=10)

	if response.status_code == 200:
                print ("OK: External EPG %s added to the Preferred Group " % (extepg))
	else:
		print (response.json())


def remove_quad_zero(ip,cookie,tenant,extepg,l3out):
	
	url = "https://" + ip + "/api/node/mo/uni/tn-" + tenant + "/out-" + l3out + "/instP-" + extepg + ".json"
	json = { 
		"l3extInstP":
		{
				"attributes":
				{ 
						"dn":"uni/tn-" + tenant + "/out-" + l3out + "/instP-" + extepg,
						"status":"modified"
				},
		"children" : [
				{
					"l3extSubnet":
					{
						"attributes":
						{
							"dn":"uni/tn-" + tenant + "/out-" + l3out + "/instP-" + extepg + "/extsubnet-[0.0.0.0/0]",
							"status":"deleted"
						},
							"children":[]
					}
				}
				]
			}
		}

	response = requests.post("%s" % (url), cookies=cookie, json=json,verify=False,  timeout=10)

	if response.status_code == 200:
                print ("OK: Subnet 0.0.0.0/0 removed from external EPG %s " % (extepg))
	else:
		print (response.json())

def add_subnet(subnet,ip,cookie,tenant,extepg,l3out):
	
	url = "https://" + ip + "/api/node/mo/uni/tn-" + tenant + "/out-" + l3out + "/instP-" + extepg + "/extsubnet-[" + subnet + "].json"
	json = { 
		"l3extSubnet":
		{
				"attributes":
				{ 
						"dn":"uni/tn-" + tenant + "/out-" + l3out + "/instP-" + extepg + "/extsubnet-[" + subnet + "]",
						"ip":subnet,"aggregate":"",
						"rn":"extsubnet-[" + subnet + "]",
						"status":"created"
				},
		"children":[]
		}
	}	

	response = requests.post("%s" % (url), cookies=cookie, json=json,verify=False,  timeout=10)

	if response.status_code == 200:
                print ("OK: Subnet %s added to external EPG %s " % (subnet,extepg))
	else:
		if bool(re.search("already exists",response.json()["imdata"][0]['error']['attributes']['text'])):
			print ("WARNING: Subnet %s already defined as a static route" % (subnet))
		else:
			print (response.json())


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
		opts,args = getopt.getopt(argv,"l:c:ht:a:",["l3out=","creds=","help","tenant","contract"])
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
			if opt in ("-a","--contract"):
				sgcontract = arg
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
		sgcontract
	except NameError:
		print ("SG contract not specified (-a|--contract)")
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

		extepg = getextepg(l3out,f_ip,cookie,tenant)

		if len(subnets) == 0:
			print ("WARNING: No subnets found in Node profiles for L3Out %s, still adding contracts to ext EPG and adding ext EPG to Preferred group" % l3out)	
		else:
			sorted_subnets = sorted(set(subnets))
			for s in sorted_subnets:
				add_subnet(s,f_ip,cookie,tenant,extepg,l3out)

		remove_quad_zero(f_ip,cookie,tenant,extepg,l3out)
		add_extepg_to_pg(tenant,l3out,extepg,f_ip,cookie)

		extepgcontracts = getextepgcontracts(l3out,f_ip,cookie,tenant,extepg)
		addextepgcontracts(l3out,f_ip,cookie,tenant,extepg,sgcontract)
		removeextepgcontracts(l3out,f_ip,cookie,tenant,extepg,extepgcontracts,sgcontract)

	else:
		print ("Failed to get Node Profile for L3Out: %s" % l3out)

if __name__ == '__main__':
		main(sys.argv[1:])
