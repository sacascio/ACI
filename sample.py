#!/usr/bin/env python

# Example script for ACI
# Prepared by Cascio, Salvatore
# September 27, 2017

import urllib3
import json
from cobra.mit.access import MoDirectory
from cobra.mit.session import LoginSession
from cobra.model.fv import Ctx
from cobra.model.fv import Tenant
from cobra.mit.request import ConfigRequest

import cobra.model.pol
import cobra.model.vz
import re
import requests


"""
To get class names for printing, go into UI, enable 'Show Debug Info'
The lower left part of the screen will show the class name

"""

###### Setup APIC UN/PW and disable URL exception.  Standard code ####

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)
apicUN  = 'admin'
apicPW  = 'pr@ct1ce'
apicURL = 'https://10.90.60.174'

#####################################################################

def printClass(class_name,attribute):
    items = md.lookupByClass(class_name)

    for item in items:
     dn = getattr(item,attribute)
     print class_name + "::" + attribute + "::" +  dn


def createTenant(md,tn,desc):
    uniMo      = md.lookupByDn('uni')
    fvTenantMo = Tenant(uniMo,name=tn, descr=desc)
    
    cfgRequest = ConfigRequest()
    cfgRequest.addMo(fvTenantMo)
    md.commit(cfgRequest)

ls = LoginSession(apicURL, apicUN, apicPW)
md = MoDirectory(ls)
md.login()

# Print LLDP Adjacent Endpoints
printClass('lldpAdjEp','mgmtIp')

# Print all tenants
printClass('fvTenant','name')

# Print all fabric Nodes
printClass('fabricNode','name')
printClass('fabricNode','model')
printClass('fabricNode','id')
printClass('aaaUser','name')

# Create tenants
createTenant(md,'EvictMe', 'My First Eviction')


md.logout()
