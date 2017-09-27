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
import sys

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

def printClass(md,class_name,attribute):
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

def createVRF(md,tn,vrfname,desc):
    tenant     = 'uni/tn-' + tn
    uniMo      = md.lookupByDn(tenant)
    fvCtxMo = Ctx(uniMo,name=vrfname, descr=desc)
    
    cfgRequest = ConfigRequest()
    cfgRequest.addMo(fvCtxMo)
    md.commit(cfgRequest)


def main():
    ls = LoginSession(apicURL, apicUN, apicPW)
    md = MoDirectory(ls)
    md.login()

    # Print LLDP Adjacent Endpoints
    printClass(md,'lldpAdjEp','mgmtIp')

    # Print all tenants
    printClass(md,'fvTenant','name')

    # Print all fabric Nodes
    printClass(md,'fabricNode','name')
    printClass(md,'fabricNode','model')
    printClass(md,'fabricNode','id')
    printClass(md,'aaaUser','name')

    # Create tenants
    createTenant(md,'EvictMe', 'My First Eviction')

    # Create VRF in EvictMe
    createVRF(md,'EvictMe', 'VRF-Eviction', 'My VRF for eviction')

    md.logout()

if __name__ == '__main__':
    main()
