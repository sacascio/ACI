#!/usr/bin/env python
from ciscoconfparse import CiscoConfParse
import re
import json

def get_bgp_int_vlan(dc,district):

    data = {}

    if district.lower() in ('sde'):
    	numfiles = ['1','2']
    else:
    	numfiles = ['1','2','3','4']

    for i in numfiles:
	for j in ['inner','outer']:
		filename = dc + district + 'nxc' + str(i) + district + j + '.log'
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
						vrf = vrf.replace("vrf member","")
						data[filename][vrf] = {}
						data[filename][vrf] = { 'svi' : svi, 'shutdown' : 'N', 'fw_trunk_int' : []}

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
    print json.dumps(data)


get_bgp_int_vlan('dc2','sde')



