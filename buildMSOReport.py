#!/usr/bin/env python3
import sys
import json



def loadSites(sitefile) :

	siteData = {}

	with open (sitefile) as site:
		data = json.load(site)

	for i in data:
		siteID =  i['_id']['$oid']
		siteName = i['name']

		siteData[siteID] = siteName

	return siteData

def loadTenants(tenantfile) :

	tenantData = {}

	with open (tenantfile) as tenant:
		data = json.load(tenant)

	for i in data:
		tenantID =  i['_id']['$oid']
		tenantName = i['name']

		tenantData[tenantID] = tenantName

	return tenantData

def loadSchemas(schemafile,tenantData,siteData) :

	schemaData = {}

	with open (schemafile) as schema:
		data = json.load(schema)

	for i in data:
		schemaID =  i['_id']['$oid']
		schemaName = i['displayName']

		if schemaID not in schemaData:
			schemaData[schemaID] = {}
		else:
			print ("WARNING: Schema ID %s already found for schema Name %s" % (schemaID,schemaName))

		if schemaName not in schemaData[schemaID]:
			schemaData[schemaID][schemaName] = {}
		else:
			print ("WARNING: Schema name %s already found in schema ID %s" % (schemaName,schemaID))

		for j in i['templates']:
			templateName = j['name']
			tenantName = tenantData[j['tenantId']]						
			schemaData[schemaID][schemaName][templateName] = {}

			schemaData[schemaID][schemaName][templateName]['bd'] = []
			schemaData[schemaID][schemaName][templateName]['vrf'] = []
			schemaData[schemaID][schemaName][templateName]['tenant'] = []
			schemaData[schemaID][schemaName][templateName]['anp'] = []
			schemaData[schemaID][schemaName][templateName]['sites'] = []
			schemaData[schemaID][schemaName][templateName]['epgs'] = []
			schemaData[schemaID][schemaName][templateName]['tenant'].append(tenantName)

			if len(j['bds']) != 1:
				print ("WARNING: %s BD's found in schema %s, template %s" % (len(j['bds']), schemaName, templateName))
			
			if len(j['anps']) != 1:
				print ("WARNING: %s ANP's found in schema %s, template %s" % (len(j['anps']), schemaName, templateName))

			for k in j['anps']:
				anpName = k['name']
			
				schemaData[schemaID][schemaName][templateName]['anp'].append(anpName)	
				
				if k['anpRef']['schemaId'] != schemaID:
					print ("WARNING: Schema ID for schema %s in ANPREF of template %s not the same as schemaID found previously" % (schemaName,templateName))

				if k['anpRef']['templateName'] != templateName:
					print ("WARNING: Template name %s in ANPREF is not the same as template Name found previously" % (templateName))
				
				if k['anpRef']['anpName'] != anpName:
					print ("WARNING: ANP name %s in ANPREF in template %s is not the same as ANP Name found previously" % (anpName,templateName))

				for l in k['epgs']:
					epgName = l['name']
				
					schemaData[schemaID][schemaName][templateName]['epgs'].append(epgName)	

					if l['epgRef']['schemaId'] != schemaID:
						print ("WARNING: Schema ID for schema %s in EPGREF of template %s not the same as schemaID found previously" % (schemaName,templateName))
				
					if l['epgRef']['templateName'] != templateName:
						print ("WARNING: Template name %s in EPGREF is not the same as template Name found previously" % (templateName))
					
					if l['epgRef']['anpName'] != anpName:
						print ("WARNING: ANP name %s in EPGREF is not the same as ANP Name found previously" % (anpName))
					
					if l['epgRef']['epgName'] != epgName:
						print ("WARNING: EPG name %s in EPGREF is not the same as EPG Name found previously" % (epgName))
				
			for k in j['bds']:
				bdName = k['name']
				schemaData[schemaID][schemaName][templateName]['bd'].append(bdName)

				if k['bdRef']['schemaId'] != schemaID:
					print ("WARNING: Schema ID for schema %s in BDREF of template %s not the same as schemaID found previously" % (schemaName,templateName))

				if k['bdRef']['templateName'] != templateName:
					print ("WARNING: Template name %s in BDREF is not the same as template Name found previously" % (templateName))
				
				if k['bdRef']['bdName'] != bdName:
					print ("WARNING: BD name %s in BDREF in template %s is not the same as BD Name found previously" % (bdName,templateName))

				vrf = k['vrfRef']['vrfName']
				schemaData[schemaID][schemaName][templateName]['vrf'].append(vrf)

		for j in i['sites']:
			siteName = siteData[j['siteId']]
			siteTemplateName = j['templateName'] 

			if siteTemplateName not in schemaData[schemaID][schemaName]:
				print ("WARNING: Site template name %s not found in list of templates" %(siteTemplateName))	
			
			else:
				schemaData[schemaID][schemaName][siteTemplateName]['sites'].append(siteName)

			if len(j['anps']) != 1:
				print ("WARNING: %s ANP's found in schema %s, template %s IN SITE section" % (len(j['anps']), schemaName, templateName))

			for k in j['anps']:

				if k['anpRef']['schemaId'] != schemaID:
					print ("WARNING: Schema ID for schema %s in ANPREF of template %s not the same as schemaID found previously" % (schemaName,templateName))
				
				if k['anpRef']['templateName'] != siteTemplateName:
					print ("WARNING: Template name %s in ANPREF is not the same as template Name found previously" % (templateName))
				
				if k['anpRef']['anpName'] != anpName:
					print ("WARNING: ANP name %s in ANPREF in template %s is not the same as ANP Name found previously" % (anpName,templateName))
				
			# finish EPG section in SITES
			# add check for VRF length (template and site section)
			# add check for BDs	
	return schemaData


def main(argv):

	siteData = loadSites('site.json')
	tenantData = loadTenants('tenant.json')
	schemaData = loadSchemas('schema.json',tenantData, siteData)
	#print (json.dumps(schemaData))	

if __name__ == '__main__':
	main(sys.argv[1:])
