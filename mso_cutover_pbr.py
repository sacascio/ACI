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

def add_contract_to_sgt(data,schema_index,template_index,schema_id,template_name,contract_name,sg_name,add_to_template,add_to_site,all_sites,contract_index,bd,tenant,l4l7device,pbrpol,clusterInt):
	
	# create contract input file format: Schema_Name,template_name,contract_name,filter_name,sg_name,bd,tenant,l4l7device,pbrpol,clusterInt

	serviceGraphRef = '/schemas/' + schema_id + '/templates/' + template_name + '/serviceGraphs/' + sg_name
	serviceNodeRef = serviceGraphRef + "/serviceNodes/node1"
	serviceGraphContractRelationRef = '/schemas/' + schema_id + '/templates/' + template_name + '/contracts/' + contract_name + "/serviceGraphs/" + sg_name
	bdRef = '/schemas/' + schema_id + '/templates/' + template_name + '/bds/' + bd
	dnCluster = "uni/tn-" + tenant + "/lDevVip-" + l4l7device + "/lIf-" + clusterInt
	dnRedirectPolicy = "uni/tn-" + tenant + "/svcCont/svcRedirectPol-" + pbrpol

	if add_to_template is True:
		# template update

		data['schemas'][schema_index]['templates'][template_index]['contracts'][contract_index].update({

			'serviceGraphRelationship': {
							'serviceGraphRef' : serviceGraphRef,
							'serviceGraphContractRelationRef' : serviceGraphContractRelationRef,
							'serviceNodesRelationship' : [{
												'serviceNodeRef' :  serviceNodeRef,
												'providerConnector' : { 
															'connectorType' : 'general',
															'bdRef' : bdRef
												},
												'consumerConnector' : { 
															'connectorType' : 'general',
															'bdRef' : bdRef
												}
							}]
			}
		})

	if add_to_site is True:
		# add to sites
		for i in all_sites:
			sch_idx =  i[0]
			site_idx = i[1]

			data['schemas'][sch_idx]['sites'][site_idx]['contracts'][contract_index].update({
			
				'serviceGraphRelationship': {
								'serviceGraphRef' : serviceGraphRef,
								'serviceNodesRelationship' : [{
													'serviceNodeRef' :  serviceNodeRef,
													'providerConnector' : { 
																'clusterInterface' : {
																	 'dn' : dnCluster
																},
																'redirectPolicy' : {
																	'dn'  : dnRedirectPolicy 
																}
													},
													'consumerConnector' : { 
																'clusterInterface' : {
																	 'dn' : dnCluster
																},
																'redirectPolicy' : {
																	'dn'  : dnRedirectPolicy 
																}
													}
								}]
				}

				
			})
		
def update_contracts(data,schema_index,template_index,schema_id,template_name,EPGName,ExtEPG,tenant,ap,contract_name):

	contractRef = '/schemas/' + schema_id + '/templates/' + template_name + '/contracts/' + contract_name

	# Update EPG on the template - no site update required

	for anp in data['schemas'][schema_index]['templates'][template_index]['anps']:
		if anp['displayName'] == ap:
			for epgs in anp['epgs']:
				if epgs['displayName'] == EPGName:
					epgs['contractRelationships'] = [{
										'relationshipType' : 'provider',
										'contractRef' : contractRef
					}]
									

	# Update Ext EPG on the template - no site update required

	for extepg in data['schemas'][schema_index]['templates'][template_index]['externalEpgs']:
		if extepg['displayName'] == ExtEPG:
			extepg['contractRelationships'] = [{
								'relationshipType' : 'consumer',
								'contractRef' : contractRef
			}]
	
def main(argv):

	ip = '192.168.1.138'
	username = 'admin'
	password = 'We!come2msc!'
	schema_name = 'RES-DST-SCH-Local'
	template_name = 'RES-DST-TMP-DC1'
	vrf_name = 'MMP'
	bd_name = 'BD-FW'
	sg_name = 'SG-FW'
	tenant = 'Restricted'
	l4l7device = 'L4L7'
	pbrpol = 'PBR'
	clusterInt = 'Cluster'
	filter_name = 'default'
	contract_name = 'APIContractName'
	EPGName = 'Dummy'
	ExtEPG = 'epL3Out_RES-MMP-DC1-GIS'
	all_sites = []
	ap = 'Restricted'

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



	# Assign SG Template to SG contract
	add_sgt_to_contract = False
	
	for idx,contracts in enumerate(data['schemas'][schema_index]['templates'][template_index]['contracts']):
		if contracts['displayName'] == contract_name:
			print ("OK: Assigning SG Template " + sg_name + " to template " + template_name)
			add_sgt_to_contract = True
			add_contract_to_sgt(data,schema_index,template_index,schema_id,template_name,contract_name,sg_name,add_sgt_to_contract,False,all_sites,idx,bd_name,tenant,l4l7device,pbrpol,clusterInt)
			break

	if add_sgt_to_contract is False:
		print ("ERROR: Unable to find contract " + contract_name  + " in template " + template_name)
		sys.exit(9)

	# Check for contracts at site level	
	found_atleast_one = False 
	for i in all_sites:
		add_sgt_to_contract = False
		sch_idx =  i[0]
		site_idx = i[1]
	
		for idx,contracts in enumerate(data['schemas'][sch_idx]['sites'][site_idx]['contracts']):
			if contracts['contractRef'] == "/schemas/" + schema_id + "/templates/" + template_name + "/contracts/" + contract_name:
				print ("OK: Assigning SG Template " + sg_name + " to site ")
				add_sgt_to_contract = True
				found_atleast_one = True
				add_contract_to_sgt(data,schema_index,template_index,schema_id,template_name,contract_name,sg_name,False,add_sgt_to_contract,all_sites,idx,bd_name,tenant,l4l7device,pbrpol,clusterInt)

	if found_atleast_one is False:
		print ("ERROR: Could not find a site to assign SG template " + sg_name + " to Contract " + contract_name)
		sys.exit(9)

	
	# Update contract association on EPG/ExtEPG
	update_contracts(data,schema_index,template_index,schema_id,template_name,EPGName,ExtEPG,tenant,ap,contract_name)

	put_schema_data(token,base_url,data['schemas'][schema_index],schema_name,template_name,bd_name,schema_id)
	data = get_schema_data(token,base_url)
	sys.exit(9)
				

if __name__ == '__main__':
        main(sys.argv[1:])
