#!/usr/bin/env python3

import sys
import requests
import json

requests.packages.urllib3.disable_warnings()

def get_schema_data(token,base_url):

	schema_url = base_url + '/schemas'
	headers = { 'Authorization' : 'Bearer %s' % token }
	response = requests.get(schema_url, headers=headers, verify=False, timeout=10)
	if response.status_code == 200:
		return response.json()
	else:
		print ("ERROR: Could not get schema data")
		sys.exit(9)

def put_schema_data(token,base_url,data,schema,template,bd,schema_id):
	
	schema_url = base_url + '/schemas/' + schema_id
	headers = { 'Authorization' : 'Bearer %s' % token }
	response = requests.put(schema_url, headers=headers, json=data,verify=False, timeout=10)

	if response.status_code == 200:
		print (response.json())
	else:
		print ("ERROR: Could not update schema data for schema: %s, template: %s, BD: %s" %(schema,template,bd))
		print (response.json())
		sys.exit(9)

def add_bd(data,schema_index,template_index,schema_id,bd_name,template_name,vrf_name,gw_ip):
	
	# create BD input file format: Schema_Name,template_name,bd_name,vrf_name,gw_ip

	# template update
	bdRef = '/schemas/' + schema_id + '/templates/' + template_name + '/bds/' + bd_name
	vrfRef =  '/schemas/' + schema_id + '/templates/' + template_name + '/vrfs/' + vrf_name

	data['schemas'][schema_index]['templates'][template_index]['bds'].append({

			'name': bd_name,
			'displayName' : bd_name,
			'bdRef' : bdRef,
			'l2UnknownUnicast' : 'proxy',
			'subnets' : [{
				'ip' : gw_ip,
				'scope' : 'private',
				'shared' : False,
				'noDefaultGateway' : False
			}],
			'intersiteBumTrafficAllow' : False,
			'l2Stretch' : True,
			'vrfRef' : vrfRef
	})

def add_sg(data,schema_index,template_index,schema_id,sg_name,template_name,all_sites):
	
	# create SG input file format: Schema_Name,template_name,sg_name

	sgRef = '/schemas/' + schema_id + '/templates/' + template_name + '/serviceGraphs/' + sg_name
	snRef =  '/schemas/' + schema_id + '/templates/' + template_name + '/serviceGraphs/' + sg_name + '/' + 'serviceNodes/node1'

	data['schemas'][schema_index]['templates'][template_index]['serviceGraphs'].append({

			'name': sg_name,
			'displayName' : sg_name,
			'serviceGraphRef' : sgRef,
			'description' : '',
			'serviceNodes' : [{
					'name' : 'node1',
					'serviceNodeRef' : snRef,
					'serviceNodeTypeId' : '0000ffff0000000000000051',
					'index' : 1
			}]
	})

	# Site update

def main(argv):

	ip = '192.168.1.138'
	username = 'admin'
	password = 'We!come2msc!'
	schema_name = 'RES-DST-SCH-Local'
	template_name = 'RES-DST-TMP-DC1'
	vrf_name = 'DST'
	bd_name = 'TestAPI'
	gw_ip = '1.1.1.1/24'
	sg_name = 'TestAPISG'
	all_sites = []

	base_url = 'https://' + ip + '/api/v1'
	headers = { "username" : username, "password" : password }

	response = requests.post(base_url + "/auth/login", json=headers, verify=False, timeout=10)
	if response.status_code != 201:
		print ("Login failed to MSO: " + ip + ".  Please check IP and credentials.")
		sys.exit(9)
	else:
		token = response.json()['token']
	
	data = get_schema_data(token,base_url)
	
	for i,j in enumerate(data['schemas']):
		if j['displayName'] == schema_name:
			schema_id = j['id']
			schema_index = i
			break
	try:
		schema_id
	except NameError:
		print ("ERROR: Could not get schema id for schema " + schema_name)
		sys.exit(9)	

	for t,templates in enumerate(data['schemas'][schema_index]['templates']):
		if templates['displayName'] == template_name:
			template_index = t
			break

	for sch_index,site in enumerate(data['schemas']):
		for site_index,sites in enumerate(site['sites']):
			if sites['templateName'] == template_name:
				all_sites.append([sch_index,site_index])

	# May not need this.  getting it just in case
	tenant_id = templates['tenantId']		

	#add_bd(data,schema_index,template_index,schema_id,bd_name,template_name,vrf_name,gw_ip,all_sites)
	#add_sg(data,schema_index,template_index,schema_id,sg_name,template_name)
	print (json.dumps(data))
	#put_schema_data(token,base_url,data['schemas'][schema_index],schema_name,template_name,bd_name,schema_id)
	sys.exit(9)
				

if __name__ == '__main__':
        main(sys.argv[1:])
