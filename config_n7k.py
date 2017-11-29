#!/usr/bin/env python

import openpyxl
import sys
import getopt
import os.path
import magic
import re
import numbers
from xlrd import open_workbook, XLRDError
import json

def process_xlsx(filename):
    worksheets = []
    data = {}

    # Important worksheets
    ws_definition = "SOE_SDE_GIS_VRF_RT_Definition"
    ws_soe_inner_to_pa = "SOE-VRF P2P Inner-to-PA"
    ws_sde_inner_to_pa = "SDE VRF P2P Inner-to-PA"
    ws_gis_inner_to_pa = "GIS VRF P2P Inner-to-PA"

    wb = openpyxl.load_workbook(filename)

    # Get all worksheets
    for sheet in wb:
        worksheets.append(sheet.title) 
    wb.close()

    # Set ws_definition as the active worksheet to read from
    try:
        wb.active = worksheets.index(ws_definition)
    except:
        print "Worksheet not found"
    else:
        ws = wb.active
        row_start = ws.min_row
        row_end   = ws.max_row

        
        #b = chr(ord(a) + 1)
        
        for x in range(row_start,row_end):
            # Get District
            cell = 'A' + str(x)
            value = ws[cell].value 
            
            if value is not None and value != 'District':
                district = value

            # Go to next row if heading
            if value == 'District':
                continue

            # Get Zone
            cell = 'B' + str(x)
            value = ws[cell].value 
           
            # Go to next row if heading
            if value is not None and bool((re.search('Zone',value,re.IGNORECASE))):
                continue

            if value is not None and value != 'Sub Zone' and value != 'Network Segmentation Zone' and not bool(re.search('Zone',value, re.IGNORECASE)):
                tenant = value
                tenant = tenant.strip()
         
            # Get Sub Zone
            cell = 'C' + str(x)
            value = ws[cell].value 
           
            # Skip row if there is no value (empty row)
            if value is None:
               continue
            if value is not None and not bool(re.search('Sub Zone',value, re.IGNORECASE)):
                szone = value
                szone = szone.strip()

            # Get VRF #
            cell = 'D' + str(x)
            value = ws[cell].value 
            
            if value is not None and value != 'VRF' and value != '#':
                    vrf = value
            
            # Get VRF Name for DC1
            cell = 'E' + str(x)
            value = ws[cell].value 
            
            if value is not None and not bool(re.search('N7K',value, re.IGNORECASE)) and value != 'DC1' and value != 'DC2':
                    vrfnamedc1 = value
                    vrfnamedc1 = vrfnamedc1.strip()

            # Get VRF Name for DC2
            cell = 'F' + str(x)
            value = ws[cell].value 
            
            if value is not None and not bool(re.search('N7K',value, re.IGNORECASE)) and value != 'DC1' and value != 'DC2':
                    vrfnamedc2 = value
                    vrfnamedc2 = vrfnamedc2.strip()
            
            # RT DC1
            cell = 'G' + str(x)
            value = ws[cell].value 
            
            if value is not None and value != 'RT' and value != 'DC1' and value != 'DC2':
                    rtdc1 = value
                    rtdc1 = rtdc1.strip()

            # RT DC2
            cell = 'H' + str(x)
            value = ws[cell].value 
            
            if value is not None and value != 'RT' and value != 'DC1' and value != 'DC2':
                    rtdc2 = value
                    rtdc2 = rtdc2.strip()
            
            # inner VDC to FW encap

            cell = 'I' + str(x)
            value = ws[cell].value 
            
            if value is not None and not bool(re.search('encapsulation',str(value))) and not bool(re.search('Inner',str(value))):
                    invdcencap = value
            
            # OSPF DC1 
            cell = 'J' + str(x)
            value = ws[cell].value 
            
            if value is not None and not bool(re.search('OSPF',str(value), re.IGNORECASE)) and not bool(re.search('DC',str(value), re.IGNORECASE)):
                    ospfdc1 = value
            
            # OSPF DC2 
            cell = 'K' + str(x)
            value = ws[cell].value 
            
            if value is not None and not bool(re.search('OSPF',str(value), re.IGNORECASE)) and not bool(re.search('DC',str(value), re.IGNORECASE)):
                    ospfdc2 = value


            # encap - outer VDC to FW
            cell = 'L' + str(x)
            value = ws[cell].value 
            
            if value is not None and not bool(re.search('encapsulation',str(value), re.IGNORECASE)) and not bool(re.search('Inside',str(value), re.IGNORECASE)):
                    outvdcencap = value
                     
           # Push data into dictionary
           # Use Debug option to print data

            if district in data:
                if tenant in data[district]:
                  data[district][tenant].append(
                                    {
                                     'vrfnumber'     : vrf,
                                     'district'      : district,
                                     'subzone'       : szone,
                                     'dc1vrf'        : vrfnamedc1,
                                     'dc2vrf'        : vrfnamedc2,
                                     'rtdc1'         : rtdc1,
                                     'rtdc2'         : rtdc2,
                                     'innervdcencap' : invdcencap,
                                     'ospfdc1'       : ospfdc1,
                                     'ospfdc2'       : ospfdc2,
                                     'outervdcencap' : outvdcencap
                                   })
                else:
                    data[district][tenant] = [ {  
                                     
                                      'vrfnumber'     : vrf,
                                      'district'      : district,
                                      'subzone'       : szone,
                                      'dc1vrf'        : vrfnamedc1,
                                      'dc2vrf'        : vrfnamedc2,
                                      'rtdc1'         : rtdc1,
                                      'rtdc2'         : rtdc2,
                                      'innervdcencap' : invdcencap,
                                      'ospfdc1'       : ospfdc1,
                                      'ospfdc2'       : ospfdc2,
                                      'outervdcencap' : outvdcencap
                                     } ]


            else:
                    data.update({  
                              district :  
                              { 
                                tenant :  [ 
                                     {
                                      'vrfnumber'     : vrf,
                                      'district'      : district,
                                      'subzone'       : szone,
                                      'dc1vrf'        : vrfnamedc1,
                                      'dc2vrf'        : vrfnamedc2,
                                      'rtdc1'         : rtdc1,
                                      'rtdc2'         : rtdc2,
                                      'innervdcencap' : invdcencap,
                                      'ospfdc1'       : ospfdc1,
                                      'ospfdc2'       : ospfdc2,
                                      'outervdcencap' : outvdcencap
                                    }
                                ] 
                              } 
                         })
       
        if opt == "-d" :
            print json.dumps(data)

                    
def main(argv):

    if len(argv) == 0:
        print "Usage: " +  sys.argv[0] + " -f|--file <excel file name> -d|--debug.  No arguments given"
        sys.exit(1)

    try:
        opts,args = getopt.getopt(argv,"f:hd",["file=","help","debug"])
    except getopt.GetoptError as err:
        print str(err)
        sys.exit(2)
    else:
        for opt,arg in opts:
            if opt == '-h':
                print sys.argv[0] + " -f|--file <excel file name> -d|--debug"
                sys.exit(1)
            elif opt in ( "-f", "--file"):
                filename = arg
                if not os.path.isfile(filename):
                    print sys.argv[0] + " excel file %s NOT found" % filename
                    sys.exit(1)
            elif opt in ( "-d")
                else:
                    try:
                        open_workbook(filename)
                    except XLRDError:
                        print sys.argv[0] + " file %s is not an Excel file" % filename
                    else:
                        if magic.from_file(filename) == 'Microsoft Excel 2007+':
                            process_xlsx(filename)
                        else:
                            print "File must be in .xlsx format"
                            sys.exit(10)

if __name__ == '__main__':
    main(sys.argv[1:])
