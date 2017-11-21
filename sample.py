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
from cobra.model.fv import BD
from cobra.model.l2ext import Out
from cobra.model.l3ext import LNodeP
from cobra.model.bgp import PeerP
from cobra.mit.request import ConfigRequest
import cobra.model.pol
import cobra.model.vz
import re
import requests
import sys

"""
To get class names for printing, go into UI, enable 'Show Debug Info'
The lower left part of the screen will show the class name

To get MO for creation, in an interactive python shell:
    import cobra.model
    help(cobra.model)

This will print the packages, then you can just import, for example, l2ext for L2OUT and use the above class printing steps to get the full MO name
ex. create L2OUT, import cobra.model.l2ext.  Debug GUI shows l2extOut.  So all you have to call is the method "Out" with parameters


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
    fvCtxMo    = Ctx(uniMo,name=vrfname, descr=desc)
    
    cfgRequest = ConfigRequest()
    cfgRequest.addMo(fvCtxMo)
    md.commit(cfgRequest)

def createBD(md,tn,bdname,desc):
    tenant     = 'uni/tn-' + tn
    uniMo      = md.lookupByDn(tenant)
    fvBDMo     = BD(uniMo,name=bdname, descr=desc, ipLearning='no')
    
    cfgRequest = ConfigRequest()
    cfgRequest.addMo(fvBDMo)
    md.commit(cfgRequest)

def createL2OUT(md,tn,l2out,desc):
    tenant     = 'uni/tn-' + tn
    uniMo      = md.lookupByDn(tenant)
    L2OUTMo  = Out(uniMo,name=l2out, descr=desc)
    
    cfgRequest = ConfigRequest()
    cfgRequest.addMo(L2OUTMo)
    md.commit(cfgRequest)

def createLogicalNodeProfile(md,tn,l3out,profile,desc):
    parentdn   = 'uni/tn-' + tn + '/out-' + l3out 
    uniMo      = md.lookupByDn(parentdn)
    lnp        = LNodeP(uniMo,name=profile, descr=desc)
    
    cfgRequest = ConfigRequest()
    cfgRequest.addMo(lnp)
    md.commit(cfgRequest)

def createBGPPeer(md,tn,l3out,profile,address,desc):
    parentdn   = 'uni/tn-' + tn + '/out-' + l3out + '/lnodep-' + profile 
    uniMo      = md.lookupByDn(parentdn)
    bgpp        = PeerP(uniMo,name=profile, addr=address, descr=desc)
    
    cfgRequest = ConfigRequest()
    cfgRequest.addMo(bgpp)
    md.commit(cfgRequest)

def main():
    ls = LoginSession(apicURL, apicUN, apicPW)
    md = MoDirectory(ls)
    md.login()

    # Print LLDP Adjacent Endpoints
    printClass(md,'lldpAdjEp','mgmtIp')

    # Print all tenants
    printClass(md,'fvTenant','name')
    
    # Print all L2OUT
    printClass(md,'l2extOut','name')

    # Print all fabric Nodes
    printClass(md,'fabricNode','name')
    printClass(md,'fabricNode','model')
    printClass(md,'fabricNode','id')
    printClass(md,'aaaUser','name')
    
    # Print BGP Peer
    printClass(md,'bgpPeerP','addr')

    # Create tenants
    createTenant(md,'EvictMe', 'My First Eviction')

    # Create VRF in EvictMe
    createVRF(md,'EvictMe', 'VRF-Eviction', 'My VRF for eviction')
    
    # Create BD in EvictMe
    createBD(md,'EvictMe', 'BD-Eviction', 'My BD for eviction')
    
    # Create L2OUT in EvictMe
    createL2OUT(md,'EvictMe', 'L2OUT-Eviction', 'My L2OUT for eviction')
    
    # Create L3OUT Logical Node Profile
    createLogicalNodeProfile(md,'EvictMe', 'DC-L3OUT', 'MyProfile', 'My LNP')
    
    # Create L3OUT BGP Peer
    createBGPPeer(md,'EvictMe', 'DC-L3OUT', 'MyProfile', '9.9.9.9', 'My BGP Peer')

    md.logout()

if __name__ == '__main__':
    main()
