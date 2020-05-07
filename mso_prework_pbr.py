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
		print ("OK: Completed")
	else:
		print ("ERROR: Could not update schema data for schema: %s, template: %s, BD: %s" %(schema,template,bd))
		print (response.json())
		sys.exit(9)

def add_bd(data,schema_index,template_index,schema_id,bd_name,template_name,vrf_name,gw_ip,all_sites,add_to_template,add_to_site):
	
	# create BD input file format: Schema_Name,template_name,bd_name,vrf_name,gw_ip
	bdRef = '/schemas/' + schema_id + '/templates/' + template_name + '/bds/' + bd_name
	vrfRef =  '/schemas/' + schema_id + '/templates/' + template_name + '/vrfs/' + vrf_name

	if add_to_template is True:
		# template update

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

	if add_to_site is True:
		# add to sites
		for i in all_sites:
			sch_idx =  i[0]
			site_idx = i[1]

			data['schemas'][sch_idx]['sites'][site_idx]['bds'].append({

				'bdRef' : bdRef,
				'subnets' : [],
				'l3Outs' : []
			})

def add_contract(data,schema_index,template_index,schema_id,template_name,contract_name,filter_name,add_to_template,add_to_site,all_sites):
	
	# create contract input file format: Schema_Name,template_name,contract_name,filter_name

	contractRef = '/schemas/' + schema_id + '/templates/' + template_name + '/contracts/' + contract_name
	filterRef =  '/schemas/' + schema_id + '/templates/' + template_name + '/filters/' + filter_name

	if add_to_template is True:
		# template update

		data['schemas'][schema_index]['templates'][template_index]['contracts'].append({

			'name': contract_name,
			'displayName' : contract_name,
			'contractRef' : contractRef,
			'filterRelationships' : [{
							'filterRef' : filterRef,
							'directives' : [
										'none'
							]
			}],
			'scope' : 'context',
			'subjectName' : 'Permit_Any',
			'filterType' : 'bothWay',
			'filterRelationshipsProviderToConsumer' : [],
			'filterRelationshipsConsumerToProvider' : []
		})

	if add_to_site is True:
		# add to sites
		for i in all_sites:
			sch_idx =  i[0]
			site_idx = i[1]

			data['schemas'][sch_idx]['sites'][site_idx]['contracts'].append({

				'contractRef' : contractRef,
			})
		

def add_filter(data,schema_index,template_index,schema_id,filter_name,template_name):

	filterRef = '/schemas/' + schema_id + '/templates/' + template_name + '/filters/' + filter_name

	data['schemas'][schema_index]['templates'][template_index]['filters'].append({
		
		'name' : filter_name,
		'displayName' : filter_name,
		'entries' : [{
			
				'name' : filter_name,
				'displayName' : filter_name,
				'description' : '',
				'etherType' : 'unspecified',
				'arpFlag' : 'unspecified',
				'ipProtocol' : 'unspecified',
				'matchOnlyFragments' : False,
				'stateful' : False,
				'sourceFrom' : 'unspecified',
				'sourceTo' : 'unspecified',
				'destinationFrom' : 'unspecified',
				'destinationTo' : 'unspecified',
				'tcpSessionRules' : [
							'unspecified'
				]
		}]
	})			
	

def add_sg(data,schema_index,template_index,schema_id,sg_name,template_name,tenant,l4l7device,all_sites,add_to_template,add_to_site):
	
	# create SG input file format: Schema_Name,template_name,sg_name,tenant,l4l7device

	sgRef = '/schemas/' + schema_id + '/templates/' + template_name + '/serviceGraphs/' + sg_name
	snRef =  '/schemas/' + schema_id + '/templates/' + template_name + '/serviceGraphs/' + sg_name + '/' + 'serviceNodes/node1'
	device = 'uni/tn-' + tenant + '/lDevVip-' + l4l7device

	if add_to_template is True:
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
	if add_to_site is True:
		for i in all_sites:
			sch_idx =  i[0]
			site_idx = i[1]
			data['schemas'][sch_idx]['sites'][site_idx]['serviceGraphs'].append({

				'serviceGraphRef' : sgRef,
				'serviceNodes' : [{
					'serviceNodeRef' : snRef,
					'device' : 
						{ 
							'dn' : device 
						}
				}]
			})

def main(argv):

	ip = '192.168.1.138'
	username = 'admin'
	password = 'We!come2msc!'
	schema_name = 'RES-DST-SCH-Local'
	template_name = 'RES-DST-TMP-DC1'
	vrf_name = 'MMP'
	bd_name = 'BD-FW'
	gw_ip = '1.1.1.1/24'
	sg_name = 'SG-FW'
	tenant = 'Restricted'
	l4l7device = 'L4L7'
	filter_name = 'default'
	contract_name = 'APIContractName'

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
	#print (json.dumps(data))
	#sys.exit(9)	
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

	# Add BD 
	
	add_bd_vals_templ = True	
	for bds in data['schemas'][schema_index]['templates'][template_index]['bds']:
		if bds['displayName'] == bd_name:
			print ("OK: BD " + bd_name + " exists in template " + template_name + " - no need to create")
			add_bd_vals_templ = False
			break

	# If BD does not exist, add it to the template ONLY for now
	if add_bd_vals_templ is True:
		add_bd(data,schema_index,template_index,schema_id,bd_name,template_name,vrf_name,gw_ip,all_sites,add_bd_vals_templ,False)
		print ("OK: BD " + bd_name + " being added to template " + template_name)

	# Check for BD at the site - if not there, create it.	
	for i in all_sites:
		add_bd_vals_site = True
        
		sch_idx =  i[0]
		site_idx = i[1]
	
		for bds in data['schemas'][sch_idx]['sites'][site_idx]['bds']:
			if bds['bdRef'] == "/schemas/" + schema_id + "/templates/" + template_name + "/bds/" + bd_name:
				print ("OK: BD " + bd_name + " exists in site - no need to create")
				add_bd_vals_site = False

		if add_bd_vals_site is True:
			print ("OK: BD " + bd_name + " being added to site")
			add_bd(data,schema_index,template_index,schema_id,bd_name,template_name,vrf_name,gw_ip,all_sites,False,add_bd_vals_site)

	# Add SG Template at template level
	add_sgt_vals_templ = True	
	for sgt in data['schemas'][schema_index]['templates'][template_index]['serviceGraphs']:
		if sgt['displayName'] == sg_name:
			print ("OK: SG Template " + sg_name + " exists in template " + template_name + " - no need to create")
			add_sgt_vals_templ = False

	if add_sgt_vals_templ is True:	
		add_sg(data,schema_index,template_index,schema_id,sg_name,template_name,tenant,l4l7device,all_sites,add_sgt_vals_templ,False)
		print ("OK: SG Template " + sg_name + " being added to template " + template_name)

	# Check for SGT at site level	
	for i in all_sites:
		add_sgt_vals_site = True
        
		sch_idx =  i[0]
		site_idx = i[1]
	
		for sgt in data['schemas'][sch_idx]['sites'][site_idx]['serviceGraphs']:
			if sgt['serviceGraphRef'] == "/schemas/" + schema_id + "/templates/" + template_name + "/serviceGraphs/" + sg_name:
				print ("OK: SG Template " + sg_name + " exists in site " + template_name + " - no need to create")
				add_sgt_vals_site = False

		if add_sgt_vals_site is True:
			print ("OK: SG Template " + sg_name + " being added to site")
			add_sg(data,schema_index,template_index,schema_id,sg_name,template_name,tenant,l4l7device,all_sites,False,add_sgt_vals_site)

	# Add filters
	add_filter_vals = True
	
	for filters in data['schemas'][schema_index]['templates'][template_index]['filters']:
		if filters['displayName'] == filter_name:
			print ("OK: Filter " + filter_name + " exists in template " + template_name + " - no need to create")
			add_filter_vals = False
			break

	if add_filter_vals is True:
		print ("OK: Filter " + filter_name + " being added to template " + template_name)
		add_filter(data,schema_index,template_index,schema_id,filter_name,template_name)


	# Create Contracts
	# Add contracts
	add_contract_vals = True
	
	for contracts in data['schemas'][schema_index]['templates'][template_index]['contracts']:
		if contracts['displayName'] == contract_name:
			print ("OK: Contract " + contract_name + " exists in template " + template_name + " - no need to create")
			add_contract_vals = False
			break

	if add_contract_vals is True:

		add_contract(data,schema_index,template_index,schema_id,template_name,contract_name,filter_name,add_contract_vals,False,all_sites)
		print ("OK: Contract " + contract_name + " being added to template " + template_name)
		#cut_over_contract_epgs(data,schema_index,template_index,schema_id,contract_name,filter_name,bdRef,sg_name)

	# Check for contracts at site level	
	for i in all_sites:
		add_contracts_vals_site = True
        
		sch_idx =  i[0]
		site_idx = i[1]
	
		for contracts in data['schemas'][sch_idx]['sites'][site_idx]['contracts']:
			if contracts['contractRef'] == "/schemas/" + schema_id + "/templates/" + template_name + "/contracts/" + contract_name:
				print ("OK: Contract " + contract_name + " exists in site  - no need to create")
				add_contracts_vals_site = False

		if add_contracts_vals_site is True:
			print ("OK: Contract " + contract_name + " being added to site")
			add_contract(data,schema_index,template_index,schema_id,template_name,contract_name,filter_name,False,add_contracts_vals_site,all_sites)

	put_schema_data(token,base_url,data['schemas'][schema_index],schema_name,template_name,bd_name,schema_id)
	#data = get_schema_data(token,base_url)
	#print (json.dumps(data))
	sys.exit(9)
				

if __name__ == '__main__':
        main(sys.argv[1:])
