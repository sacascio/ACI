#!/usr/bin/env python

import openpyxl
import shutil
import sys
import getopt
import os.path
import re
from IPy import IP
#from xlrd import open_workbook, XLRDError
import json
#from fileinput import filename
import warnings

warnings.filterwarnings("ignore")
def get_sw_prof_name(dafe_file,leafid):
    worksheets = []
    wb = openpyxl.load_workbook(dafe_file, data_only=True)

    for sheet in wb:
        worksheets.append(sheet.title)
    wb.close()

    wb.active = worksheets.index('leaf_switch_profile')
    ws = wb.active
    row_start = ws.min_row
    row_end   = ws.max_row

    for x in range(row_start+1,row_end+1):
	cell = 'E' + str(x)
        id = ws[cell].value	

	if int(id) == int(leafid):
		cell =  'A' + str(x)
		prof = ws[cell].value
		break

    try:
	prof
    except NameError:
	print "Could not find switch profile for leaf ID " + str(leafid)
	prof = 'N/A'

    return prof
	

def fix_type_x(write_to_aci_cfg):
	vrf_type = {}
	for tenant in write_to_aci_cfg:
		for vrf in write_to_aci_cfg[tenant]:
			for epg in write_to_aci_cfg[tenant][vrf]:
				for e in write_to_aci_cfg[tenant][vrf][epg]:
					if e['type'] != 'X':
						tenant_vrf_type_key = tenant + "-" + vrf 
						vrf_type[tenant_vrf_type_key] = e['type']
						continue

	for tenant in write_to_aci_cfg:
                for vrf in write_to_aci_cfg[tenant]:
                        for epg in write_to_aci_cfg[tenant][vrf]:
                                for e in write_to_aci_cfg[tenant][vrf][epg]:
                                        if e['type'] == 'X':
						tenant_vrf_type_key = tenant + "-" + vrf
						e.update({'type' : vrf_type[tenant_vrf_type_key]})


def usage():
    print "Usage: " +  sys.argv[0] + " -v|--vrf -e|--epg -d|--district <soe, gis or sde> -c|--datacenter <dc1 or dc2> -f|file <inputfile>"
    print ""
    print "-f|--file:   Pass input file to use for configuration.   Must use -v or -e option when using -f (not both v and e)"
    print " if using -v, format is: tenant,vrf one per line.  ex: Control,PTD"
    print " if using -e, format is: epg one per line.  ex: SVC-ITC-DC2-SDE-AD"
    print "-e|--epg: indicates input file is a list of EPGs"
    print "-v|--vrf: indicates input file is a list of VRFs"
    print "-d|--district: indicates district name, must be <SOE|GIS|SDE>"
    print "-c|--datacenter: indicates datacenter name, must be <DC1 or DC2>"
    print "-h|--help: print help message"
    sys.exit(1)
    

def getValueWithMergeLookup(sheet, cell):
    for m_range in sheet.merged_cell_ranges:
        merged_cells = list(openpyxl.utils.rows_from_range(m_range))
        for row in merged_cells:
            if cell in row:
                return sheet.cell(merged_cells[0][0]).value

def get_pc_params(dafe_file):
			
    worksheets = []
    wb = openpyxl.load_workbook(dafe_file, data_only=True)

    for sheet in wb:
        worksheets.append(sheet.title)
    wb.close()

    wb.active = worksheets.index('pc_vpc_interface_policy_group')
    ws = wb.active
    row_start = ws.min_row
    row_end   = ws.max_row

    for x in range(row_start+1,row_end+1):
            cell = 'A' + str(x)
            name = ws[cell].value

	    if bool((re.search('^pc_',name,re.IGNORECASE))) and bool((re.search('downlink',name,re.IGNORECASE))):
		cell = 'E' + str(x)
                aepname = ws[cell].value

		aepname = aepname.replace("uni/infra/attentp-","")

		cell = 'F' + str(x)
                linkpolname = ws[cell].value

		cell = 'G' + str(x)
                cdppolname = ws[cell].value
		
		cell = 'H' + str(x)
                lldpolname = ws[cell].value
		
		cell = 'I' + str(x)
                stpolname = ws[cell].value
		
		cell = 'J' + str(x)
                lacpolname = ws[cell].value
		
		cell = 'M' + str(x)
                mcpolname = ws[cell].value
		
		try:
        		aepname
    		except NameError:
			aepname = 'N/A'
        		print "ERROR: Could not get AEP name for PC policy group creation"
		
		try:
        		linkpolname
    		except NameError:
			linkpolname = 'N/A'
        		print "ERROR: Could not get link policy name for PC policy group creation"
		
		try:
        		cdppolname
    		except NameError:
			cdppolname = 'N/A'
        		print "ERROR: Could not get CDP policy name for PC policy group creation"
		
		try:
        		lldpolname
    		except NameError:
			lldpolname = 'N/A'
        		print "ERROR: Could not get LLDP policy name for PC policy group creation"
		
		try:
        		stpolname
    		except NameError:
        		stpolname = 'N/A'
        		print "ERROR: Could not get STP policy name for PC policy group creation"
		
		try:
        		lacpolname
    		except NameError:
        		lacpolname = 'N/A'
    		except NameError:
        		print "ERROR: Could not get LACP policy name for PC policy group creation"
		
		try:
        		mcpolname
    		except NameError:
        		mcpolname = 'N/A'
        		print "ERROR: Could not get MCP policy name for PC policy group creation"

		break

    return (aepname,linkpolname,cdppolname,lldpolname,stpolname,lacpolname,mcpolname)

def get_epg_from_vrf(dafe_file,vrfs):

    worksheets = []
    wb = openpyxl.load_workbook(dafe_file, data_only=True)
    epgs = []
    bds = []
    found = 0

    for sheet in wb:
        worksheets.append(sheet.title)
    wb.close()

    wb.active = worksheets.index('bridge_domain')
    ws = wb.active
    row_start = ws.min_row
    row_end   = ws.max_row

    for v in vrfs:
	vs = v.split(",")
	if len(vs) != 2:
		print "ERROR: Check input file, must be in format <tenant,vrf>, found %s" % v
		sys.exit(9)
        tenant = vs[0]
        vrf = vs[1]
        vrf = vrf.rstrip()
    	
	for x in range(row_start,row_end+1):
            cell = 'C' + str(x)
            tenantvalue = ws[cell].value

            cell = 'D' + str(x)
            vrfvalue = ws[cell].value
	    
            if tenantvalue == tenant and vrfvalue == vrf:
		cell = 'A' + str(x)
                bdvalue = ws[cell].value
		bds.append(bdvalue)
		found = 1
     
        if found == 0: 
        	print "ERROR: Could not find any BD for Tenant: %s, VRF: %s" % (tenant,vrf)
		sys.exit(9)
	else:
	    found = 0 
    
    wb.active = worksheets.index('epg')
    
    ws = wb.active
    row_start = ws.min_row
    row_end   = ws.max_row
    
    for b in bds:
    	for x in range(row_start,row_end+1):
            cell = 'E' + str(x)
            bdvalue = ws[cell].value
	
	    if bdvalue == b:
		epgs.append(b)
		found = 1

	if found == 0:
		print "ERROR: Could not find any EPGs for BD: %s" % (bd)
                sys.exit(9)
	else:
		found = 0       

    return epgs

def get_vrf_to_fw(zones_vl_ip_file,dc,district):

    worksheets = []
    wb = openpyxl.load_workbook(zones_vl_ip_file, data_only=True)
    vrf_to_fw = {}
    fw_to_vrf = {}

    for sheet in wb:
        worksheets.append(sheet.title)
    wb.close()

    wb.active = worksheets.index('SOE_SDE_GIS_VRF_RT_Definition')
    ws = wb.active
    row_start = ws.min_row
    row_end   = ws.max_row

    for x in range(row_start,row_end+1):
        cell = 'A' + str(x)
        districtvalue = getValueWithMergeLookup(ws,cell)
        if districtvalue == district.upper():
    		cell = 'B' + str(x)
        	tenant = getValueWithMergeLookup(ws,cell)
		if tenant is None:
			tenant = ws[cell].value
		if tenant == 'Tn_NonAff':
			continue
    		cell = 'C' + str(x)
		vrf = ws[cell].value
		if vrf == 'N/A':
			continue
		if vrf is not None:
			cell = 'E' + str(x)
			firewall = ws[cell].value 

			cell = 'I' + str(x)
			vrfmember = ws[cell].value
		
			cell = 'P' + str(x)
			outerencap = getValueWithMergeLookup(ws,cell)
		
			if outerencap is None:
				outerencap = ws[cell].value

			if vrfmember == 'N/A':
				continue		
		
			if dc == 'dc2':
				firewall = firewall.replace('dc1','dc2')
			
			# One off - ACI config has Audit/DDT -Zones vlans and IPs has Audit/DAT.  Changing to what ACI has
			if tenant == 'Audit' and vrf == 'DAT':
				vrf = 'DDT'

			# Another One off - ACI config has Audit/DDT -Zones vlans and IPs has Audit/DAT.  Changing to what ACI has
			if tenant == 'User Access':
				tenant = 'User_Access'
	
                	if tenant in vrf_to_fw:
				vrf_to_fw[tenant][vrf] = {}
                        	vrf_to_fw[tenant][vrf] = { 'firewall' : firewall, 'encap' : outerencap, 'to_delete' : 0 }
			else:
				vrf_to_fw[tenant] = {}
				vrf_to_fw[tenant][vrf] = {}
               			vrf_to_fw[tenant][vrf] = { 'firewall' : firewall, 'encap' : outerencap, 'to_delete' : 0 }

			#print "District %s, Tenant %s, VRF %s, Firewall: %s" % (district,tenant,vrf, firewall)

    for tenant in vrf_to_fw:
	for vrf in vrf_to_fw[tenant]:
		firewall = vrf_to_fw[tenant][vrf]['firewall']
		outerencap = vrf_to_fw[tenant][vrf]['encap']
		if firewall in fw_to_vrf:
			fw_to_vrf[firewall].append({'tenant' : tenant, 'vrf' : vrf, 'to_delete' : 0 , 'encap' : outerencap})
		else:
			fw_to_vrf[firewall] = {}
			fw_to_vrf[firewall] =   [{ 'tenant' : tenant, 'vrf' : vrf, 'to_delete' : 0, 'encap' : outerencap  }]
    
    return vrf_to_fw,fw_to_vrf

def get_all_epg_from_dafe(tenant,vrf,file):

    worksheets = []
    bd = []
    epgl = []
    wb = openpyxl.load_workbook(file, data_only=True)

    for sheet in wb:
        worksheets.append(sheet.title)
    wb.close()
    
    wb.active = worksheets.index('bridge_domain')
    ws = wb.active
    row_start = ws.min_row
    row_end   = ws.max_row

    for x in range(row_start,row_end+1):
    	cell = 'C' + str(x)
        tenantvalue = ws[cell].value
    	
	cell = 'D' + str(x)
        vrfvalue = ws[cell].value
	
	cell = 'K' + str(x)
        l3routingvalue = ws[cell].value

	#if tenantvalue == tenant and vrfvalue == vrf and l3routingvalue == 'yes':
	if tenantvalue == tenant and vrfvalue == vrf:
    		cell = 'A' + str(x)
        	bdvalue = ws[cell].value
		bd.append(bdvalue)

    wb.active = worksheets.index('epg')

    ws = wb.active
    row_start = ws.min_row
    row_end   = ws.max_row

    for x in range(row_start,row_end+1):
	cell = 'E' + str(x)
        bdvalue = ws[cell].value	

	if bdvalue in bd:
		cell = 'A' + str(x)
        	epgvalue = ws[cell].value	
		epgl.append(epgvalue)
    return epgl

def get_epg_type(epg):

    worksheets = []
    wb = openpyxl.load_workbook("VRF_EPG_Counts.xlsx", data_only=True)

    for sheet in wb:
        worksheets.append(sheet.title)
    wb.close()

    if bool((re.search('sde',epg,re.IGNORECASE))):
                tab = 'SDE'
    if bool((re.search('gis',epg,re.IGNORECASE))):
                tab = 'GIS'
    if bool((re.search('soe',epg,re.IGNORECASE))):
                tab = 'SOE'

    wb.active = worksheets.index(tab)
    ws = wb.active
    row_start = ws.min_row
    row_end   = ws.max_row

    for x in range(row_start,row_end+1):
                cell = 'C' + str(x)
                value = ws[cell].value
                if value == epg:
                        cell = 'D' + str(x)
		        type = ws[cell].value
			continue
     
    for x in range(row_start,row_end+1):
                cell = 'I' + str(x)
                value = ws[cell].value
                if value == epg:
                        cell = 'J' + str(x)
		        type = ws[cell].value
			continue

    wb.close()
    try:
	type
    except NameError:
	#print "WARNING: EPG %s not found in VRF_EPG_Counts.xlsx" % epg
	type='X'
    
    return type

def get_data(filename,epgs,dc):

    # Get Pre-Build data

    worksheets = []
    pre_build = {}

    wb2 = openpyxl.load_workbook("DCT_SDE_PBR_Firewalls_Cabling&P2P_Info_2020_02_24.xlsx", data_only=True)

    for sheet in wb2:
        worksheets.append(sheet.title)
    wb2.close() 

    wb2.active = worksheets.index('P2P')

    ws2 = wb2.active
    row_start = ws2.min_row
    row_end   = ws2.max_row
    
    for x in range(row_start+1,row_end+1):
    	cell = 'A' + str(x)
        fwvalue = ws2[cell].value
	
	if fwvalue is not None:
		fw = fwvalue[:-1]
		fwa = fw + 'a'
		fwb = fw + 'b'

	cell = 'G' + str(x)
        vrfmember = ws2[cell].value 

	if vrfmember is not None:
		cell = 'B' + str(x)
        	vlan = ws2[cell].value
		z = vlan.split('.')
		vlan = z[1]
		
		cell = 'C' + str(x)
        	fwbdsubnet = ws2[cell].value
		
		cell = 'D' + str(x)
        	fwvip = ws2[cell].value
		
		cell = 'K' + str(x)
        	bdip = ws2[cell].value
	
		if vlan is None:
			print "WARNING: No VLAN Found for Security Zone %s" % vrfmember
		if not vlan.isnumeric():
			print "WARNING: VLAN ID not valid.  %s given." % vlan
		else:
			if int(vlan) > 4096:
				print "WARNING: Invalid VLAN range given.  %s given." % vlan

		try:
                    IP(fwvip)
                except:
                    print "WARNING: Firewall IP %s for Security Zone %s not valid" % (fwvip,vrfmember)

		try:
                    IP(bdip)
                except:
                    print "WARNING: New FW Bridge Domain IP %s for Security Zone %s not valid" % (bdip,vrfmember)
		
		try:
                    IP(fwbdsubnet)
                except:
                    print "WARNING: New FW Bridge Domain Subnet address %s for Security Zone %s not valid" % (fwbdsubnet,vrfmember)
	
		pre_build[vrfmember] = ({
					'fwa': fwa,
					'fwb': fwb,
					'vlan' : vlan,
					'fwvip' : fwvip,
					'fwbdsubnet' : fwbdsubnet,
					'bdip' : bdip,
					'leafa' : 'N/A',
					'leafb' : 'N/A',
					'leafa_int' : [],
					'leafb_int' : [],
					})

		
    worksheets = []

    wb2 = openpyxl.load_workbook("DCT PBR FIrewalls_Cisco.xlsx", data_only=True)

    for sheet in wb2:
        worksheets.append(sheet.title)
    wb2.close()

    wb2.active = worksheets.index(dc.upper())

    ws2 = wb2.active
    row_start = ws2.min_row
    row_end   = 21
   
    for x in range(row_start+1,row_end+1):
	intf_range = []
        cell = 'A' + str(x)
        fwvalue = ws2[cell].value
	cell = 'H' + str(x)
        leaf = ws2[cell].value
        
	cell = 'J' + str(x)
        leaf_int = ws2[cell].value
	i = leaf_int.split(' - ')
	low = i[0]
        high = i[1]
	lowa = low.split("/")
	higha = high.split("/")
	for ii in range(int(lowa[1]),int(higha[1])+1):
		intf_range.append(str(lowa[0]) + "/" + str(ii))

	for vrfmember in pre_build:
		if pre_build[vrfmember]['fwa'] == fwvalue:
			pre_build[vrfmember]['leafa'] = leaf
			pre_build[vrfmember]['leafa_int'] = intf_range
		if pre_build[vrfmember]['fwb'] == fwvalue:
			pre_build[vrfmember]['leafb'] = leaf
			pre_build[vrfmember]['leafb_int'] = intf_range
    

    ########

    worksheets = []
    write_to_aci_cfg = {}

    wb = openpyxl.load_workbook(filename, data_only=True)

    for sheet in wb:
        worksheets.append(sheet.title) 
    wb.close()

    for epg in epgs:
	epg = epg.rstrip()
    	# From EPG tab, get bridge domain name
    	wb.active = worksheets.index('epg')

    	ws = wb.active
    	row_start = ws.min_row
    	row_end   = ws.max_row
        
    	# Get Bridge Domain
    	for x in range(row_start,row_end+1):
        	cell = 'A' + str(x)
        	value = ws[cell].value 
		if value == epg:
			bdcell = 'E' + str(x)
			bd = ws[bdcell].value
			
			apcell = 'D' + str(x)
			ap = ws[apcell].value
			continue

	try:
		bd
	except NameError:
		print "ERROR: BD Not found for EPG %s.  Please check dafe output" % epg
	        sys.exit(9)
		continue
	
	try:
		ap
	except NameError:
		print "ERROR: AppProfile Not found for EPG %s.  Please check dafe output" % epg
	        sys.exit(9)
		continue

			
    	#From bridge domain tab, get tenant, vrf and L2/L3 Y or N
    	wb.active = worksheets.index('bridge_domain')
	ws = wb.active

	row_start = ws.min_row
        row_end   = ws.max_row
        
        for x in range(row_start,row_end+1):
                cell = 'A' + str(x)
                value = ws[cell].value
                if value == bd:
                        tenant        = ws['C' + str(x)].value
                        vrf           = ws['D' + str(x)].value
                        l3routing     = ws['K' + str(x)].value
                        continue
	
        try:
                tenant
        except NameError:
                print "ERROR: tenant Not found for EPG %s.  Check dafe file" % epg
		sys.exit(9)
        
	try:
                vrf
        except NameError:
                print "ERROR: vrf Not found for EPG %s.  Check dafe file" % epg
		sys.exit(9)

	try:
               l3routing 
        except NameError:
                print "ERROR: l3routing Not found for EPG %s.  Check dafe file" % epg
		sys.exit(9)


	# Get BD Subnet
	wb.active = worksheets.index('bd_subnet')

        ws = wb.active
        row_start = ws.min_row
        row_end   = ws.max_row

        for x in range(row_start,row_end+1):
                cell = 'C' + str(x)
                bdvalue = ws[cell].value
                
		cell = 'D' + str(x)
                tenantvalue = ws[cell].value
                
		if bdvalue == bd and tenantvalue == tenant:
                        bdsubnetcell = 'A' + str(x)
                        bd_subnet = ws[bdsubnetcell].value

        try:
                bd_subnet
        except NameError:
                print "ERROR: BD Subnet Not found for EPG %s.  Please check dafe output" % epg
                sys.exit(9)
                continue

 
    	#From vrf tab, get vrf member name, using tenant and vrf from bridge_domain tab
    	# Can use this for naming other constructs and getting L3OUT name
	wb.active = worksheets.index('vrf')
        ws = wb.active

        row_start = ws.min_row
        row_end   = ws.max_row

        for x in range(row_start,row_end+1):
                cell = 'A' + str(x)
                vrfvalue = ws[cell].value
                
		cell = 'B' + str(x)
                tenantvalue = ws[cell].value
                if vrfvalue == vrf and tenantvalue == tenant:
                        vrfmember = ws['H' + str(x)].value
                        continue

        try:
                vrfmember
        except NameError:
                print "ERROR: vrf member name Not found for EPG %s.  Check dafe file" % epg
		sys.exit(9)
  

	# Get L3Out name, using vrf member pre-pended with 'L3Out' - this is a good assumption
	# updated to use tab bd_l3out to get L3out
	wb.active = worksheets.index('bd_l3out')
        ws = wb.active

        row_start = ws.min_row
        row_end   = ws.max_row

        for x in range(row_start,row_end+1):
                cell = 'A' + str(x)
                bdvalue = ws[cell].value

                cell = 'B' + str(x)
                tenantvalue = ws[cell].value

                if bdvalue == bd and tenantvalue == tenant:
			cell = 'C' + str(x)
			l3out = ws[cell].value

        try:
                l3out
        except NameError:
                #print "ERROR: l3out name Not found for EPG %s.  Check dafe file" % epg
		l3out = 'N/A'

	 
    	# Get EPG consumed contracts.  For the EPG, put contracts into an array
	wb.active = worksheets.index('epg_consumed_contract')
        ws = wb.active
	epg_c_contracts = []

        row_start = ws.min_row
        row_end   = ws.max_row

        for x in range(row_start,row_end+1):
                cell = 'C' + str(x)
                epgvalue = ws[cell].value

                if epgvalue == epg :
                        cell = 'D' + str(x)
                        contract = ws[cell].value
			epg_c_contracts.append(contract)

	if len(epg_c_contracts) == 0 and l3routing == 'yes':
		print "ERROR: No consumed contracts found for EPG %s, moving on to the next EPG" % epg

    	# Get EPG provided contracts.  For the EPG, put contracts into an array

	wb.active = worksheets.index('epg_provide_contract')
        ws = wb.active
        epg_p_contracts = []

        row_start = ws.min_row
        row_end   = ws.max_row

        for x in range(row_start,row_end+1):
                cell = 'C' + str(x)
                epgvalue = ws[cell].value

                if epgvalue == epg :
                        cell = 'D' + str(x)
                        contract = ws[cell].value
                        epg_p_contracts.append(contract)

        if len(epg_p_contracts) == 0 and l3routing == 'yes':
                print "ERROR: No provide contracts found for EPG %s, moving on to the next EPG" % epg	 

    	# External EPG name from L3Out name along with provided and consumed contract, which have to be split by comma
	wb.active = worksheets.index('external_epg')
        ws = wb.active
        l3out_c_contracts = []
        l3out_p_contracts = []

        row_start = ws.min_row
        row_end   = ws.max_row

	# Get External EPG Name
        for x in range(row_start,row_end+1):
                cell = 'B' + str(x)
                l3outvalue = ws[cell].value
                
		cell = 'A' + str(x)
                tenantvalue = ws[cell].value

                if l3outvalue == l3out and tenantvalue == tenant:
                        cell = 'D' + str(x)
                        externalepg = ws[cell].value

        try:
                externalepg
        except NameError:
                externalepg = 'N/A'
		#print "ERROR: external EPG name Not found for EPG %s.  Check dafe file" % epg
		#sys.exit(9)

	# Now get contracts on the external EPG
        for x in range(row_start + 1,row_end+1):
                cell = 'B' + str(x)
                l3outvalue = str(ws[cell].value)
		if l3outvalue == l3out:
                	cell = 'G' + str(x)
                	ccontracts = str(ws[cell].value)
			l3out_c_contracts = ccontracts.split(",")
                	cell = 'I' + str(x)
                	pcontracts = str(ws[cell].value)
			l3out_p_contracts = pcontracts.split(",")
			continue

	# Got all the contract info for the EPG, now identify the ones to remove or are an issue:
	# On EPG, if contract is on EPG prov/cons and in L3out as provider and consumer, list it for removal
	contracts_to_remove = []
	for c in epg_c_contracts:
		if c in l3out_c_contracts and c in l3out_p_contracts and c in epg_p_contracts:
			contracts_to_remove.append(c)

		if l3out == 'N/A' and l3routing == 'yes':
			print "WARNING: EPG %s is part of BD %s, which is not assigned to an L3 Out.  Please confirm if this EPG should be included" % (epg,bd)
	
		# On EPG, if on consumer but not provider, print warning
		if c not in epg_p_contracts:
			print "WARNING: Contract %s not in EPG %s as provider" % (c,epg)
		
                # If contract is not on L3out as provider and consumer, print warning
                if c not in l3out_p_contracts and c not in l3out_c_contracts and externalepg != 'N/A':
                        print "WARNING: Contract %s not in external EPG %s as consumer or provider for epg %s" % (c,externalepg,epg)
		
		# On EPG, if on consumer but only on either provider or consumer of L3out, print warning
		if c not in l3out_c_contracts and c in l3out_p_contracts and externalepg != 'N/A':
			print "WARNING: Contract %s not in external EPG %s as consumer, but exists on external EPG %s as provider" % (c,externalepg)
		if c in l3out_c_contracts and c not in l3out_p_contracts:
			print "WARNING: Contract %s exists on external EPG %s as consumer, but not on external EPG %s as provider" % (c,externalepg)

	# Repeat checks for EPG provider
	# no need to check if EPG provider contract exists on EPG consumer and l3out as provider/consumer - done already
	for p in epg_p_contracts:
        
                # On EPG, if on provider but not consumer, print warning
                if p not in epg_c_contracts:
                        print "WARNING: Contract %s not in EPG %s as consumer" % (p,epg)
                
                # If contract is not on L3out as provider and consumer, print warning
                if p not in l3out_p_contracts and p not in l3out_c_contracts and externalepg != 'N/A':
                        print "WARNING: Contract %s not in external EPG %s as consumer or provider" % (p,externalepg)
        
                # On EPG, if on provider but only on either provider or consumer of L3out, print warning
                if p not in l3out_c_contracts and c in l3out_p_contracts and externalepg != 'N/A':
                        print "WARNING: Contract %s not in external EPG %s as consumer, but exists on external EPG %s as provider" % (p,externalepg)
                if p in l3out_c_contracts and p not in l3out_p_contracts:
                        print "WARNING: Contract %s exists on external EPG %s as consumer, but not on external EPG %s as provider" % (p,externalepg)

        # Get  VRF to EPG list - will check to make sure we got it all
        # if the argument passed to the script is by VRF, no need to check, we got it all and inner N7K config can be removed

	# Get Type A or Type B.  Look at file VRF_EPG_Counts	
	type = get_epg_type(epg)	

	# Write to dictionary for printing config files
	if tenant not in write_to_aci_cfg:
		write_to_aci_cfg[tenant] = {}
	if vrf not in write_to_aci_cfg[tenant]:
		write_to_aci_cfg[tenant][vrf] = {}

	write_to_aci_cfg[tenant][vrf][epg] = {}

	# One off - rename AUD-DDT to AUD-DAT temporarily
	if bool((re.search('AUD-DDT',vrfmember,re.IGNORECASE))):
		vrfmember = vrfmember.replace('DDT','DAT')

	if vrfmember in pre_build:
		vlan = pre_build[vrfmember]['vlan']
		fwvip = pre_build[vrfmember]['fwvip']
		fwbdip = pre_build[vrfmember]['bdip']
		fwbdsubnet = pre_build[vrfmember]['fwbdsubnet']
		leafa = pre_build[vrfmember]['leafa']
		leafb = pre_build[vrfmember]['leafb']
		fwa = pre_build[vrfmember]['fwa']
		fwb = pre_build[vrfmember]['fwb']
		leafa_int = pre_build[vrfmember]['leafa_int']
		leafb_int = pre_build[vrfmember]['leafb_int']

	else:
		print "WARNING: Could not find pre build work for VRF Member %s " % vrfmember
		vlan = 'N/A'
		fwvip = 'N/A'
		fwbdip = 'N/A'
		fwbdsubnet = 'N/A'
		leafa = 'N/A'
		leafb = 'N/A'
		fwa = 'N/A'
		fwb = 'N/A'
		leafa_int = 'N/A'
		leafb_int = 'N/A' 

	if bool((re.search('AUD-DAT',vrfmember,re.IGNORECASE))):
		vrfmember = vrfmember.replace('DAT','DDT')
	
	write_to_aci_cfg[tenant][vrf][epg] = [{

						'bd' : bd,
						'l3' : l3routing,
						'vrfmember' : vrfmember,
						'l3out' : l3out,
						'extepg' : externalepg,
						'type' : type,
						'ap'   : ap,
						'fwbdsubnet' : fwbdsubnet,
						'vrf'  : vrf,
						'bd_subnet' : bd_subnet,
						'remove_l3_contract' : 'yes',
						'contract' : contracts_to_remove,
						'curr_c_contracts' : epg_c_contracts,
						'curr_p_contracts' : epg_p_contracts,
						'remove_n7k_inner_config' : 'yes',
						'remove_n7k_outer_config' : 'yes',
						'vlan' : vlan,
						'fwbdname' : 'N/A',
						'fwvip' : fwvip,
						'fwbdip' : fwbdip,
						'leafa' : leafa,
						'leafb' : leafb,
						'leafa_int' : leafa_int,
						'leafb_int' : leafb_int,
						'fwaname'    : fwa, 
						'fwbname'    : fwb,
						'l4l7'       : 'N/A',
						'sgtname'       : 'N/A',
						'pbrname'       : 'N/A',
						'sgcontractname'       : 'N/A',
						'fwcluster' : 'N/A'
				     	      }]



	"""	
	print "Tenant: %s" % tenant	
	print "EPG: %s" % epg
	print "BD: %s" % bd
	print "VRF: %s" % vrf
	print "L3 BD: %s" % l3routing
	print "VRF Member: %s" % vrfmember
	print "L3Out: %s" % l3out
	print "External EPG: %s" % externalepg
	print "Type: %s" % type
	print "Contracts to remove:"
	print contracts_to_remove
	print "********"
	print 
	print 
	print
        """ 
        del tenant
	del epg	
	del bd
	del vrf
	del l3routing
	del vrfmember
	del l3out
	del epg_c_contracts
	del epg_p_contracts
	del externalepg
	del l3out_c_contracts
	del l3out_p_contracts
	del contracts_to_remove
	del type 
	del vlan
        del fwvip
        del fwbdip
        del fwbdsubnet
        del leafa
        del leafb
        del fwa
        del fwb
        del leafa_int
        del leafb_int

   
    return write_to_aci_cfg

def main(argv):
    # Arguments
    if len(argv) == 0:
        usage()
    
    try:
        opts,args = getopt.getopt(argv,"d:c:f:h",["district=","datacenter=","file=","help"])
    except getopt.GetoptError as err:
        print str(err)
        sys.exit(2)
    else:
        for opt,arg in opts:
            if opt in ("-h","--help"):
                usage()
            if opt in ("-d","--district"):
                district = arg
            if opt in ("-c","--datacenter"):
                dc = arg
            if opt in ("-f","--file"):
                infile = arg
    try:
	district
    except NameError:
	print "District option not passed (-d|--district)"
        sys.exit(9)
    
    try:
	infile	
    except NameError:
	print "Input file not passed (-f|--file)"
        sys.exit(9)
    
    try:
	dc
    except NameError:
	print "Datacenter option not passed (-c|--datacenter)"
        sys.exit(9)
	    
    if district.upper() not in ('SDE','GIS','SOE'):
	print "ERROR: District must be SOE, GIS, SDE - one of these values"
	sys.exit(9)
    
    if dc.upper() not in ('DC1','DC2'):
	print "ERROR: DataCenter must be DC1 or DC2 - one of these values"
	sys.exit(9)

    if not os.path.isfile(infile):
        print sys.argv[0] + " Input File %s NOT found" % infile
        sys.exit(9)

 
    dafe_file = dc.upper() + "_" + district.upper() + "_DAFE.xlsx"

    with open (infile) as f:
	epgs = f.readlines()
	numparams = epgs[0].split(",")

    # If theres no comma in the input, its by EPG. 
    # if theres 1 comma, its by VRF

    if len(numparams) == 1:
    	with open (infile) as f:
		epgs = f.readlines()

    if len(numparams) == 2:
	with open (infile) as f:
		vrfs = f.readlines()
		epgs = get_epg_from_vrf(dafe_file,vrfs)	

    (aepname,linkpolname,cdppolname,lldpolname,stpolname,lacpolname,mcpolname) = get_pc_params(dafe_file)
    
    write_to_aci_cfg = get_data(dafe_file,epgs,dc)
    vrf_to_fw,fw_to_vrf = get_vrf_to_fw("Zones Vlans and IPs_2.42.xlsx",dc,district)
 
    # Checks
    # 1. all EPGs migrated in VRF for the input file? Y or N - Will determine if the n7K inner config gets modified
    for tenant in write_to_aci_cfg:
    	missing_from_input_file = []
    	missing_from_dafe = []
    	epglist = []
	
	for vrf in write_to_aci_cfg[tenant]:
		
		for e in write_to_aci_cfg[tenant][vrf]:
			epglist.append(e)

	
		# Get EPG list from DAFE output
        	dafe_epg = get_all_epg_from_dafe(tenant,vrf,dafe_file)
      
		for e in dafe_epg:
			if e not in epglist:
				missing_from_input_file.append(e)
	
		for e in epglist:
			if e not in dafe_epg:
				missing_from_dafe.append(e)

		if len(missing_from_dafe) > 0:
			print "ERROR: The following EPGs provided are not in tenant %s, vrf %s" % ( tenant, vrf )
			for e in missing_from_dafe:
				print e

		if len(missing_from_input_file) > 0:
			print "WARNING: The following EPGs in tenant %s, vrf %s are not being migrated.  Inner and outer VDC config should not be modified and contract on L3Out should not be removed" % ( tenant, vrf )
			for e in missing_from_input_file:
				print e

			# find out which tenant this EPG is in and set all the EPGs in that tenant to remove_n7k_*_config to no
			for tenant in write_to_aci_cfg:
				for vrf in write_to_aci_cfg[tenant]:
					for ep in write_to_aci_cfg[tenant][vrf]:
				 		for a in write_to_aci_cfg[tenant][vrf][ep]:
							 a['remove_l3_contract'] = 'no'	
							 a['remove_n7k_inner_config'] = 'no'
							 a['remove_n7k_outer_config'] = 'no'
					
		else:
			# All inner is being migrated, remove the tenant/VRF from the list of fw_to_epg for the outer, then check this later on to see if all VRFs are removed from FW
			# Write N7K Config here
			print "OK: Inner config can be removed for tenant %s, vrf %s" % (tenant,vrf)
			vrf_to_fw[tenant][vrf]['to_delete'] = 1

		epglist = []
        	dafe_epg = []
		missing_from_dafe = []
		missing_from_input_file = []
    

    # Check what's left in the outer config
    found = 0
   
    outer_encap = {}

    for tenant in vrf_to_fw:
	for vrf in vrf_to_fw[tenant]:
		encap = vrf_to_fw[tenant][vrf]['encap']
		to_delete = vrf_to_fw[tenant][vrf]['to_delete']
		if encap in outer_encap:
			outer_encap[encap].append({'tenant' : tenant, 'vrf' : vrf , 'to_delete' : to_delete })
		else:
			outer_encap[encap] = {}
			outer_encap[encap] = [{ 'tenant' : tenant, 'vrf' : vrf , 'to_delete' : to_delete  }]
    
    for tenant in write_to_aci_cfg:
	for vrf in write_to_aci_cfg[tenant]:
    		for encap in outer_encap:
			for e in outer_encap[encap]:
				if e['tenant'] == tenant and e['vrf'] == vrf:
					encap_found = encap
					is_delete =  e['to_delete']
		if is_delete == 1:
			for e in outer_encap[encap_found]:
				if e['to_delete'] == 0 :
					print "WARNING: Outer Config for encap %s for tenant %s, vrf %s Cannot be removed.  Tenant/VRF %s/%s exists " % (encap_found,tenant,vrf,e['tenant'],e['vrf'])
					found = 1
			if found == 0:
				print "OK: Outer Encap: %s for tenant/vrf %s/%s can be removed" % (encap_found,tenant,vrf)
			else:
				found = 0
				
    # Write ACI configs
    # Constraints
    # Can't remove contract from L3Out if all EPG's aren't being migrated

    # Fix EPGs/VRFs that have type = 'X'
    fix_type_x(write_to_aci_cfg)

    # Associate leaf interfaces to PC and create leaf selectors.  Already done, not needed for 3/13.  Again check previous files

    # Check if output dir exists - if not, create it
    # if exists, delete it and re-create it

    dir_path = './output'
    
    if os.path.isdir(dir_path):
	shutil.rmtree(dir_path)
	os.mkdir(dir_path)
	os.mkdir(dir_path + "/" + "PRE_WORK")
   

    # Pre work
    # Create port channel  and interface selectors
    pc_creation = {} 
    for tenant in write_to_aci_cfg:
        for vrf in write_to_aci_cfg[tenant]:
                for epg in write_to_aci_cfg[tenant][vrf]:
                        for d in write_to_aci_cfg[tenant][vrf][epg]: 
				pca_key = d['fwaname']
				if d['fwaname'] == 'N/A':
					print "WARNING: No firewall information found for EPG: " + epg
					continue
				pca_key = 'pc_' + pca_key + ":" + aepname + ":" + linkpolname + ":" + cdppolname + ":" + lldpolname + ":" + stpolname + ":" + lacpolname + ":" + mcpolname
				
				pcb_key = d['fwbname']
				pcb_key = 'pc_' + pcb_key + ":" + aepname + ":" + linkpolname + ":" + cdppolname + ":" + lldpolname + ":" + stpolname + ":" + lacpolname + ":" + mcpolname
				if pca_key in pc_creation:
					continue
				else:
					pc_creation[pca_key] = { 'leafid' : d['leafa'], 'intf' : d['leafa_int']}
				
				if pcb_key in pc_creation:
					continue
				else:
					pc_creation[pcb_key] = {'leafid' : d['leafb'], 'intf' : d['leafb_int']}


    f = open(dir_path + "/" + "PRE_WORK/3.6  - Create port channel interface policy group for the new firewall connections.csv", "a") 
    f.write("PC_PG,LINK,CDP,MCP,LLDP,BPDU,LACP,AEP" + '\n')
    f.close()
    
    f = open(dir_path + "/PRE_WORK/3.7 - Create int selectors and associate leaf interfaces to port channel interface policy group.csv", "a") 
    f.write("INTPROFILE,PC_POLICY,PORT,PN" + '\n')
    f.close()
    
    for pc_key in pc_creation:
	tmp = pc_key.split(':')
	pgname = tmp[0]
	link = tmp[2]
	cdppol = tmp[3]
	mcp_pol = tmp[7]
	lldppol = tmp[4]
	stppol = tmp[5]
   	lacppol = tmp[6]
	aeppol = tmp[1]
	leafid = pc_creation[pc_key]['leafid']
	intf = pc_creation[pc_key]['intf']

	swprofname = get_sw_prof_name(dafe_file,leafid)

        f = open(dir_path + "/PRE_WORK/3.6  - Create port channel interface policy group for the new firewall connections.csv", "a") 
    	f.write(pgname + "," + link + "," + cdppol + "," + mcp_pol + "," + lldppol + "," + stppol + "," + lacppol + "," + aeppol + '\n')
    	f.close()
        
	f = open(dir_path + "/PRE_WORK/3.7 - Create int selectors and associate leaf interfaces to port channel interface policy group.csv", "a") 
	for n in intf:
		i = n.split("/")
		portnum = i[1]
		selector = "E_" + i[0] + "_" + portnum
    		f.write(swprofname + "," +  pgname + "," + selector + "," + portnum + '\n')
    	f.close()

    # 3.8 to 3.14 - Create new construct names, save it and access it later 
   
    for tenant in write_to_aci_cfg:
        for vrf in write_to_aci_cfg[tenant]:
		for epg in write_to_aci_cfg[tenant][vrf]:
			for d in write_to_aci_cfg[tenant][vrf][epg]:
				tshortname = epg.split("-")
				tenantshort = tshortname[0]
				shortfirewall = d['fwaname']
				shortfirewall = shortfirewall[:-1]
				fwbdname = tenantshort + "-" + vrf + "-BD-" + dc.upper() + "-" + district.upper() + "-FW"
				if bool((re.search('C-',fwbdname,re.IGNORECASE))) :
					fwbdname = fwbdname.replace("C-","C_")
			
				d.update({'fwbdname' : fwbdname})

				# Create L4L7 name and update dictionary
				l4l7name = tenantshort + "-" + vrf + "-L4L7-" + shortfirewall.upper()
				d.update({'l4l7' : l4l7name})

				# Create service graph template name and update dictionary
				sgtname = tenantshort + "-" + vrf + "-SG-" + dc.upper() + "-" + district.upper() 
				d.update({'sgtname' : sgtname})

				# Create PBR name and update dictionary
				pbrname = tenantshort + "-" + vrf + "-PBR-" + shortfirewall.upper()
				d.update({'pbrname' : pbrname})

				# Create contract name and update dictionary
				sgcontractname = tenantshort + "-" + vrf + "-SG-PBR-Permit_Any"
				d.update({'sgcontractname' : sgcontractname})
				
				# update FW cluster name
				d.update({'fwcluster' : shortfirewall.upper()})

    # Prepare all the headers for the pre-work files
    f = open(dir_path + "/PRE_WORK/3.8 - Create a bridge domain for the policy-based routing policy.csv", "a")
    f.write("TENANT,BD,SUBNET,VRF" + '\n')
    f.close()

    f = open(dir_path + "/PRE_WORK/3.9 - Create the L4-L7 device.csv", "a")
    f.write("TENANT,FW,DEVICE1,LEAF_ID1,PC_NAME1,DEVICE2,LEAF_ID2,PC_NAME2,PHYS_DOMAIN,VLANID,CLUSTER" + '\n')
    f.close()
    
    f = open(dir_path + "/PRE_WORK/3.10 - Create the service graph template.csv", "a")
    f.write("TENANT,SGNAME,FW" + '\n')
    f.close()
    
    f = open(dir_path + "/PRE_WORK/3.11 - Create the policy-based redirect policies.csv", "a")
    f.write("TENANT,PBRNAME,REDIRECTIP,REDIRECTMAC" + '\n')
    f.close()
    
    f = open(dir_path + "/PRE_WORK/3.12 - Create a new contract with the Service Graph name defined as the subject.csv", "a" )
    f.write("TENANT,CONTRACT_NAME,SUBJECT" + '\n')
    f.close()
    
    f = open(dir_path + "/PRE_WORK/3.13 - Create device selection policy.csv", "a")
    f.write("TENANT,CONTRACT_NAME,SGNAME,NODENAME,FW,BD,PBR_POLICY,CLUSTER" + '\n')
    f.close()
    
    f = open(dir_path + "/PRE_WORK/3.14  - Assign the L4-L7 service graph to the new contract in the contract subject.csv", "a" )
    f.write("TENANT,CONTRACT_NAME,SGNAME,SUBJECT" + '\n')
    f.close()

    # Write the configs
    for tenant in write_to_aci_cfg:
        for vrf in write_to_aci_cfg[tenant]:
                for epg in write_to_aci_cfg[tenant][vrf]:
			fwbdname =  write_to_aci_cfg[tenant][vrf][epg][0]['fwbdname']
			sgtname =  write_to_aci_cfg[tenant][vrf][epg][0]['sgtname']
			fwbdip   =  write_to_aci_cfg[tenant][vrf][epg][0]['fwbdip']
			fwvip   =  write_to_aci_cfg[tenant][vrf][epg][0]['fwvip']
			l4l7name = write_to_aci_cfg[tenant][vrf][epg][0]['l4l7']
			leafid_a = write_to_aci_cfg[tenant][vrf][epg][0]['leafa']
			leafid_b = write_to_aci_cfg[tenant][vrf][epg][0]['leafb']
			pbrname = write_to_aci_cfg[tenant][vrf][epg][0]['pbrname']
			sgcontractname = write_to_aci_cfg[tenant][vrf][epg][0]['sgcontractname']
			fwaname = write_to_aci_cfg[tenant][vrf][epg][0]['fwaname']
			fwbname = write_to_aci_cfg[tenant][vrf][epg][0]['fwbname']
			fwcluster = write_to_aci_cfg[tenant][vrf][epg][0]['fwcluster']
			vlan = write_to_aci_cfg[tenant][vrf][epg][0]['vlan']
			fwbdsubnetmask_t = write_to_aci_cfg[tenant][vrf][epg][0]['fwbdsubnet'].split("/")
			fwbdsubnetmask =  fwbdsubnetmask_t[1]	
			f = open(dir_path + "/PRE_WORK/3.8 - Create a bridge domain for the policy-based routing policy.csv", "a")
			f.write(tenant +  "," + fwbdname + "," + fwbdip + "/" + fwbdsubnetmask + "," + vrf + '\n')
			f.close()
			
			f = open(dir_path + "/PRE_WORK/3.9 - Create the L4-L7 device.csv", "a")
			f.write(tenant +  "," + l4l7name + "," + fwaname.upper() + "," + str(leafid_a) + "," + "pc_" + fwaname + "," + fwbname.upper() + "," + str(leafid_b) + "," + "pc_" + fwbname + "," + dc.upper() + "_" + district.upper() + "_" + "PHYS_DOM" "," + vlan + "," + fwcluster +   '\n')
			f.close()
			
			f = open(dir_path + "/PRE_WORK/3.10 - Create the service graph template.csv", "a")
			f.write(tenant +  "," + sgtname + "," + l4l7name + '\n')
			f.close()
			
			f = open(dir_path + "/PRE_WORK/3.11 - Create the policy-based redirect policies.csv", "a")
			f.write(tenant +  "," + pbrname + "," + fwvip + "," + '\n')
			f.close()
			
			f = open(dir_path + "/PRE_WORK/3.12 - Create a new contract with the Service Graph name defined as the subject.csv", "a")
			f.write(tenant +  "," + sgcontractname + "," + "Permit_Any" + '\n')
			f.close()
			
			f = open(dir_path + "/PRE_WORK/3.13 - Create device selection policy.csv", "a")
			f.write(tenant +  "," + sgcontractname + "," + sgtname + "," + "N1," + l4l7name + "," + fwbdname + "," + pbrname + "," + fwcluster  + '\n')
			f.close()
			
			f = open(dir_path + "/PRE_WORK/3.14  - Assign the L4-L7 service graph to the new contract in the contract subject.csv", "a")
			f.write(tenant +  "," + sgcontractname + "," + sgtname + "," + "Permit_Any"  + '\n')
			f.close()
			break
     
    for tenant in write_to_aci_cfg:
	for vrf in write_to_aci_cfg[tenant]:
		for epg in write_to_aci_cfg[tenant][vrf]:
			dirname = epg.split("-")
			tenantdir = dirname[0]
			os.mkdir(dir_path + "/" + tenantdir + "-" + vrf)
			break

    # MIGRATION STEPS - PRINT CONTRACTS
    # Print L3 out associate new contract
    l3out = {}
    for tenant in write_to_aci_cfg:
	for vrf in write_to_aci_cfg[tenant]:
		for epg in write_to_aci_cfg[tenant][vrf]:
		
			for d in write_to_aci_cfg[tenant][vrf][epg]:
				if d['remove_l3_contract'] == 'yes' and d['l3'] == 'yes' :
					dirname = epg.split("-")
					tenantdir = dirname[0]
					fname = vrf + " 1 Type " + d['type'] +  " - Associate contracts to L3Out as consumer.csv"
					if not os.path.isfile(dir_path + "/" + tenantdir + "-" + vrf + "/" + fname):
    						f = open(dir_path + "/" + tenantdir + "-" + vrf + "/" + fname, "a") 
    						f.write("TENANT,L3OUT,NETWORK,NEW_L3_CONTRACT" + '\n')
    						f.close()

					l3out_name = d['l3out']
					ext_epg = d['extepg']
					newcontract = tenantdir + "-" + vrf + "-" + "SG-PBR-Permit_Any"
					newcontract_key = tenantdir + "-" + vrf + "-" + l3out_name + "-" + ext_epg + "-" + newcontract
					if newcontract_key not in l3out and l3out_name != 'N/A':
						l3out[newcontract_key] = {}
						f = open(dir_path + "/" + tenantdir + "-" + vrf + "/" + fname, "a") 
						f.write(tenant + "," + l3out_name + "," + ext_epg + "," + newcontract + '\n')
						f.close()
    
    # Print EPG associate new contract
    # For type-B, remove OLD EPG contract
    for tenant in write_to_aci_cfg:
	for vrf in write_to_aci_cfg[tenant]:
		for epg in write_to_aci_cfg[tenant][vrf]:
			for d in write_to_aci_cfg[tenant][vrf][epg]:
				if d['l3'] == 'yes' :
					s = epg.split("-")
					tenantdir = s[0]
					type = d['type']
					ap = d['ap']
					if type == 'A':
						fname = vrf + " 2 Type " + d['type'] + " - Assign new contract as provider.csv"
						if not os.path.isfile(dir_path + "/" + tenantdir + "-" + vrf + "/" + fname):
    							f = open(dir_path + "/" + tenantdir + "-" + vrf + "/" + fname, "a") 
    							f.write("TENANT,AP,EPG,NEW_EPG_CONTRACT" + '\n')
    							f.close()
    						f = open(dir_path + "/" + tenantdir + "-" + vrf + "/" + fname, "a") 
						f.write(tenant + "," + ap + "," + epg + "," + tenantdir + "-" + vrf + "-" + "SG-PBR-Permit_Any" + '\n')
						f.close()

					if type == 'B':
						fname = vrf + " 2 Type " + d['type'] + " - Assign new contract as provider and delete old contracts.csv"
						if not os.path.isfile(dir_path + "/" + tenantdir + "-" + vrf + "/" + fname):
    							f = open(dir_path + "/" + tenantdir + "-" + vrf + "/" + fname, "a") 
    							f.write("TENANT,AP,EPG,NEW_EPG_CONTRACT,OLD_EPG_CONTRACT" + '\n')
    							f.close()
    						f = open(dir_path + "/" + tenantdir + "-" + vrf + "/" + fname, "a")
						for c in d['contract']: 
							f.write(tenant + "," + ap + "," + epg + "," + tenantdir + "-" + vrf + "-" + "SG-PBR-Permit_Any" + "," + c + '\n')
						f.close()
    
    l3out = {}
    #Contract removal
    for tenant in write_to_aci_cfg:
	for vrf in write_to_aci_cfg[tenant]:
		for epg in write_to_aci_cfg[tenant][vrf]:
			for d in write_to_aci_cfg[tenant][vrf][epg]:
				if d['l3'] == 'yes' :
					d_l3out = d['l3out']
					d_extepg = d['extepg']
					ap = d['ap']
					s = epg.split("-")
					type = d['type']
					tenantdir = s[0]
					fname = vrf + " 3 Type " + d['type'] + " - Remove contract from L3Out and EPG as provider_consumer.csv"	
					if not os.path.isfile(dir_path + "/" + tenantdir + "-" + vrf + "/" + fname):
    						f = open(dir_path + "/" + tenantdir + "-" + vrf + "/" + fname, "a") 
    						f.write("TENANT,AP,EPG,OLD_EPG_CONTRACT,L3OUT,NETWORK,OLD_L3_CONTRACT" + '\n')
    						f.close()
					
					for c in d['contract']:
						if d_l3out not in l3out:
							l3out[d_l3out] = {}
							if d_extepg not in l3out[d_l3out]:
								l3out[d_l3out][d_extepg] = {}
								l3out[d_l3out][d_extepg][c] = {}
    								f = open(dir_path + "/" + tenantdir + "-" + vrf + "/" + fname, "a") 
								f.write(tenant + ",,,," + d_l3out +  " ," + d_extepg + "," + c + '\n')
								f.close()
							if d_extepg in l3out[d_l3out]:
								if c not in l3out[d_l3out][d_extepg]:
									l3out[d_l3out][d_extepg][c] = {}
    									f = open(dir_path + "/" + tenantdir + "-" + vrf + "/" + fname, "a") 
									f.write(tenant + ",,,," + d_l3out +  " ," + d_extepg + "," + c + '\n')
									f.close()
						if d_l3out in l3out:
							if d_extepg not in l3out[d_l3out]:
                                                                l3out[d_l3out][d_extepg] = {}
                                                                l3out[d_l3out][d_extepg][c] = {}
    								f = open(dir_path + "/" + tenantdir + "-" + vrf + "/" + fname, "a") 
								f.write(tenant + ",,,," + d_l3out +  " ," + d_extepg + "," + c + '\n')
								f.close()
							if d_extepg in l3out[d_l3out]:
                                                                if c not in l3out[d_l3out][d_extepg]:
                                                                        l3out[d_l3out][d_extepg][c] = {}
    									f = open(dir_path + "/" + tenantdir + "-" + vrf + "/" + fname, "a") 
									f.write(tenant + ",,,," + d_l3out +  " ," + d_extepg + "," + c + '\n')
									f.close()
						if type == 'A':
    							f = open(dir_path + "/" + tenantdir + "-" + vrf + "/" + fname, "a") 
							f.write(tenant + "," + ap + "," + epg + "," + c + '\n')
						f.close()

    f = open('x', 'w') 
    f.write(json.dumps(write_to_aci_cfg) )
    f.close()

if __name__ == '__main__':
	main(sys.argv[1:])
