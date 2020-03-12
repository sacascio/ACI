#!/usr/bin/env python
from ciscoconfparse import CiscoConfParse
import re
import json
import sys

#def get_inner_outer_mapping(n7k):

# return : local port, remote port, remote n7k name as dictionary
def get_bgp_int_vlan(dc,district):

    data = {}

    if district.lower() in ('sde'):
    	numfiles = ['1','2']
    else:
    	numfiles = ['1','2','3','4']

    for i in numfiles:
	for j in ['inner','outer']:
		filename = dc + district + 'nxc' + str(i) + district + j + '.log'
		n7k = dc + district + 'nxc' + str(i) + district + j 
		
		# Need to code this
		#n7k_mapping = get_inner_outer_mapping(n7k)
	
	  	data[filename] = {}	
		print filename
		parse = CiscoConfParse(filename)

		# GET SVI
		for obj in parse.find_objects("interface Vlan"):
			if obj.hash_children != 0:
				for c in obj.children:
					if bool((re.search('vrf member',c.text,re.IGNORECASE))):
						svi = obj.text
						svi = svi.replace("interface Vlan","")
						vrf = c.text
						vrf = vrf.replace("vrf member ","")
						vrf = vrf.lstrip()
						data[filename][vrf] = {}
						data[filename][vrf] = { 'svi' : svi, 'shutdown' : 'N', 'fw_trunk_int' : [], 'remote_as' : 'N/A', 'neighbors' : []}

		# GET FW INT
		vlallowed = []
		for obj in parse.find_objects("interface Ethernet"):
			if obj.hash_children != 0:
				if obj.re_search_children("switchport trunk allowed"):
					for c in obj.children:
						if bool((re.search('switchport trunk allowed',c.text,re.IGNORECASE))):
							fwint = obj.text
							fwint = fwint.replace("interface Ethernet","")
							c.text = c.text.replace("switchport trunk allowed vlan","")
							vlist = c.text.split(",")
							for v in vlist:
								if bool((re.search('-',v,re.IGNORECASE))):
									vv = v.split("-")
									vv[1] = int(vv[1]) + int(1)
									for vvv in xrange(int(vv[0]),int(vv[1])):
										vlallowed.append(vvv) 
								else:
									vlallowed.append(int(v))

							for vls in vlallowed:
								for vrf_vals in data[filename]:
				
									if vls == int(data[filename][vrf_vals]['svi']):
										if len(data[filename][vrf_vals]['fw_trunk_int']) == 0:
											data[filename][vrf_vals]['fw_trunk_int']  = [ fwint ]
										else:
											data[filename][vrf_vals]['fw_trunk_int'].append(fwint)
							vlallowed = []
							
    		# Get BGP Neighbors		
		for obj in parse.find_objects("router bgp"):
                        if obj.hash_children != 0:
				# For inner VDC
                                if obj.re_search_children("vrf"):
                                        for c in obj.children:
                                                if bool((re.search('vrf',c.text,re.IGNORECASE))):
							vrfmember = c.text
							for obj2 in parse.find_objects(vrfmember):
								if obj2.re_search_children("neighbor"):
									for d in obj2.children:
										vrfmember = vrfmember.replace("vrf ","") 
										vrfmember = vrfmember.lstrip()
										if bool((re.search('address-family',d.text,re.IGNORECASE))):
											continue
										if bool((re.search('NonAff',vrfmember,re.IGNORECASE))):
											continue
										attribs = d.text
										attribs = attribs.lstrip()
										attribsx = attribs.split(" ")
										neighbor = attribsx[1]
										remote_as = attribs[3]
                                                                                data[filename][vrfmember]['remote_as']  = remote_as
										if len(data[filename][vrfmember]['neighbors']) == 0:
                                                                                        data[filename][vrfmember]['neighbors']  = [ neighbor ]
                                                                                else:
                                                                                        data[filename][vrfmember]['neighbors'].append(neighbor)
							
    print json.dumps(data)


get_bgp_int_vlan('dc2','sde')



