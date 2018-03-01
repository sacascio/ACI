!!! District SOE, DC dc2, nexusVDC N7K-C
!
!
!
! Create L2 VLAN
vlan 43
!
interface vlan 43
  description L3_SOE_AUDIT_AUD-ACC-DC2-SOE
  vrf member AUD-ACC-DC2-SOE 
  ip address 10.255.34.9 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf AUDIT area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 44
!
interface vlan 44
  description L3_SOE_AUDIT_AUD-DAT-DC2-SOE
  vrf member AUD-DAT-DC2-SOE 
  ip address 10.255.34.25 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf AUDIT area 0.0.0.10
  no shutdown
!
!
router ospf AUDIT
 vrf AUD-ACC-DC2-SOE
   router-id 10.100.201.3
   log-adjacency-changes
 vrf AUD-DAT-DC2-SOE
   router-id 10.100.201.3
   log-adjacency-changes
!
!
! Create L2 VLAN
vlan 46
!
interface vlan 46
  description L3_SOE_RESTRICTED_RES-DST-DC2-SOE
  vrf member RES-DST-DC2-SOE 
  ip address 10.255.34.57 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf RESTRICTED area 0.0.0.10
  no shutdown
!
!
router ospf RESTRICTED
 vrf RES-DST-DC2-SOE
   router-id 10.100.201.3
   log-adjacency-changes
!
!
!
! Create L2 VLAN
vlan 36
!
interface vlan 36
  description L3_SOE_DMZ_DMZ-WEB-DC2-SOE-CELL3
  vrf member DMZ-WEB-DC2-SOE-CELL3 
  ip address 10.255.33.153 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 37
!
interface vlan 37
  description L3_SOE_DMZ_DMZ-B2B-DC2-SOE-CELL3
  vrf member DMZ-B2B-DC2-SOE-CELL3 
  ip address 10.255.33.169 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 38
!
interface vlan 38
  description L3_SOE_DMZ_DMZ-MAL-DC2-SOE-CELL3
  vrf member DMZ-MAL-DC2-SOE-CELL3 
  ip address 10.255.33.185 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 39
!
interface vlan 39
  description L3_SOE_DMZ_DMZ-DNS-DC2-SOE-CELL3
  vrf member DMZ-DNS-DC2-SOE-CELL3 
  ip address 10.255.33.201 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 40
!
interface vlan 40
  description L3_SOE_DMZ_DMZ-RAC-DC2-SOE-CELL3
  vrf member DMZ-RAC-DC2-SOE-CELL3 
  ip address 10.255.33.217 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 41
!
interface vlan 41
  description L3_SOE_DMZ_DMZ-PXY-DC2-SOE-CELL3
  vrf member DMZ-PXY-DC2-SOE-CELL3 
  ip address 10.255.33.233 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 48
!
interface vlan 48
  description L3_SOE_DMZ_DMZ-WEB-DC2-SOE-CELL4
  vrf member DMZ-WEB-DC2-SOE-CELL4 
  ip address 10.255.34.89 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 49
!
interface vlan 49
  description L3_SOE_DMZ_DMZ-B2B-DC2-SOE-CELL4
  vrf member DMZ-B2B-DC2-SOE-CELL4 
  ip address 10.255.34.105 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 50
!
interface vlan 50
  description L3_SOE_DMZ_DMZ-MAL-DC2-SOE-CELL4
  vrf member DMZ-MAL-DC2-SOE-CELL4 
  ip address 10.255.34.121 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 51
!
interface vlan 51
  description L3_SOE_DMZ_DMZ-DNS-DC2-SOE-CELL4
  vrf member DMZ-DNS-DC2-SOE-CELL4 
  ip address 10.255.34.137 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
!
!
router ospf DMZ
 vrf DMZ-WEB-DC2-SOE-CELL3
   router-id 10.100.201.3
   log-adjacency-changes
 vrf DMZ-WEB-DC2-SOE-CELL3
   router-id 10.100.201.3
   log-adjacency-changes
 vrf DMZ-B2B-DC2-SOE-CELL3
   router-id 10.100.201.3
   log-adjacency-changes
 vrf DMZ-B2B-DC2-SOE-CELL3
   router-id 10.100.201.3
   log-adjacency-changes
 vrf DMZ-MAL-DC2-SOE-CELL3
   router-id 10.100.201.3
   log-adjacency-changes
 vrf DMZ-MAL-DC2-SOE-CELL3
   router-id 10.100.201.3
   log-adjacency-changes
 vrf DMZ-DNS-DC2-SOE-CELL3
   router-id 10.100.201.3
   log-adjacency-changes
 vrf DMZ-DNS-DC2-SOE-CELL3
   router-id 10.100.201.3
   log-adjacency-changes
 vrf DMZ-RAC-DC2-SOE-CELL3
   router-id 10.100.201.3
   log-adjacency-changes
 vrf DMZ-RAC-DC2-SOE-CELL3
   router-id 10.100.201.3
   log-adjacency-changes
 vrf DMZ-PXY-DC2-SOE-CELL3
   router-id 10.100.201.3
   log-adjacency-changes
 vrf DMZ-PXY-DC2-SOE-CELL3
   router-id 10.100.201.3
   log-adjacency-changes
 vrf DMZ-WEB-DC2-SOE-CELL4
   router-id 10.100.201.3
   log-adjacency-changes
 vrf DMZ-WEB-DC2-SOE-CELL4
   router-id 10.100.201.3
   log-adjacency-changes
 vrf DMZ-B2B-DC2-SOE-CELL4
   router-id 10.100.201.3
   log-adjacency-changes
 vrf DMZ-B2B-DC2-SOE-CELL4
   router-id 10.100.201.3
   log-adjacency-changes
 vrf DMZ-MAL-DC2-SOE-CELL4
   router-id 10.100.201.3
   log-adjacency-changes
 vrf DMZ-MAL-DC2-SOE-CELL4
   router-id 10.100.201.3
   log-adjacency-changes
 vrf DMZ-DNS-DC2-SOE-CELL4
   router-id 10.100.201.3
   log-adjacency-changes
 vrf DMZ-DNS-DC2-SOE-CELL4
   router-id 10.100.201.3
   log-adjacency-changes
!
!
router bgp 65511
 router-id 10.100.201.3
 address-family l2vpn evpn
  maximum-paths 8
vrf AUD-ACC-DC2-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.82 remote-as 65510
 description TO_dc2dcinxc1dciouter_AUDIT-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.86 remote-as 65510
 description TO_dc2dcinxc2dciouter_AUDIT-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.90 remote-as 65510
 description TO_dc2dcinxc3dciouter_AUDIT-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.94 remote-as 65510
 description TO_dc2dcinxc4dciouter_AUDIT-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf AUD-DAT-DC2-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.82 remote-as 65510
 description TO_dc2dcinxc1dciouter_AUDIT-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.86 remote-as 65510
 description TO_dc2dcinxc2dciouter_AUDIT-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.90 remote-as 65510
 description TO_dc2dcinxc3dciouter_AUDIT-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.94 remote-as 65510
 description TO_dc2dcinxc4dciouter_AUDIT-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf RES-DST-DC2-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.114 remote-as 65510
 description TO_dc2dcinxc1dciouter_RESTRICTED-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.118 remote-as 65510
 description TO_dc2dcinxc2dciouter_RESTRICTED-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.122 remote-as 65510
 description TO_dc2dcinxc3dciouter_RESTRICTED-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.126 remote-as 65510
 description TO_dc2dcinxc4dciouter_RESTRICTED-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-WEB-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.70 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.74 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.78 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-WEB-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.70 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.74 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.78 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-B2B-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.70 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.74 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.78 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-B2B-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.70 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.74 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.78 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-MAL-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.70 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.74 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.78 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-MAL-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.70 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.74 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.78 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DNS-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.70 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.74 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.78 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DNS-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.70 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.74 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.78 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-RAC-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.146 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.150 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.154 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.158 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-RAC-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.146 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.150 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.154 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.158 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-PXY-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.162 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.166 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.170 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.174 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-PXY-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.162 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.166 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.170 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.174 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-WEB-DC2-SOE-CELL4
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.178 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.182 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.186 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.190 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-WEB-DC2-SOE-CELL4
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.178 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.182 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.186 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.190 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-B2B-DC2-SOE-CELL4
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.178 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.182 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.186 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.190 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-B2B-DC2-SOE-CELL4
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.178 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.182 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.186 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.190 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-MAL-DC2-SOE-CELL4
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.178 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.182 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.186 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.190 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-MAL-DC2-SOE-CELL4
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.178 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.182 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.186 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.190 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DNS-DC2-SOE-CELL4
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.178 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.182 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.186 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.190 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DNS-DC2-SOE-CELL4
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.178 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.182 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.186 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.190 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
!
!
!
! Allow VLANs on the firewall
!
interface E2/14
description TO_dc2soedma2pfw6b_E1/15
switchport
switchport mode trunk
switchport trunk allow vlan 40
no shutdown
!
interface E2/11
description TO_dc2soenwa1pfw1b_E1/15
switchport
switchport mode trunk
switchport trunk allow vlan 43,44,46
no shutdown
!
interface E2/13
description TO_dc2soedma2pfw4b_E1/15
switchport
switchport mode trunk
switchport trunk allow vlan 41
no shutdown
!
interface E7706 B/02:43
description TO_dc2soedma2pfw2b_E1/15
switchport
switchport mode trunk
switchport trunk allow vlan 36,37,38,39
no shutdown
!
interface E2/3
description TO_dc2soenwa1pfw1a_E1/15
switchport
switchport mode trunk
switchport trunk allow vlan 43,44,46
no shutdown
!
interface E7706 A/02:43
description TO_dc2soedma1pfw2a_E1/15
switchport
switchport mode trunk
switchport trunk allow vlan 36,37,38,39
no shutdown
!
interface E2/5
description TO_dc2soedma1pfw4a_E1/15
switchport
switchport mode trunk
switchport trunk allow vlan 41
no shutdown
!
interface E2/4
description TO_dc2soedmb1pfw2a_E1/15
switchport
switchport mode trunk
switchport trunk allow vlan 48,49,50,51
no shutdown
!
interface E2/12
description TO_dc2soedmb1pfw2b_E1/15
switchport
switchport mode trunk
switchport trunk allow vlan 48,49,50,51
no shutdown
!
interface E2/6
description TO_dc2soedma1pfw6a_E1/15
switchport
switchport mode trunk
switchport trunk allow vlan 40
no shutdown
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!! District SDE, DC dc2, nexusVDC N7K-F
!
! Create L2 VLAN
vlan 11
!
interface vlan 11
  description L3_SDE_SERVICES_SVC-SDE-DC2-SDE
  vrf member SVC-SDE-DC2-SDE 
  ip address 10.255.40.5 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.11
  no shutdown
! Create L2 VLAN
vlan 12
!
interface vlan 12
  description L3_SDE_SERVICES_SVC-ITC-DC2-SDE
  vrf member SVC-ITC-DC2-SDE 
  ip address 10.255.40.13 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.11
  no shutdown
! Create L2 VLAN
vlan 16
!
interface vlan 16
  description L3_SDE_SERVICES_SVC-MMD-DC2-SDE
  vrf member SVC-MMD-DC2-SDE 
  ip address 10.255.40.45 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.11
  no shutdown
!
!
router ospf SERVICES
 vrf SVC-SDE-DC2-SDE
   router-id 10.100.201.6
   log-adjacency-changes
 vrf SVC-ITC-DC2-SDE
   router-id 10.100.201.6
   log-adjacency-changes
 vrf SVC-MMD-DC2-SDE
   router-id 10.100.201.6
   log-adjacency-changes
!
!
! Create L2 VLAN
vlan 26
!
interface vlan 26
  description L3_SDE_CONTROL_CTL-DA1-DC2-SDE
  vrf member CTL-DA1-DC2-SDE 
  ip address 10.255.40.125 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.11
  no shutdown
! Create L2 VLAN
vlan 27
!
interface vlan 27
  description L3_SDE_CONTROL_CTL-DA2-DC2-SDE
  vrf member CTL-DA2-DC2-SDE 
  ip address 10.255.40.133 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.11
  no shutdown
! Create L2 VLAN
vlan 28
!
interface vlan 28
  description L3_SDE_CONTROL_CTL-PTD-DC2-SDE
  vrf member CTL-PTD-DC2-SDE 
  ip address 10.255.40.141 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.11
  no shutdown
! Create L2 VLAN
vlan 29
!
interface vlan 29
  description L3_SDE_CONTROL_CTL-PTD-DMZ-DC2-SDE
  vrf member CTL-PTD-DMZ-DC2-SDE 
  ip address 10.255.40.149 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.11
  no shutdown
!
!
router ospf CONTROL
 vrf CTL-DA1-DC2-SDE
   router-id 10.100.201.6
   log-adjacency-changes
 vrf CTL-DA2-DC2-SDE
   router-id 10.100.201.6
   log-adjacency-changes
 vrf CTL-PTD-DC2-SDE
   router-id 10.100.201.6
   log-adjacency-changes
 vrf CTL-PTD-DMZ-DC2-SDE
   router-id 10.100.201.6
   log-adjacency-changes
!
!
! Create L2 VLAN
vlan 34
!
interface vlan 34
  description L3_SDE_DMZ_DMZ-DVT-DC2-SDE-CELL1
  vrf member DMZ-DVT-DC2-SDE-CELL1 
  ip address 10.255.40.189 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.11
  no shutdown
!
!
router ospf DMZ
 vrf DMZ-DVT-DC2-SDE-CELL1
   router-id 10.100.201.6
   log-adjacency-changes
 vrf DMZ-DVT-DC2-SDE-CELL1
   router-id 10.100.201.6
   log-adjacency-changes
!
!
router bgp 65516
 router-id 10.100.201.6
 address-family l2vpn evpn
  maximum-paths 8
vrf SVC-SDE-DC2-SDE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.46.2 remote-as 65515
 description TO_dc2sdenxc1sdeouter_SERVICES-DC2-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.46.6 remote-as 65515
 description TO_dc2sdenxc2sdeouter_SERVICES-DC2-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf SVC-ITC-DC2-SDE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.46.2 remote-as 65515
 description TO_dc2sdenxc1sdeouter_SERVICES-DC2-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.46.6 remote-as 65515
 description TO_dc2sdenxc2sdeouter_SERVICES-DC2-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf SVC-MMD-DC2-SDE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.46.58 remote-as 65515
 description TO_dc2sdenxc1sdeouter_SERVICES-DC2-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.46.62 remote-as 65515
 description TO_dc2sdenxc2sdeouter_SERVICES-DC2-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-DA1-DC2-SDE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.46.26 remote-as 65515
 description TO_dc2sdenxc1sdeouter_CONTROL-DC2-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.46.30 remote-as 65515
 description TO_dc2sdenxc2sdeouter_CONTROL-DC2-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-DA2-DC2-SDE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.46.26 remote-as 65515
 description TO_dc2sdenxc1sdeouter_CONTROL-DC2-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.46.30 remote-as 65515
 description TO_dc2sdenxc2sdeouter_CONTROL-DC2-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PTD-DC2-SDE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.46.26 remote-as 65515
 description TO_dc2sdenxc1sdeouter_CONTROL-DC2-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.46.30 remote-as 65515
 description TO_dc2sdenxc2sdeouter_CONTROL-DC2-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PTD-DMZ-DC2-SDE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.46.26 remote-as 65515
 description TO_dc2sdenxc1sdeouter_CONTROL-DC2-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.46.30 remote-as 65515
 description TO_dc2sdenxc2sdeouter_CONTROL-DC2-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DVT-DC2-SDE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.46.34 remote-as 65515
 description TO_dc2sdenxc1sdeouter_DMZ-DC2-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.46.38 remote-as 65515
 description TO_dc2sdenxc2sdeouter_DMZ-DC2-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DVT-DC2-SDE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.46.34 remote-as 65515
 description TO_dc2sdenxc1sdeouter_DMZ-DC2-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.46.38 remote-as 65515
 description TO_dc2sdenxc2sdeouter_DMZ-DC2-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
!
!
!
! Allow VLANs on the firewall
!
interface E2/3
description TO_dc2sdedma1pfw2a_E1/14
switchport
switchport mode trunk
switchport trunk allow vlan 34
no shutdown
!
interface E2/11
description TO_dc2sdedma1pfw2b_E1/14
switchport
switchport mode trunk
switchport trunk allow vlan 34
no shutdown
!
interface E2/5
description TO_dc2sdenwa1pfw1a_E1/14
switchport
switchport mode trunk
switchport trunk allow vlan 11,12,26,27,28,29
no shutdown
!
interface E2/13
description TO_dc2sdenwa1pfw1b_E1/14
switchport
switchport mode trunk
switchport trunk allow vlan 11,12,26,27,28,29
no shutdown
!
interface E2/4
description TO_dc2sdenwa1pfw2a_E1
switchport
switchport mode trunk
switchport trunk allow vlan 16
no shutdown
!
interface E2/12
description TO_dc2sdenwa1pfw2b_E1
switchport
switchport mode trunk
switchport trunk allow vlan 16
no shutdown
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!! District GIS, DC dc1, nexusVDC N7K-A
!
! Create L2 VLAN
vlan 11
!
interface vlan 11
  description L3_GIS_SERVICES_SVC-COM-DC1-GIS
  vrf member SVC-COM-DC1-GIS 
  ip address 10.255.24.1 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 12
!
interface vlan 12
  description L3_GIS_SERVICES_SVC-ITC-DC1-GIS
  vrf member SVC-ITC-DC1-GIS 
  ip address 10.255.24.17 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 13
!
interface vlan 13
  description L3_GIS_SERVICES_SVC-BSC-DC1-GIS
  vrf member SVC-BSC-DC1-GIS 
  ip address 10.255.24.33 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 14
!
interface vlan 14
  description L3_GIS_SERVICES_SVC-TFR-DC1-GIS
  vrf member SVC-TFR-DC1-GIS 
  ip address 10.255.24.49 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.12
  no shutdown
!
!
router ospf SERVICES
 vrf SVC-COM-DC1-GIS
   router-id 10.100.101.7
   log-adjacency-changes
 vrf SVC-ITC-DC1-GIS
   router-id 10.100.101.7
   log-adjacency-changes
 vrf SVC-BSC-DC1-GIS
   router-id 10.100.101.7
   log-adjacency-changes
 vrf SVC-TFR-DC1-GIS
   router-id 10.100.101.7
   log-adjacency-changes
!
!
! Create L2 VLAN
vlan 27
!
interface vlan 27
  description L3_GIS_CONTROL_CTL-PA1-DC1-GIS
  vrf member CTL-PA1-DC1-GIS 
  ip address 10.255.25.1 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 28
!
interface vlan 28
  description L3_GIS_CONTROL_CTL-PA2-DC1-GIS
  vrf member CTL-PA2-DC1-GIS 
  ip address 10.255.25.17 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 29
!
interface vlan 29
  description L3_GIS_CONTROL_CTL-PTM-DC1-GIS
  vrf member CTL-PTM-DC1-GIS 
  ip address 10.255.25.33 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 30
!
interface vlan 30
  description L3_GIS_CONTROL_CTL-PTM-DMZ-DC1-GIS
  vrf member CTL-PTM-DMZ-DC1-GIS 
  ip address 10.255.25.49 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.12
  no shutdown
!
!
router ospf CONTROL
 vrf CTL-PA1-DC1-GIS
   router-id 10.100.101.7
   log-adjacency-changes
 vrf CTL-PA2-DC1-GIS
   router-id 10.100.101.7
   log-adjacency-changes
 vrf CTL-PTM-DC1-GIS
   router-id 10.100.101.7
   log-adjacency-changes
 vrf CTL-PTM-DMZ-DC1-GIS
   router-id 10.100.101.7
   log-adjacency-changes
!
!
! Create L2 VLAN
vlan 46
!
interface vlan 46
  description L3_GIS_RESTRICTED_RES-MMP-DC1-GIS
  vrf member RES-MMP-DC1-GIS 
  ip address 10.255.26.49 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf RESTRICTED area 0.0.0.12
  no shutdown
!
!
router ospf RESTRICTED
 vrf RES-MMP-DC1-GIS
   router-id 10.100.101.7
   log-adjacency-changes
!
!
router bgp 65502
 router-id 10.100.101.7
 address-family l2vpn evpn
  maximum-paths 8
vrf SVC-COM-DC1-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.30.2 remote-as 65500
 description TO_dc1dcinxc1dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.6 remote-as 65500
 description TO_dc1dcinxc2dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.10 remote-as 65500
 description TO_dc1dcinxc3dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.14 remote-as 65500
 description TO_dc1dcinxc4dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf SVC-ITC-DC1-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.30.2 remote-as 65500
 description TO_dc1dcinxc1dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.6 remote-as 65500
 description TO_dc1dcinxc2dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.10 remote-as 65500
 description TO_dc1dcinxc3dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.14 remote-as 65500
 description TO_dc1dcinxc4dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf SVC-BSC-DC1-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.30.2 remote-as 65500
 description TO_dc1dcinxc1dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.6 remote-as 65500
 description TO_dc1dcinxc2dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.10 remote-as 65500
 description TO_dc1dcinxc3dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.14 remote-as 65500
 description TO_dc1dcinxc4dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf SVC-TFR-DC1-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.30.2 remote-as 65500
 description TO_dc1dcinxc1dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.6 remote-as 65500
 description TO_dc1dcinxc2dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.10 remote-as 65500
 description TO_dc1dcinxc3dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.14 remote-as 65500
 description TO_dc1dcinxc4dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PA1-DC1-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.30.50 remote-as 65500
 description TO_dc1dcinxc1dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.54 remote-as 65500
 description TO_dc1dcinxc2dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.58 remote-as 65500
 description TO_dc1dcinxc3dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.62 remote-as 65500
 description TO_dc1dcinxc4dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PA2-DC1-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.30.50 remote-as 65500
 description TO_dc1dcinxc1dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.54 remote-as 65500
 description TO_dc1dcinxc2dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.58 remote-as 65500
 description TO_dc1dcinxc3dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.62 remote-as 65500
 description TO_dc1dcinxc4dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PTM-DC1-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.30.50 remote-as 65500
 description TO_dc1dcinxc1dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.54 remote-as 65500
 description TO_dc1dcinxc2dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.58 remote-as 65500
 description TO_dc1dcinxc3dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.62 remote-as 65500
 description TO_dc1dcinxc4dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PTM-DMZ-DC1-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.30.50 remote-as 65500
 description TO_dc1dcinxc1dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.54 remote-as 65500
 description TO_dc1dcinxc2dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.58 remote-as 65500
 description TO_dc1dcinxc3dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.62 remote-as 65500
 description TO_dc1dcinxc4dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf RES-MMP-DC1-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.30.114 remote-as 65500
 description TO_dc1dcinxc1dciouter_RESTRICTED-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.118 remote-as 65500
 description TO_dc1dcinxc2dciouter_RESTRICTED-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.122 remote-as 65500
 description TO_dc1dcinxc3dciouter_RESTRICTED-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.126 remote-as 65500
 description TO_dc1dcinxc4dciouter_RESTRICTED-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
!
!
!
! Allow VLANs on the firewall
!
interface E2/29
description TO_dc1gisnwa1pfw1a_E1/13
switchport
switchport mode trunk
switchport trunk allow vlan 11,12,13,14,27,28,29,30
no shutdown
!
interface E2/30
description TO_dc1gisnwa1pfw1b_E1/13
switchport
switchport mode trunk
switchport trunk allow vlan 11,12,13,14,27,28,29,30
no shutdown
!
interface E2/27
description TO_dc1gisnwa1pfw2a_E1/13
switchport
switchport mode trunk
switchport trunk allow vlan 46
no shutdown
!
interface E2/28
description TO_dc1gisnwa1pfw2b_E1/13
switchport
switchport mode trunk
switchport trunk allow vlan 46
no shutdown
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!! District GIS, DC dc1, nexusVDC N7K-D
!
! Create L2 VLAN
vlan 11
!
interface vlan 11
  description L3_GIS_SERVICES_SVC-COM-DC1-GIS
  vrf member SVC-COM-DC1-GIS 
  ip address 10.255.24.13 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 12
!
interface vlan 12
  description L3_GIS_SERVICES_SVC-ITC-DC1-GIS
  vrf member SVC-ITC-DC1-GIS 
  ip address 10.255.24.29 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 13
!
interface vlan 13
  description L3_GIS_SERVICES_SVC-BSC-DC1-GIS
  vrf member SVC-BSC-DC1-GIS 
  ip address 10.255.24.45 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 14
!
interface vlan 14
  description L3_GIS_SERVICES_SVC-TFR-DC1-GIS
  vrf member SVC-TFR-DC1-GIS 
  ip address 10.255.24.61 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.12
  no shutdown
!
!
router ospf SERVICES
 vrf SVC-COM-DC1-GIS
   router-id 10.100.101.10
   log-adjacency-changes
 vrf SVC-ITC-DC1-GIS
   router-id 10.100.101.10
   log-adjacency-changes
 vrf SVC-BSC-DC1-GIS
   router-id 10.100.101.10
   log-adjacency-changes
 vrf SVC-TFR-DC1-GIS
   router-id 10.100.101.10
   log-adjacency-changes
!
!
! Create L2 VLAN
vlan 27
!
interface vlan 27
  description L3_GIS_CONTROL_CTL-PA1-DC1-GIS
  vrf member CTL-PA1-DC1-GIS 
  ip address 10.255.25.13 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 28
!
interface vlan 28
  description L3_GIS_CONTROL_CTL-PA2-DC1-GIS
  vrf member CTL-PA2-DC1-GIS 
  ip address 10.255.25.29 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 29
!
interface vlan 29
  description L3_GIS_CONTROL_CTL-PTM-DC1-GIS
  vrf member CTL-PTM-DC1-GIS 
  ip address 10.255.25.45 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 30
!
interface vlan 30
  description L3_GIS_CONTROL_CTL-PTM-DMZ-DC1-GIS
  vrf member CTL-PTM-DMZ-DC1-GIS 
  ip address 10.255.25.61 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.12
  no shutdown
!
!
router ospf CONTROL
 vrf CTL-PA1-DC1-GIS
   router-id 10.100.101.10
   log-adjacency-changes
 vrf CTL-PA2-DC1-GIS
   router-id 10.100.101.10
   log-adjacency-changes
 vrf CTL-PTM-DC1-GIS
   router-id 10.100.101.10
   log-adjacency-changes
 vrf CTL-PTM-DMZ-DC1-GIS
   router-id 10.100.101.10
   log-adjacency-changes
!
!
! Create L2 VLAN
vlan 46
!
interface vlan 46
  description L3_GIS_RESTRICTED_RES-MMP-DC1-GIS
  vrf member RES-MMP-DC1-GIS 
  ip address 10.255.26.61 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf RESTRICTED area 0.0.0.12
  no shutdown
!
!
router ospf RESTRICTED
 vrf RES-MMP-DC1-GIS
   router-id 10.100.101.10
   log-adjacency-changes
!
!
router bgp 65502
 router-id 10.100.101.10
 address-family l2vpn evpn
  maximum-paths 8
vrf SVC-COM-DC1-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.30.2 remote-as 65500
 description TO_dc1dcinxc1dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.6 remote-as 65500
 description TO_dc1dcinxc2dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.10 remote-as 65500
 description TO_dc1dcinxc3dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.14 remote-as 65500
 description TO_dc1dcinxc4dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf SVC-ITC-DC1-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.30.2 remote-as 65500
 description TO_dc1dcinxc1dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.6 remote-as 65500
 description TO_dc1dcinxc2dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.10 remote-as 65500
 description TO_dc1dcinxc3dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.14 remote-as 65500
 description TO_dc1dcinxc4dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf SVC-BSC-DC1-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.30.2 remote-as 65500
 description TO_dc1dcinxc1dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.6 remote-as 65500
 description TO_dc1dcinxc2dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.10 remote-as 65500
 description TO_dc1dcinxc3dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.14 remote-as 65500
 description TO_dc1dcinxc4dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf SVC-TFR-DC1-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.30.2 remote-as 65500
 description TO_dc1dcinxc1dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.6 remote-as 65500
 description TO_dc1dcinxc2dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.10 remote-as 65500
 description TO_dc1dcinxc3dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.14 remote-as 65500
 description TO_dc1dcinxc4dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PA1-DC1-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.30.50 remote-as 65500
 description TO_dc1dcinxc1dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.54 remote-as 65500
 description TO_dc1dcinxc2dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.58 remote-as 65500
 description TO_dc1dcinxc3dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.62 remote-as 65500
 description TO_dc1dcinxc4dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PA2-DC1-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.30.50 remote-as 65500
 description TO_dc1dcinxc1dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.54 remote-as 65500
 description TO_dc1dcinxc2dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.58 remote-as 65500
 description TO_dc1dcinxc3dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.62 remote-as 65500
 description TO_dc1dcinxc4dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PTM-DC1-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.30.50 remote-as 65500
 description TO_dc1dcinxc1dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.54 remote-as 65500
 description TO_dc1dcinxc2dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.58 remote-as 65500
 description TO_dc1dcinxc3dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.62 remote-as 65500
 description TO_dc1dcinxc4dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PTM-DMZ-DC1-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.30.50 remote-as 65500
 description TO_dc1dcinxc1dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.54 remote-as 65500
 description TO_dc1dcinxc2dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.58 remote-as 65500
 description TO_dc1dcinxc3dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.62 remote-as 65500
 description TO_dc1dcinxc4dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf RES-MMP-DC1-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.30.114 remote-as 65500
 description TO_dc1dcinxc1dciouter_RESTRICTED-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.118 remote-as 65500
 description TO_dc1dcinxc2dciouter_RESTRICTED-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.122 remote-as 65500
 description TO_dc1dcinxc3dciouter_RESTRICTED-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.126 remote-as 65500
 description TO_dc1dcinxc4dciouter_RESTRICTED-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
!
!
!
! Allow VLANs on the firewall
!
interface E2/29
description TO_dc1gisnwa1pfw1a_E1/16
switchport
switchport mode trunk
switchport trunk allow vlan 11,12,13,14,27,28,29,30
no shutdown
!
interface E2/30
description TO_dc1gisnwa1pfw1b_E1/16
switchport
switchport mode trunk
switchport trunk allow vlan 11,12,13,14,27,28,29,30
no shutdown
!
interface E2/27
description TO_dc1gisnwa1pfw2a_E1/16
switchport
switchport mode trunk
switchport trunk allow vlan 46
no shutdown
!
interface E2/28
description TO_dc1gisnwa1pfw2b_E1/16
switchport
switchport mode trunk
switchport trunk allow vlan 46
no shutdown
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!! District SOE, DC dc2, nexusVDC N7K-D
!
!
!
! Create L2 VLAN
vlan 43
!
interface vlan 43
  description L3_SOE_AUDIT_AUD-ACC-DC2-SOE
  vrf member AUD-ACC-DC2-SOE 
  ip address 10.255.34.13 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf AUDIT area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 44
!
interface vlan 44
  description L3_SOE_AUDIT_AUD-DAT-DC2-SOE
  vrf member AUD-DAT-DC2-SOE 
  ip address 10.255.34.29 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf AUDIT area 0.0.0.10
  no shutdown
!
!
router ospf AUDIT
 vrf AUD-ACC-DC2-SOE
   router-id 10.100.201.4
   log-adjacency-changes
 vrf AUD-DAT-DC2-SOE
   router-id 10.100.201.4
   log-adjacency-changes
!
!
! Create L2 VLAN
vlan 46
!
interface vlan 46
  description L3_SOE_RESTRICTED_RES-DST-DC2-SOE
  vrf member RES-DST-DC2-SOE 
  ip address 10.255.34.61 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf RESTRICTED area 0.0.0.10
  no shutdown
!
!
router ospf RESTRICTED
 vrf RES-DST-DC2-SOE
   router-id 10.100.201.4
   log-adjacency-changes
!
!
!
! Create L2 VLAN
vlan 36
!
interface vlan 36
  description L3_SOE_DMZ_DMZ-WEB-DC2-SOE-CELL3
  vrf member DMZ-WEB-DC2-SOE-CELL3 
  ip address 10.255.33.157 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 37
!
interface vlan 37
  description L3_SOE_DMZ_DMZ-B2B-DC2-SOE-CELL3
  vrf member DMZ-B2B-DC2-SOE-CELL3 
  ip address 10.255.33.173 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 38
!
interface vlan 38
  description L3_SOE_DMZ_DMZ-MAL-DC2-SOE-CELL3
  vrf member DMZ-MAL-DC2-SOE-CELL3 
  ip address 10.255.33.189 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 39
!
interface vlan 39
  description L3_SOE_DMZ_DMZ-DNS-DC2-SOE-CELL3
  vrf member DMZ-DNS-DC2-SOE-CELL3 
  ip address 10.255.33.205 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 40
!
interface vlan 40
  description L3_SOE_DMZ_DMZ-RAC-DC2-SOE-CELL3
  vrf member DMZ-RAC-DC2-SOE-CELL3 
  ip address 10.255.33.221 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 41
!
interface vlan 41
  description L3_SOE_DMZ_DMZ-PXY-DC2-SOE-CELL3
  vrf member DMZ-PXY-DC2-SOE-CELL3 
  ip address 10.255.33.237 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 48
!
interface vlan 48
  description L3_SOE_DMZ_DMZ-WEB-DC2-SOE-CELL4
  vrf member DMZ-WEB-DC2-SOE-CELL4 
  ip address 10.255.34.93 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 49
!
interface vlan 49
  description L3_SOE_DMZ_DMZ-B2B-DC2-SOE-CELL4
  vrf member DMZ-B2B-DC2-SOE-CELL4 
  ip address 10.255.34.109 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 50
!
interface vlan 50
  description L3_SOE_DMZ_DMZ-MAL-DC2-SOE-CELL4
  vrf member DMZ-MAL-DC2-SOE-CELL4 
  ip address 10.255.34.125 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 51
!
interface vlan 51
  description L3_SOE_DMZ_DMZ-DNS-DC2-SOE-CELL4
  vrf member DMZ-DNS-DC2-SOE-CELL4 
  ip address 10.255.34.141 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
!
!
router ospf DMZ
 vrf DMZ-WEB-DC2-SOE-CELL3
   router-id 10.100.201.4
   log-adjacency-changes
 vrf DMZ-WEB-DC2-SOE-CELL3
   router-id 10.100.201.4
   log-adjacency-changes
 vrf DMZ-B2B-DC2-SOE-CELL3
   router-id 10.100.201.4
   log-adjacency-changes
 vrf DMZ-B2B-DC2-SOE-CELL3
   router-id 10.100.201.4
   log-adjacency-changes
 vrf DMZ-MAL-DC2-SOE-CELL3
   router-id 10.100.201.4
   log-adjacency-changes
 vrf DMZ-MAL-DC2-SOE-CELL3
   router-id 10.100.201.4
   log-adjacency-changes
 vrf DMZ-DNS-DC2-SOE-CELL3
   router-id 10.100.201.4
   log-adjacency-changes
 vrf DMZ-DNS-DC2-SOE-CELL3
   router-id 10.100.201.4
   log-adjacency-changes
 vrf DMZ-RAC-DC2-SOE-CELL3
   router-id 10.100.201.4
   log-adjacency-changes
 vrf DMZ-RAC-DC2-SOE-CELL3
   router-id 10.100.201.4
   log-adjacency-changes
 vrf DMZ-PXY-DC2-SOE-CELL3
   router-id 10.100.201.4
   log-adjacency-changes
 vrf DMZ-PXY-DC2-SOE-CELL3
   router-id 10.100.201.4
   log-adjacency-changes
 vrf DMZ-WEB-DC2-SOE-CELL4
   router-id 10.100.201.4
   log-adjacency-changes
 vrf DMZ-WEB-DC2-SOE-CELL4
   router-id 10.100.201.4
   log-adjacency-changes
 vrf DMZ-B2B-DC2-SOE-CELL4
   router-id 10.100.201.4
   log-adjacency-changes
 vrf DMZ-B2B-DC2-SOE-CELL4
   router-id 10.100.201.4
   log-adjacency-changes
 vrf DMZ-MAL-DC2-SOE-CELL4
   router-id 10.100.201.4
   log-adjacency-changes
 vrf DMZ-MAL-DC2-SOE-CELL4
   router-id 10.100.201.4
   log-adjacency-changes
 vrf DMZ-DNS-DC2-SOE-CELL4
   router-id 10.100.201.4
   log-adjacency-changes
 vrf DMZ-DNS-DC2-SOE-CELL4
   router-id 10.100.201.4
   log-adjacency-changes
!
!
router bgp 65511
 router-id 10.100.201.4
 address-family l2vpn evpn
  maximum-paths 8
vrf AUD-ACC-DC2-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.82 remote-as 65510
 description TO_dc2dcinxc1dciouter_AUDIT-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.86 remote-as 65510
 description TO_dc2dcinxc2dciouter_AUDIT-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.90 remote-as 65510
 description TO_dc2dcinxc3dciouter_AUDIT-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.94 remote-as 65510
 description TO_dc2dcinxc4dciouter_AUDIT-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf AUD-DAT-DC2-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.82 remote-as 65510
 description TO_dc2dcinxc1dciouter_AUDIT-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.86 remote-as 65510
 description TO_dc2dcinxc2dciouter_AUDIT-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.90 remote-as 65510
 description TO_dc2dcinxc3dciouter_AUDIT-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.94 remote-as 65510
 description TO_dc2dcinxc4dciouter_AUDIT-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf RES-DST-DC2-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.114 remote-as 65510
 description TO_dc2dcinxc1dciouter_RESTRICTED-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.118 remote-as 65510
 description TO_dc2dcinxc2dciouter_RESTRICTED-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.122 remote-as 65510
 description TO_dc2dcinxc3dciouter_RESTRICTED-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.126 remote-as 65510
 description TO_dc2dcinxc4dciouter_RESTRICTED-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-WEB-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.70 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.74 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.78 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-WEB-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.70 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.74 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.78 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-B2B-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.70 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.74 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.78 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-B2B-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.70 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.74 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.78 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-MAL-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.70 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.74 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.78 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-MAL-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.70 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.74 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.78 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DNS-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.70 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.74 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.78 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DNS-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.70 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.74 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.78 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-RAC-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.146 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.150 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.154 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.158 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-RAC-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.146 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.150 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.154 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.158 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-PXY-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.162 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.166 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.170 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.174 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-PXY-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.162 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.166 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.170 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.174 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-WEB-DC2-SOE-CELL4
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.178 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.182 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.186 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.190 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-WEB-DC2-SOE-CELL4
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.178 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.182 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.186 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.190 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-B2B-DC2-SOE-CELL4
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.178 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.182 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.186 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.190 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-B2B-DC2-SOE-CELL4
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.178 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.182 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.186 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.190 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-MAL-DC2-SOE-CELL4
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.178 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.182 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.186 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.190 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-MAL-DC2-SOE-CELL4
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.178 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.182 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.186 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.190 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DNS-DC2-SOE-CELL4
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.178 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.182 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.186 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.190 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DNS-DC2-SOE-CELL4
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.178 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.182 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.186 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.190 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
!
!
!
! Allow VLANs on the firewall
!
interface E2/14
description TO_dc2soedma2pfw6b_E1/16
switchport
switchport mode trunk
switchport trunk allow vlan 40
no shutdown
!
interface E2/11
description TO_dc2soenwa1pfw1b_E1/16
switchport
switchport mode trunk
switchport trunk allow vlan 43,44,46
no shutdown
!
interface E2/13
description TO_dc2soedma2pfw4b_E1/16
switchport
switchport mode trunk
switchport trunk allow vlan 41
no shutdown
!
interface E7706 B/02:44
description TO_dc2soedma2pfw2b_E1/16
switchport
switchport mode trunk
switchport trunk allow vlan 36,37,38,39
no shutdown
!
interface E2/3
description TO_dc2soenwa1pfw1a_E1/16
switchport
switchport mode trunk
switchport trunk allow vlan 43,44,46
no shutdown
!
interface E7706 A/02:44
description TO_dc2soedma1pfw2a_E1/16
switchport
switchport mode trunk
switchport trunk allow vlan 36,37,38,39
no shutdown
!
interface E2/5
description TO_dc2soedma1pfw4a_E1/16
switchport
switchport mode trunk
switchport trunk allow vlan 41
no shutdown
!
interface E2/4
description TO_dc2soedmb1pfw2a_E1/16
switchport
switchport mode trunk
switchport trunk allow vlan 48,49,50,51
no shutdown
!
interface E2/12
description TO_dc2soedmb1pfw2b_E1/16
switchport
switchport mode trunk
switchport trunk allow vlan 48,49,50,51
no shutdown
!
interface E2/6
description TO_dc2soedma1pfw6a_E1/16
switchport
switchport mode trunk
switchport trunk allow vlan 40
no shutdown
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!! District SOE, DC dc1, nexusVDC N7K-D
!
!
!
! Create L2 VLAN
vlan 43
!
interface vlan 43
  description L3_SOE_AUDIT_AUD-ACC-DC1-SOE
  vrf member AUD-ACC-DC1-SOE 
  ip address 10.255.10.13 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf AUDIT area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 44
!
interface vlan 44
  description L3_SOE_AUDIT_AUD-DAT-DC1-SOE
  vrf member AUD-DAT-DC1-SOE 
  ip address 10.255.10.29 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf AUDIT area 0.0.0.10
  no shutdown
!
!
router ospf AUDIT
 vrf AUD-ACC-DC1-SOE
   router-id 10.100.101.4
   log-adjacency-changes
 vrf AUD-DAT-DC1-SOE
   router-id 10.100.101.4
   log-adjacency-changes
!
!
! Create L2 VLAN
vlan 46
!
interface vlan 46
  description L3_SOE_RESTRICTED_RES-DST-DC1-SOE
  vrf member RES-DST-DC1-SOE 
  ip address 10.255.10.61 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf RESTRICTED area 0.0.0.10
  no shutdown
!
!
router ospf RESTRICTED
 vrf RES-DST-DC1-SOE
   router-id 10.100.101.4
   log-adjacency-changes
!
!
!
! Create L2 VLAN
vlan 36
!
interface vlan 36
  description L3_SOE_DMZ_DMZ-WEB-DC1-SOE-CELL1
  vrf member DMZ-WEB-DC1-SOE-CELL1 
  ip address 10.255.9.157 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 37
!
interface vlan 37
  description L3_SOE_DMZ_DMZ-B2B-DC1-SOE-CELL1
  vrf member DMZ-B2B-DC1-SOE-CELL1 
  ip address 10.255.9.173 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 38
!
interface vlan 38
  description L3_SOE_DMZ_DMZ-MAL-DC1-SOE-CELL1
  vrf member DMZ-MAL-DC1-SOE-CELL1 
  ip address 10.255.9.189 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 39
!
interface vlan 39
  description L3_SOE_DMZ_DMZ-DNS-DC1-SOE-CELL1
  vrf member DMZ-DNS-DC1-SOE-CELL1 
  ip address 10.255.9.205 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 40
!
interface vlan 40
  description L3_SOE_DMZ_DMZ-RAC-DC1-SOE-CELL1
  vrf member DMZ-RAC-DC1-SOE-CELL1 
  ip address 10.255.9.221 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 41
!
interface vlan 41
  description L3_SOE_DMZ_DMZ-PXY-DC1-SOE-CELL1
  vrf member DMZ-PXY-DC1-SOE-CELL1 
  ip address 10.255.9.237 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 48
!
interface vlan 48
  description L3_SOE_DMZ_DMZ-WEB-DC1-SOE-CELL2
  vrf member DMZ-WEB-DC1-SOE-CELL2 
  ip address 10.255.10.93 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 49
!
interface vlan 49
  description L3_SOE_DMZ_DMZ-B2B-DC1-SOE-CELL2
  vrf member DMZ-B2B-DC1-SOE-CELL2 
  ip address 10.255.10.109 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 50
!
interface vlan 50
  description L3_SOE_DMZ_DMZ-MAL-DC1-SOE-CELL2
  vrf member DMZ-MAL-DC1-SOE-CELL2 
  ip address 10.255.10.125 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 51
!
interface vlan 51
  description L3_SOE_DMZ_DMZ-DNS-DC1-SOE-CELL2
  vrf member DMZ-DNS-DC1-SOE-CELL2 
  ip address 10.255.10.141 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
!
!
router ospf DMZ
 vrf DMZ-WEB-DC1-SOE-CELL1
   router-id 10.100.101.4
   log-adjacency-changes
 vrf DMZ-WEB-DC1-SOE-CELL1
   router-id 10.100.101.4
   log-adjacency-changes
 vrf DMZ-B2B-DC1-SOE-CELL1
   router-id 10.100.101.4
   log-adjacency-changes
 vrf DMZ-B2B-DC1-SOE-CELL1
   router-id 10.100.101.4
   log-adjacency-changes
 vrf DMZ-MAL-DC1-SOE-CELL1
   router-id 10.100.101.4
   log-adjacency-changes
 vrf DMZ-MAL-DC1-SOE-CELL1
   router-id 10.100.101.4
   log-adjacency-changes
 vrf DMZ-DNS-DC1-SOE-CELL1
   router-id 10.100.101.4
   log-adjacency-changes
 vrf DMZ-DNS-DC1-SOE-CELL1
   router-id 10.100.101.4
   log-adjacency-changes
 vrf DMZ-RAC-DC1-SOE-CELL1
   router-id 10.100.101.4
   log-adjacency-changes
 vrf DMZ-RAC-DC1-SOE-CELL1
   router-id 10.100.101.4
   log-adjacency-changes
 vrf DMZ-PXY-DC1-SOE-CELL1
   router-id 10.100.101.4
   log-adjacency-changes
 vrf DMZ-PXY-DC1-SOE-CELL1
   router-id 10.100.101.4
   log-adjacency-changes
 vrf DMZ-WEB-DC1-SOE-CELL2
   router-id 10.100.101.4
   log-adjacency-changes
 vrf DMZ-WEB-DC1-SOE-CELL2
   router-id 10.100.101.4
   log-adjacency-changes
 vrf DMZ-B2B-DC1-SOE-CELL2
   router-id 10.100.101.4
   log-adjacency-changes
 vrf DMZ-B2B-DC1-SOE-CELL2
   router-id 10.100.101.4
   log-adjacency-changes
 vrf DMZ-MAL-DC1-SOE-CELL2
   router-id 10.100.101.4
   log-adjacency-changes
 vrf DMZ-MAL-DC1-SOE-CELL2
   router-id 10.100.101.4
   log-adjacency-changes
 vrf DMZ-DNS-DC1-SOE-CELL2
   router-id 10.100.101.4
   log-adjacency-changes
 vrf DMZ-DNS-DC1-SOE-CELL2
   router-id 10.100.101.4
   log-adjacency-changes
!
!
router bgp 65501
 router-id 10.100.101.4
 address-family l2vpn evpn
  maximum-paths 8
vrf AUD-ACC-DC1-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.82 remote-as 65500
 description TO_dc1dcinxc1dciouter_AUDIT-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.86 remote-as 65500
 description TO_dc1dcinxc2dciouter_AUDIT-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.90 remote-as 65500
 description TO_dc1dcinxc3dciouter_AUDIT-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.94 remote-as 65500
 description TO_dc1dcinxc4dciouter_AUDIT-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf AUD-DAT-DC1-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.82 remote-as 65500
 description TO_dc1dcinxc1dciouter_AUDIT-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.86 remote-as 65500
 description TO_dc1dcinxc2dciouter_AUDIT-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.90 remote-as 65500
 description TO_dc1dcinxc3dciouter_AUDIT-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.94 remote-as 65500
 description TO_dc1dcinxc4dciouter_AUDIT-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf RES-DST-DC1-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.114 remote-as 65500
 description TO_dc1dcinxc1dciouter_RESTRICTED-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.118 remote-as 65500
 description TO_dc1dcinxc2dciouter_RESTRICTED-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.122 remote-as 65500
 description TO_dc1dcinxc3dciouter_RESTRICTED-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.126 remote-as 65500
 description TO_dc1dcinxc4dciouter_RESTRICTED-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-WEB-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.66 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.70 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.74 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.78 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-WEB-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.66 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.70 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.74 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.78 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-B2B-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.66 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.70 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.74 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.78 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-B2B-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.66 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.70 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.74 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.78 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-MAL-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.66 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.70 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.74 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.78 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-MAL-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.66 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.70 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.74 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.78 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DNS-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.66 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.70 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.74 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.78 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DNS-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.66 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.70 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.74 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.78 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-RAC-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.146 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.150 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.154 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.158 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-RAC-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.146 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.150 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.154 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.158 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-PXY-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.162 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.166 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.170 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.174 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-PXY-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.162 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.166 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.170 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.174 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-WEB-DC1-SOE-CELL2
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.178 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.182 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.186 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.190 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-WEB-DC1-SOE-CELL2
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.178 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.182 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.186 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.190 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-B2B-DC1-SOE-CELL2
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.178 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.182 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.186 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.190 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-B2B-DC1-SOE-CELL2
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.178 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.182 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.186 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.190 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-MAL-DC1-SOE-CELL2
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.178 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.182 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.186 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.190 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-MAL-DC1-SOE-CELL2
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.178 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.182 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.186 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.190 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DNS-DC1-SOE-CELL2
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.178 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.182 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.186 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.190 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DNS-DC1-SOE-CELL2
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.178 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.182 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.186 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.190 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
!
!
!
! Allow VLANs on the firewall
!
interface E2/12
description TO_dc1soedmb1pfw2b_E1/16
switchport
switchport mode trunk
switchport trunk allow vlan 48,49,50,51
no shutdown
!
interface E2/4
description TO_dc1soedmb1pfw2a_E1/16
switchport
switchport mode trunk
switchport trunk allow vlan 48,49,50,51
no shutdown
!
interface E2/13
description TO_dc1soedma2pfw4b_E1/16
switchport
switchport mode trunk
switchport trunk allow vlan 41
no shutdown
!
interface E2/5
description TO_dc1soedma1pfw4a_E1/16
switchport
switchport mode trunk
switchport trunk allow vlan 41
no shutdown
!
interface E7706 B/02:44
description TO_dc1soedma2pfw2b_E1/16
switchport
switchport mode trunk
switchport trunk allow vlan 36,37,38,39
no shutdown
!
interface E2/3
description TO_dc1soenwa1pfw1a_E1/16
switchport
switchport mode trunk
switchport trunk allow vlan 43,44,46
no shutdown
!
interface E2/6
description TO_dc1soedma1pfw6a_E1/16
switchport
switchport mode trunk
switchport trunk allow vlan 40
no shutdown
!
interface E2/11
description TO_dc1soenwa1pfw1b_E1/16
switchport
switchport mode trunk
switchport trunk allow vlan 43,44,46
no shutdown
!
interface E2/14
description TO_dc1soedma2pfw6b_E1/16
switchport
switchport mode trunk
switchport trunk allow vlan 40
no shutdown
!
interface E7706 A/02:44
description TO_dc1soedma1pfw2a_E1/16
switchport
switchport mode trunk
switchport trunk allow vlan 36,37,38,39
no shutdown
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!! District GIS, DC dc2, nexusVDC N7K-D
!
! Create L2 VLAN
vlan 11
!
interface vlan 11
  description L3_GIS_SERVICES_SVC-COM-DC2-GIS
  vrf member SVC-COM-DC2-GIS 
  ip address 10.255.48.13 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 12
!
interface vlan 12
  description L3_GIS_SERVICES_SVC-ITC-DC2-GIS
  vrf member SVC-ITC-DC2-GIS 
  ip address 10.255.48.29 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 13
!
interface vlan 13
  description L3_GIS_SERVICES_SVC-BSC-DC2-GIS
  vrf member SVC-BSC-DC2-GIS 
  ip address 10.255.48.45 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 14
!
interface vlan 14
  description L3_GIS_SERVICES_SVC-TFR-DC2-GIS
  vrf member SVC-TFR-DC2-GIS 
  ip address 10.255.48.61 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.12
  no shutdown
!
!
router ospf SERVICES
 vrf SVC-COM-DC2-GIS
   router-id 10.100.201.10
   log-adjacency-changes
 vrf SVC-ITC-DC2-GIS
   router-id 10.100.201.10
   log-adjacency-changes
 vrf SVC-BSC-DC2-GIS
   router-id 10.100.201.10
   log-adjacency-changes
 vrf SVC-TFR-DC2-GIS
   router-id 10.100.201.10
   log-adjacency-changes
!
!
! Create L2 VLAN
vlan 27
!
interface vlan 27
  description L3_GIS_CONTROL_CTL-PA1-DC2-GIS
  vrf member CTL-PA1-DC2-GIS 
  ip address 10.255.49.13 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 28
!
interface vlan 28
  description L3_GIS_CONTROL_CTL-PA2-DC2-GIS
  vrf member CTL-PA2-DC2-GIS 
  ip address 10.255.49.29 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 29
!
interface vlan 29
  description L3_GIS_CONTROL_CTL-PTM-DC2-GIS
  vrf member CTL-PTM-DC2-GIS 
  ip address 10.255.49.45 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 30
!
interface vlan 30
  description L3_GIS_CONTROL_CTL-PTM-DMZ-DC2-GIS
  vrf member CTL-PTM-DMZ-DC2-GIS 
  ip address 10.255.49.61 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.12
  no shutdown
!
!
router ospf CONTROL
 vrf CTL-PA1-DC2-GIS
   router-id 10.100.201.10
   log-adjacency-changes
 vrf CTL-PA2-DC2-GIS
   router-id 10.100.201.10
   log-adjacency-changes
 vrf CTL-PTM-DC2-GIS
   router-id 10.100.201.10
   log-adjacency-changes
 vrf CTL-PTM-DMZ-DC2-GIS
   router-id 10.100.201.10
   log-adjacency-changes
!
!
! Create L2 VLAN
vlan 46
!
interface vlan 46
  description L3_GIS_RESTRICTED_RES-MMP-DC2-GIS
  vrf member RES-MMP-DC2-GIS 
  ip address 10.255.50.61 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf RESTRICTED area 0.0.0.12
  no shutdown
!
!
router ospf RESTRICTED
 vrf RES-MMP-DC2-GIS
   router-id 10.100.201.10
   log-adjacency-changes
!
!
router bgp 65512
 router-id 10.100.201.10
 address-family l2vpn evpn
  maximum-paths 8
vrf SVC-COM-DC2-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.54.2 remote-as 65510
 description TO_dc2dcinxc1dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.6 remote-as 65510
 description TO_dc2dcinxc2dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.10 remote-as 65510
 description TO_dc2dcinxc3dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.14 remote-as 65510
 description TO_dc2dcinxc4dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf SVC-ITC-DC2-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.54.2 remote-as 65510
 description TO_dc2dcinxc1dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.6 remote-as 65510
 description TO_dc2dcinxc2dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.10 remote-as 65510
 description TO_dc2dcinxc3dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.14 remote-as 65510
 description TO_dc2dcinxc4dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf SVC-BSC-DC2-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.54.2 remote-as 65510
 description TO_dc2dcinxc1dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.6 remote-as 65510
 description TO_dc2dcinxc2dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.10 remote-as 65510
 description TO_dc2dcinxc3dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.14 remote-as 65510
 description TO_dc2dcinxc4dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf SVC-TFR-DC2-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.54.2 remote-as 65510
 description TO_dc2dcinxc1dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.6 remote-as 65510
 description TO_dc2dcinxc2dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.10 remote-as 65510
 description TO_dc2dcinxc3dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.14 remote-as 65510
 description TO_dc2dcinxc4dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PA1-DC2-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.54.50 remote-as 65510
 description TO_dc2dcinxc1dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.54 remote-as 65510
 description TO_dc2dcinxc2dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.58 remote-as 65510
 description TO_dc2dcinxc3dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.62 remote-as 65510
 description TO_dc2dcinxc4dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PA2-DC2-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.54.50 remote-as 65510
 description TO_dc2dcinxc1dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.54 remote-as 65510
 description TO_dc2dcinxc2dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.58 remote-as 65510
 description TO_dc2dcinxc3dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.62 remote-as 65510
 description TO_dc2dcinxc4dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PTM-DC2-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.54.50 remote-as 65510
 description TO_dc2dcinxc1dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.54 remote-as 65510
 description TO_dc2dcinxc2dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.58 remote-as 65510
 description TO_dc2dcinxc3dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.62 remote-as 65510
 description TO_dc2dcinxc4dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PTM-DMZ-DC2-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.54.50 remote-as 65510
 description TO_dc2dcinxc1dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.54 remote-as 65510
 description TO_dc2dcinxc2dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.58 remote-as 65510
 description TO_dc2dcinxc3dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.62 remote-as 65510
 description TO_dc2dcinxc4dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf RES-MMP-DC2-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.54.114 remote-as 65510
 description TO_dc2dcinxc1dciouter_RESTRICTED-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.118 remote-as 65510
 description TO_dc2dcinxc2dciouter_RESTRICTED-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.122 remote-as 65510
 description TO_dc2dcinxc3dciouter_RESTRICTED-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.126 remote-as 65510
 description TO_dc2dcinxc4dciouter_RESTRICTED-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
!
!
!
! Allow VLANs on the firewall
!
interface E2/30
description TO_dc2gisnwa1pfw1b_E1/16
switchport
switchport mode trunk
switchport trunk allow vlan 11,12,13,14,27,28,29,30
no shutdown
!
interface E2/28
description TO_dc2gisnwa1pfw2b_E1/16
switchport
switchport mode trunk
switchport trunk allow vlan 46
no shutdown
!
interface E2/27
description TO_dc2gisnwa1pfw2a_E1/16
switchport
switchport mode trunk
switchport trunk allow vlan 46
no shutdown
!
interface E2/29
description TO_dc2gisnwa1pfw1a_E1/16
switchport
switchport mode trunk
switchport trunk allow vlan 11,12,13,14,27,28,29,30
no shutdown
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!! District SOE, DC dc2, nexusVDC N7K-B
!
!
!
! Create L2 VLAN
vlan 43
!
interface vlan 43
  description L3_SOE_AUDIT_AUD-ACC-DC2-SOE
  vrf member AUD-ACC-DC2-SOE 
  ip address 10.255.34.5 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf AUDIT area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 44
!
interface vlan 44
  description L3_SOE_AUDIT_AUD-DAT-DC2-SOE
  vrf member AUD-DAT-DC2-SOE 
  ip address 10.255.34.21 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf AUDIT area 0.0.0.10
  no shutdown
!
!
router ospf AUDIT
 vrf AUD-ACC-DC2-SOE
   router-id 10.100.201.2
   log-adjacency-changes
 vrf AUD-DAT-DC2-SOE
   router-id 10.100.201.2
   log-adjacency-changes
!
!
! Create L2 VLAN
vlan 46
!
interface vlan 46
  description L3_SOE_RESTRICTED_RES-DST-DC2-SOE
  vrf member RES-DST-DC2-SOE 
  ip address 10.255.34.53 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf RESTRICTED area 0.0.0.10
  no shutdown
!
!
router ospf RESTRICTED
 vrf RES-DST-DC2-SOE
   router-id 10.100.201.2
   log-adjacency-changes
!
!
!
! Create L2 VLAN
vlan 36
!
interface vlan 36
  description L3_SOE_DMZ_DMZ-WEB-DC2-SOE-CELL3
  vrf member DMZ-WEB-DC2-SOE-CELL3 
  ip address 10.255.33.149 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 37
!
interface vlan 37
  description L3_SOE_DMZ_DMZ-B2B-DC2-SOE-CELL3
  vrf member DMZ-B2B-DC2-SOE-CELL3 
  ip address 10.255.33.165 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 38
!
interface vlan 38
  description L3_SOE_DMZ_DMZ-MAL-DC2-SOE-CELL3
  vrf member DMZ-MAL-DC2-SOE-CELL3 
  ip address 10.255.33.181 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 39
!
interface vlan 39
  description L3_SOE_DMZ_DMZ-DNS-DC2-SOE-CELL3
  vrf member DMZ-DNS-DC2-SOE-CELL3 
  ip address 10.255.33.197 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 40
!
interface vlan 40
  description L3_SOE_DMZ_DMZ-RAC-DC2-SOE-CELL3
  vrf member DMZ-RAC-DC2-SOE-CELL3 
  ip address 10.255.33.213 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 41
!
interface vlan 41
  description L3_SOE_DMZ_DMZ-PXY-DC2-SOE-CELL3
  vrf member DMZ-PXY-DC2-SOE-CELL3 
  ip address 10.255.33.229 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 48
!
interface vlan 48
  description L3_SOE_DMZ_DMZ-WEB-DC2-SOE-CELL4
  vrf member DMZ-WEB-DC2-SOE-CELL4 
  ip address 10.255.34.85 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 49
!
interface vlan 49
  description L3_SOE_DMZ_DMZ-B2B-DC2-SOE-CELL4
  vrf member DMZ-B2B-DC2-SOE-CELL4 
  ip address 10.255.34.101 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 50
!
interface vlan 50
  description L3_SOE_DMZ_DMZ-MAL-DC2-SOE-CELL4
  vrf member DMZ-MAL-DC2-SOE-CELL4 
  ip address 10.255.34.117 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 51
!
interface vlan 51
  description L3_SOE_DMZ_DMZ-DNS-DC2-SOE-CELL4
  vrf member DMZ-DNS-DC2-SOE-CELL4 
  ip address 10.255.34.133 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
!
!
router ospf DMZ
 vrf DMZ-WEB-DC2-SOE-CELL3
   router-id 10.100.201.2
   log-adjacency-changes
 vrf DMZ-WEB-DC2-SOE-CELL3
   router-id 10.100.201.2
   log-adjacency-changes
 vrf DMZ-B2B-DC2-SOE-CELL3
   router-id 10.100.201.2
   log-adjacency-changes
 vrf DMZ-B2B-DC2-SOE-CELL3
   router-id 10.100.201.2
   log-adjacency-changes
 vrf DMZ-MAL-DC2-SOE-CELL3
   router-id 10.100.201.2
   log-adjacency-changes
 vrf DMZ-MAL-DC2-SOE-CELL3
   router-id 10.100.201.2
   log-adjacency-changes
 vrf DMZ-DNS-DC2-SOE-CELL3
   router-id 10.100.201.2
   log-adjacency-changes
 vrf DMZ-DNS-DC2-SOE-CELL3
   router-id 10.100.201.2
   log-adjacency-changes
 vrf DMZ-RAC-DC2-SOE-CELL3
   router-id 10.100.201.2
   log-adjacency-changes
 vrf DMZ-RAC-DC2-SOE-CELL3
   router-id 10.100.201.2
   log-adjacency-changes
 vrf DMZ-PXY-DC2-SOE-CELL3
   router-id 10.100.201.2
   log-adjacency-changes
 vrf DMZ-PXY-DC2-SOE-CELL3
   router-id 10.100.201.2
   log-adjacency-changes
 vrf DMZ-WEB-DC2-SOE-CELL4
   router-id 10.100.201.2
   log-adjacency-changes
 vrf DMZ-WEB-DC2-SOE-CELL4
   router-id 10.100.201.2
   log-adjacency-changes
 vrf DMZ-B2B-DC2-SOE-CELL4
   router-id 10.100.201.2
   log-adjacency-changes
 vrf DMZ-B2B-DC2-SOE-CELL4
   router-id 10.100.201.2
   log-adjacency-changes
 vrf DMZ-MAL-DC2-SOE-CELL4
   router-id 10.100.201.2
   log-adjacency-changes
 vrf DMZ-MAL-DC2-SOE-CELL4
   router-id 10.100.201.2
   log-adjacency-changes
 vrf DMZ-DNS-DC2-SOE-CELL4
   router-id 10.100.201.2
   log-adjacency-changes
 vrf DMZ-DNS-DC2-SOE-CELL4
   router-id 10.100.201.2
   log-adjacency-changes
!
!
router bgp 65511
 router-id 10.100.201.2
 address-family l2vpn evpn
  maximum-paths 8
vrf AUD-ACC-DC2-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.82 remote-as 65510
 description TO_dc2dcinxc1dciouter_AUDIT-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.86 remote-as 65510
 description TO_dc2dcinxc2dciouter_AUDIT-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.90 remote-as 65510
 description TO_dc2dcinxc3dciouter_AUDIT-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.94 remote-as 65510
 description TO_dc2dcinxc4dciouter_AUDIT-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf AUD-DAT-DC2-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.82 remote-as 65510
 description TO_dc2dcinxc1dciouter_AUDIT-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.86 remote-as 65510
 description TO_dc2dcinxc2dciouter_AUDIT-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.90 remote-as 65510
 description TO_dc2dcinxc3dciouter_AUDIT-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.94 remote-as 65510
 description TO_dc2dcinxc4dciouter_AUDIT-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf RES-DST-DC2-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.114 remote-as 65510
 description TO_dc2dcinxc1dciouter_RESTRICTED-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.118 remote-as 65510
 description TO_dc2dcinxc2dciouter_RESTRICTED-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.122 remote-as 65510
 description TO_dc2dcinxc3dciouter_RESTRICTED-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.126 remote-as 65510
 description TO_dc2dcinxc4dciouter_RESTRICTED-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-WEB-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.70 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.74 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.78 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-WEB-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.70 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.74 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.78 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-B2B-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.70 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.74 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.78 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-B2B-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.70 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.74 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.78 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-MAL-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.70 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.74 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.78 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-MAL-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.70 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.74 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.78 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DNS-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.70 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.74 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.78 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DNS-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.70 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.74 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.78 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-RAC-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.146 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.150 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.154 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.158 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-RAC-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.146 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.150 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.154 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.158 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-PXY-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.162 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.166 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.170 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.174 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-PXY-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.162 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.166 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.170 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.174 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-WEB-DC2-SOE-CELL4
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.178 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.182 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.186 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.190 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-WEB-DC2-SOE-CELL4
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.178 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.182 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.186 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.190 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-B2B-DC2-SOE-CELL4
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.178 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.182 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.186 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.190 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-B2B-DC2-SOE-CELL4
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.178 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.182 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.186 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.190 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-MAL-DC2-SOE-CELL4
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.178 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.182 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.186 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.190 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-MAL-DC2-SOE-CELL4
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.178 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.182 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.186 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.190 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DNS-DC2-SOE-CELL4
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.178 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.182 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.186 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.190 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DNS-DC2-SOE-CELL4
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.178 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.182 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.186 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.190 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
!
!
!
! Allow VLANs on the firewall
!
interface E2/14
description TO_dc2soedma2pfw6b_E1/14
switchport
switchport mode trunk
switchport trunk allow vlan 40
no shutdown
!
interface E2/11
description TO_dc2soenwa1pfw1b_E1/14
switchport
switchport mode trunk
switchport trunk allow vlan 43,44,46
no shutdown
!
interface E2/13
description TO_dc2soedma2pfw4b_E1/14
switchport
switchport mode trunk
switchport trunk allow vlan 41
no shutdown
!
interface E7706 B/02:42
description TO_dc2soedma2pfw2b_E1/14
switchport
switchport mode trunk
switchport trunk allow vlan 36,37,38,39
no shutdown
!
interface E2/3
description TO_dc2soenwa1pfw1a_E1/14
switchport
switchport mode trunk
switchport trunk allow vlan 43,44,46
no shutdown
!
interface E7706 A/02:42
description TO_dc2soedma1pfw2a_E1/14
switchport
switchport mode trunk
switchport trunk allow vlan 36,37,38,39
no shutdown
!
interface E2/5
description TO_dc2soedma1pfw4a_E1/14
switchport
switchport mode trunk
switchport trunk allow vlan 41
no shutdown
!
interface E2/4
description TO_dc2soedmb1pfw2a_E1/14
switchport
switchport mode trunk
switchport trunk allow vlan 48,49,50,51
no shutdown
!
interface E2/12
description TO_dc2soedmb1pfw2b_E1/14
switchport
switchport mode trunk
switchport trunk allow vlan 48,49,50,51
no shutdown
!
interface E2/6
description TO_dc2soedma1pfw6a_E1/14
switchport
switchport mode trunk
switchport trunk allow vlan 40
no shutdown
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!! District SDE, DC dc1, nexusVDC N7K-E
!
! Create L2 VLAN
vlan 11
!
interface vlan 11
  description L3_SDE_SERVICES_SVC-SDE-DC1-SDE
  vrf member SVC-SDE-DC1-SDE 
  ip address 10.255.16.1 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.11
  no shutdown
! Create L2 VLAN
vlan 12
!
interface vlan 12
  description L3_SDE_SERVICES_SVC-ITC-DC1-SDE
  vrf member SVC-ITC-DC1-SDE 
  ip address 10.255.16.9 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.11
  no shutdown
! Create L2 VLAN
vlan 16
!
interface vlan 16
  description L3_SDE_SERVICES_SVC-MMD-DC1-SDE
  vrf member SVC-MMD-DC1-SDE 
  ip address 10.255.16.41 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.11
  no shutdown
!
!
router ospf SERVICES
 vrf SVC-SDE-DC1-SDE
   router-id 10.100.101.5
   log-adjacency-changes
 vrf SVC-ITC-DC1-SDE
   router-id 10.100.101.5
   log-adjacency-changes
 vrf SVC-MMD-DC1-SDE
   router-id 10.100.101.5
   log-adjacency-changes
!
!
! Create L2 VLAN
vlan 26
!
interface vlan 26
  description L3_SDE_CONTROL_CTL-DA1-DC1-SDE
  vrf member CTL-DA1-DC1-SDE 
  ip address 10.255.16.121 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.11
  no shutdown
! Create L2 VLAN
vlan 27
!
interface vlan 27
  description L3_SDE_CONTROL_CTL-DA2-DC1-SDE
  vrf member CTL-DA2-DC1-SDE 
  ip address 10.255.16.129 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.11
  no shutdown
! Create L2 VLAN
vlan 28
!
interface vlan 28
  description L3_SDE_CONTROL_CTL-PTD-DC1-SDE
  vrf member CTL-PTD-DC1-SDE 
  ip address 10.255.16.137 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.11
  no shutdown
! Create L2 VLAN
vlan 29
!
interface vlan 29
  description L3_SDE_CONTROL_CTL-PTD-DMZ-DC1-SDE
  vrf member CTL-PTD-DMZ-DC1-SDE 
  ip address 10.255.16.145 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.11
  no shutdown
!
!
router ospf CONTROL
 vrf CTL-DA1-DC1-SDE
   router-id 10.100.101.5
   log-adjacency-changes
 vrf CTL-DA2-DC1-SDE
   router-id 10.100.101.5
   log-adjacency-changes
 vrf CTL-PTD-DC1-SDE
   router-id 10.100.101.5
   log-adjacency-changes
 vrf CTL-PTD-DMZ-DC1-SDE
   router-id 10.100.101.5
   log-adjacency-changes
!
!
! Create L2 VLAN
vlan 34
!
interface vlan 34
  description L3_SDE_DMZ_DMZ-DVT-DC1-SDE-CELL1
  vrf member DMZ-DVT-DC1-SDE-CELL1 
  ip address 10.255.16.185 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.11
  no shutdown
!
!
router ospf DMZ
 vrf DMZ-DVT-DC1-SDE-CELL1
   router-id 10.100.101.5
   log-adjacency-changes
 vrf DMZ-DVT-DC1-SDE-CELL1
   router-id 10.100.101.5
   log-adjacency-changes
!
!
router bgp 65506
 router-id 10.100.101.5
 address-family l2vpn evpn
  maximum-paths 8
vrf SVC-SDE-DC1-SDE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.22.2 remote-as 65505
 description TO_dc1sdenxc1sdeouter_SERVICES-DC1-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.22.6 remote-as 65505
 description TO_dc1sdenxc2sdeouter_SERVICES-DC1-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf SVC-ITC-DC1-SDE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.22.2 remote-as 65505
 description TO_dc1sdenxc1sdeouter_SERVICES-DC1-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.22.6 remote-as 65505
 description TO_dc1sdenxc2sdeouter_SERVICES-DC1-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf SVC-MMD-DC1-SDE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.22.58 remote-as 65505
 description TO_dc1sdenxc1sdeouter_SERVICES-DC1-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.22.62 remote-as 65505
 description TO_dc1sdenxc2sdeouter_SERVICES-DC1-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-DA1-DC1-SDE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.22.26 remote-as 65505
 description TO_dc1sdenxc1sdeouter_CONTROL-DC1-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.22.30 remote-as 65505
 description TO_dc1sdenxc2sdeouter_CONTROL-DC1-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-DA2-DC1-SDE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.22.26 remote-as 65505
 description TO_dc1sdenxc1sdeouter_CONTROL-DC1-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.22.30 remote-as 65505
 description TO_dc1sdenxc2sdeouter_CONTROL-DC1-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PTD-DC1-SDE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.22.26 remote-as 65505
 description TO_dc1sdenxc1sdeouter_CONTROL-DC1-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.22.30 remote-as 65505
 description TO_dc1sdenxc2sdeouter_CONTROL-DC1-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PTD-DMZ-DC1-SDE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.22.26 remote-as 65505
 description TO_dc1sdenxc1sdeouter_CONTROL-DC1-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.22.30 remote-as 65505
 description TO_dc1sdenxc2sdeouter_CONTROL-DC1-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DVT-DC1-SDE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.22.34 remote-as 65505
 description TO_dc1sdenxc1sdeouter_DMZ-DC1-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.22.38 remote-as 65505
 description TO_dc1sdenxc2sdeouter_DMZ-DC1-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DVT-DC1-SDE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.22.34 remote-as 65505
 description TO_dc1sdenxc1sdeouter_DMZ-DC1-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.22.38 remote-as 65505
 description TO_dc1sdenxc2sdeouter_DMZ-DC1-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
!
!
!
! Allow VLANs on the firewall
!
interface E2/12
description TO_dc1sdenwa1pfw2b_E1
switchport
switchport mode trunk
switchport trunk allow vlan 16
no shutdown
!
interface E2/4
description TO_dc1sdenwa1pfw2a_E1
switchport
switchport mode trunk
switchport trunk allow vlan 16
no shutdown
!
interface E2/11
description TO_dc1sdedma1pfw2b_E1/13
switchport
switchport mode trunk
switchport trunk allow vlan 34
no shutdown
!
interface E2/3
description TO_dc1sdedma1pfw2a_E1/13
switchport
switchport mode trunk
switchport trunk allow vlan 34
no shutdown
!
interface E2/13
description TO_dc1sdenwa1pfw1b_E1/13
switchport
switchport mode trunk
switchport trunk allow vlan 11,12,26,27,28,29
no shutdown
!
interface E2/5
description TO_dc1sdenwa1pfw1a_E1/13
switchport
switchport mode trunk
switchport trunk allow vlan 11,12,26,27,28,29
no shutdown
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!! District SDE, DC dc1, nexusVDC N7K-F
!
! Create L2 VLAN
vlan 11
!
interface vlan 11
  description L3_SDE_SERVICES_SVC-SDE-DC1-SDE
  vrf member SVC-SDE-DC1-SDE 
  ip address 10.255.16.5 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.11
  no shutdown
! Create L2 VLAN
vlan 12
!
interface vlan 12
  description L3_SDE_SERVICES_SVC-ITC-DC1-SDE
  vrf member SVC-ITC-DC1-SDE 
  ip address 10.255.16.13 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.11
  no shutdown
! Create L2 VLAN
vlan 16
!
interface vlan 16
  description L3_SDE_SERVICES_SVC-MMD-DC1-SDE
  vrf member SVC-MMD-DC1-SDE 
  ip address 10.255.16.45 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.11
  no shutdown
!
!
router ospf SERVICES
 vrf SVC-SDE-DC1-SDE
   router-id 10.100.101.6
   log-adjacency-changes
 vrf SVC-ITC-DC1-SDE
   router-id 10.100.101.6
   log-adjacency-changes
 vrf SVC-MMD-DC1-SDE
   router-id 10.100.101.6
   log-adjacency-changes
!
!
! Create L2 VLAN
vlan 26
!
interface vlan 26
  description L3_SDE_CONTROL_CTL-DA1-DC1-SDE
  vrf member CTL-DA1-DC1-SDE 
  ip address 10.255.16.125 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.11
  no shutdown
! Create L2 VLAN
vlan 27
!
interface vlan 27
  description L3_SDE_CONTROL_CTL-DA2-DC1-SDE
  vrf member CTL-DA2-DC1-SDE 
  ip address 10.255.16.133 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.11
  no shutdown
! Create L2 VLAN
vlan 28
!
interface vlan 28
  description L3_SDE_CONTROL_CTL-PTD-DC1-SDE
  vrf member CTL-PTD-DC1-SDE 
  ip address 10.255.16.141 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.11
  no shutdown
! Create L2 VLAN
vlan 29
!
interface vlan 29
  description L3_SDE_CONTROL_CTL-PTD-DMZ-DC1-SDE
  vrf member CTL-PTD-DMZ-DC1-SDE 
  ip address 10.255.16.149 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.11
  no shutdown
!
!
router ospf CONTROL
 vrf CTL-DA1-DC1-SDE
   router-id 10.100.101.6
   log-adjacency-changes
 vrf CTL-DA2-DC1-SDE
   router-id 10.100.101.6
   log-adjacency-changes
 vrf CTL-PTD-DC1-SDE
   router-id 10.100.101.6
   log-adjacency-changes
 vrf CTL-PTD-DMZ-DC1-SDE
   router-id 10.100.101.6
   log-adjacency-changes
!
!
! Create L2 VLAN
vlan 34
!
interface vlan 34
  description L3_SDE_DMZ_DMZ-DVT-DC1-SDE-CELL1
  vrf member DMZ-DVT-DC1-SDE-CELL1 
  ip address 10.255.16.189 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.11
  no shutdown
!
!
router ospf DMZ
 vrf DMZ-DVT-DC1-SDE-CELL1
   router-id 10.100.101.6
   log-adjacency-changes
 vrf DMZ-DVT-DC1-SDE-CELL1
   router-id 10.100.101.6
   log-adjacency-changes
!
!
router bgp 65506
 router-id 10.100.101.6
 address-family l2vpn evpn
  maximum-paths 8
vrf SVC-SDE-DC1-SDE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.22.2 remote-as 65505
 description TO_dc1sdenxc1sdeouter_SERVICES-DC1-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.22.6 remote-as 65505
 description TO_dc1sdenxc2sdeouter_SERVICES-DC1-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf SVC-ITC-DC1-SDE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.22.2 remote-as 65505
 description TO_dc1sdenxc1sdeouter_SERVICES-DC1-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.22.6 remote-as 65505
 description TO_dc1sdenxc2sdeouter_SERVICES-DC1-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf SVC-MMD-DC1-SDE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.22.58 remote-as 65505
 description TO_dc1sdenxc1sdeouter_SERVICES-DC1-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.22.62 remote-as 65505
 description TO_dc1sdenxc2sdeouter_SERVICES-DC1-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-DA1-DC1-SDE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.22.26 remote-as 65505
 description TO_dc1sdenxc1sdeouter_CONTROL-DC1-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.22.30 remote-as 65505
 description TO_dc1sdenxc2sdeouter_CONTROL-DC1-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-DA2-DC1-SDE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.22.26 remote-as 65505
 description TO_dc1sdenxc1sdeouter_CONTROL-DC1-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.22.30 remote-as 65505
 description TO_dc1sdenxc2sdeouter_CONTROL-DC1-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PTD-DC1-SDE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.22.26 remote-as 65505
 description TO_dc1sdenxc1sdeouter_CONTROL-DC1-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.22.30 remote-as 65505
 description TO_dc1sdenxc2sdeouter_CONTROL-DC1-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PTD-DMZ-DC1-SDE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.22.26 remote-as 65505
 description TO_dc1sdenxc1sdeouter_CONTROL-DC1-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.22.30 remote-as 65505
 description TO_dc1sdenxc2sdeouter_CONTROL-DC1-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DVT-DC1-SDE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.22.34 remote-as 65505
 description TO_dc1sdenxc1sdeouter_DMZ-DC1-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.22.38 remote-as 65505
 description TO_dc1sdenxc2sdeouter_DMZ-DC1-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DVT-DC1-SDE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.22.34 remote-as 65505
 description TO_dc1sdenxc1sdeouter_DMZ-DC1-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.22.38 remote-as 65505
 description TO_dc1sdenxc2sdeouter_DMZ-DC1-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
!
!
!
! Allow VLANs on the firewall
!
interface E2/12
description TO_dc1sdenwa1pfw2b_E1
switchport
switchport mode trunk
switchport trunk allow vlan 16
no shutdown
!
interface E2/4
description TO_dc1sdenwa1pfw2a_E1
switchport
switchport mode trunk
switchport trunk allow vlan 16
no shutdown
!
interface E2/11
description TO_dc1sdedma1pfw2b_E1/14
switchport
switchport mode trunk
switchport trunk allow vlan 34
no shutdown
!
interface E2/3
description TO_dc1sdedma1pfw2a_E1/14
switchport
switchport mode trunk
switchport trunk allow vlan 34
no shutdown
!
interface E2/13
description TO_dc1sdenwa1pfw1b_E1/14
switchport
switchport mode trunk
switchport trunk allow vlan 11,12,26,27,28,29
no shutdown
!
interface E2/5
description TO_dc1sdenwa1pfw1a_E1/14
switchport
switchport mode trunk
switchport trunk allow vlan 11,12,26,27,28,29
no shutdown
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!! District GIS, DC dc2, nexusVDC N7K-B
!
! Create L2 VLAN
vlan 11
!
interface vlan 11
  description L3_GIS_SERVICES_SVC-COM-DC2-GIS
  vrf member SVC-COM-DC2-GIS 
  ip address 10.255.48.5 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 12
!
interface vlan 12
  description L3_GIS_SERVICES_SVC-ITC-DC2-GIS
  vrf member SVC-ITC-DC2-GIS 
  ip address 10.255.48.21 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 13
!
interface vlan 13
  description L3_GIS_SERVICES_SVC-BSC-DC2-GIS
  vrf member SVC-BSC-DC2-GIS 
  ip address 10.255.48.37 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 14
!
interface vlan 14
  description L3_GIS_SERVICES_SVC-TFR-DC2-GIS
  vrf member SVC-TFR-DC2-GIS 
  ip address 10.255.48.53 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.12
  no shutdown
!
!
router ospf SERVICES
 vrf SVC-COM-DC2-GIS
   router-id 10.100.201.8
   log-adjacency-changes
 vrf SVC-ITC-DC2-GIS
   router-id 10.100.201.8
   log-adjacency-changes
 vrf SVC-BSC-DC2-GIS
   router-id 10.100.201.8
   log-adjacency-changes
 vrf SVC-TFR-DC2-GIS
   router-id 10.100.201.8
   log-adjacency-changes
!
!
! Create L2 VLAN
vlan 27
!
interface vlan 27
  description L3_GIS_CONTROL_CTL-PA1-DC2-GIS
  vrf member CTL-PA1-DC2-GIS 
  ip address 10.255.49.5 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 28
!
interface vlan 28
  description L3_GIS_CONTROL_CTL-PA2-DC2-GIS
  vrf member CTL-PA2-DC2-GIS 
  ip address 10.255.49.21 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 29
!
interface vlan 29
  description L3_GIS_CONTROL_CTL-PTM-DC2-GIS
  vrf member CTL-PTM-DC2-GIS 
  ip address 10.255.49.37 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 30
!
interface vlan 30
  description L3_GIS_CONTROL_CTL-PTM-DMZ-DC2-GIS
  vrf member CTL-PTM-DMZ-DC2-GIS 
  ip address 10.255.49.53 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.12
  no shutdown
!
!
router ospf CONTROL
 vrf CTL-PA1-DC2-GIS
   router-id 10.100.201.8
   log-adjacency-changes
 vrf CTL-PA2-DC2-GIS
   router-id 10.100.201.8
   log-adjacency-changes
 vrf CTL-PTM-DC2-GIS
   router-id 10.100.201.8
   log-adjacency-changes
 vrf CTL-PTM-DMZ-DC2-GIS
   router-id 10.100.201.8
   log-adjacency-changes
!
!
! Create L2 VLAN
vlan 46
!
interface vlan 46
  description L3_GIS_RESTRICTED_RES-MMP-DC2-GIS
  vrf member RES-MMP-DC2-GIS 
  ip address 10.255.50.53 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf RESTRICTED area 0.0.0.12
  no shutdown
!
!
router ospf RESTRICTED
 vrf RES-MMP-DC2-GIS
   router-id 10.100.201.8
   log-adjacency-changes
!
!
router bgp 65512
 router-id 10.100.201.8
 address-family l2vpn evpn
  maximum-paths 8
vrf SVC-COM-DC2-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.54.2 remote-as 65510
 description TO_dc2dcinxc1dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.6 remote-as 65510
 description TO_dc2dcinxc2dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.10 remote-as 65510
 description TO_dc2dcinxc3dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.14 remote-as 65510
 description TO_dc2dcinxc4dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf SVC-ITC-DC2-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.54.2 remote-as 65510
 description TO_dc2dcinxc1dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.6 remote-as 65510
 description TO_dc2dcinxc2dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.10 remote-as 65510
 description TO_dc2dcinxc3dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.14 remote-as 65510
 description TO_dc2dcinxc4dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf SVC-BSC-DC2-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.54.2 remote-as 65510
 description TO_dc2dcinxc1dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.6 remote-as 65510
 description TO_dc2dcinxc2dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.10 remote-as 65510
 description TO_dc2dcinxc3dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.14 remote-as 65510
 description TO_dc2dcinxc4dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf SVC-TFR-DC2-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.54.2 remote-as 65510
 description TO_dc2dcinxc1dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.6 remote-as 65510
 description TO_dc2dcinxc2dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.10 remote-as 65510
 description TO_dc2dcinxc3dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.14 remote-as 65510
 description TO_dc2dcinxc4dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PA1-DC2-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.54.50 remote-as 65510
 description TO_dc2dcinxc1dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.54 remote-as 65510
 description TO_dc2dcinxc2dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.58 remote-as 65510
 description TO_dc2dcinxc3dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.62 remote-as 65510
 description TO_dc2dcinxc4dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PA2-DC2-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.54.50 remote-as 65510
 description TO_dc2dcinxc1dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.54 remote-as 65510
 description TO_dc2dcinxc2dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.58 remote-as 65510
 description TO_dc2dcinxc3dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.62 remote-as 65510
 description TO_dc2dcinxc4dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PTM-DC2-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.54.50 remote-as 65510
 description TO_dc2dcinxc1dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.54 remote-as 65510
 description TO_dc2dcinxc2dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.58 remote-as 65510
 description TO_dc2dcinxc3dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.62 remote-as 65510
 description TO_dc2dcinxc4dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PTM-DMZ-DC2-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.54.50 remote-as 65510
 description TO_dc2dcinxc1dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.54 remote-as 65510
 description TO_dc2dcinxc2dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.58 remote-as 65510
 description TO_dc2dcinxc3dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.62 remote-as 65510
 description TO_dc2dcinxc4dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf RES-MMP-DC2-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.54.114 remote-as 65510
 description TO_dc2dcinxc1dciouter_RESTRICTED-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.118 remote-as 65510
 description TO_dc2dcinxc2dciouter_RESTRICTED-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.122 remote-as 65510
 description TO_dc2dcinxc3dciouter_RESTRICTED-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.126 remote-as 65510
 description TO_dc2dcinxc4dciouter_RESTRICTED-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
!
!
!
! Allow VLANs on the firewall
!
interface E2/30
description TO_dc2gisnwa1pfw1b_E1/14
switchport
switchport mode trunk
switchport trunk allow vlan 11,12,13,14,27,28,29,30
no shutdown
!
interface E2/28
description TO_dc2gisnwa1pfw2b_E1/14
switchport
switchport mode trunk
switchport trunk allow vlan 46
no shutdown
!
interface E2/27
description TO_dc2gisnwa1pfw2a_E1/14
switchport
switchport mode trunk
switchport trunk allow vlan 46
no shutdown
!
interface E2/29
description TO_dc2gisnwa1pfw1a_E1/14
switchport
switchport mode trunk
switchport trunk allow vlan 11,12,13,14,27,28,29,30
no shutdown
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!! District GIS, DC dc1, nexusVDC N7K-C
!
! Create L2 VLAN
vlan 11
!
interface vlan 11
  description L3_GIS_SERVICES_SVC-COM-DC1-GIS
  vrf member SVC-COM-DC1-GIS 
  ip address 10.255.24.9 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 12
!
interface vlan 12
  description L3_GIS_SERVICES_SVC-ITC-DC1-GIS
  vrf member SVC-ITC-DC1-GIS 
  ip address 10.255.24.25 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 13
!
interface vlan 13
  description L3_GIS_SERVICES_SVC-BSC-DC1-GIS
  vrf member SVC-BSC-DC1-GIS 
  ip address 10.255.24.41 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 14
!
interface vlan 14
  description L3_GIS_SERVICES_SVC-TFR-DC1-GIS
  vrf member SVC-TFR-DC1-GIS 
  ip address 10.255.24.57 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.12
  no shutdown
!
!
router ospf SERVICES
 vrf SVC-COM-DC1-GIS
   router-id 10.100.101.9
   log-adjacency-changes
 vrf SVC-ITC-DC1-GIS
   router-id 10.100.101.9
   log-adjacency-changes
 vrf SVC-BSC-DC1-GIS
   router-id 10.100.101.9
   log-adjacency-changes
 vrf SVC-TFR-DC1-GIS
   router-id 10.100.101.9
   log-adjacency-changes
!
!
! Create L2 VLAN
vlan 27
!
interface vlan 27
  description L3_GIS_CONTROL_CTL-PA1-DC1-GIS
  vrf member CTL-PA1-DC1-GIS 
  ip address 10.255.25.9 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 28
!
interface vlan 28
  description L3_GIS_CONTROL_CTL-PA2-DC1-GIS
  vrf member CTL-PA2-DC1-GIS 
  ip address 10.255.25.25 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 29
!
interface vlan 29
  description L3_GIS_CONTROL_CTL-PTM-DC1-GIS
  vrf member CTL-PTM-DC1-GIS 
  ip address 10.255.25.41 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 30
!
interface vlan 30
  description L3_GIS_CONTROL_CTL-PTM-DMZ-DC1-GIS
  vrf member CTL-PTM-DMZ-DC1-GIS 
  ip address 10.255.25.57 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.12
  no shutdown
!
!
router ospf CONTROL
 vrf CTL-PA1-DC1-GIS
   router-id 10.100.101.9
   log-adjacency-changes
 vrf CTL-PA2-DC1-GIS
   router-id 10.100.101.9
   log-adjacency-changes
 vrf CTL-PTM-DC1-GIS
   router-id 10.100.101.9
   log-adjacency-changes
 vrf CTL-PTM-DMZ-DC1-GIS
   router-id 10.100.101.9
   log-adjacency-changes
!
!
! Create L2 VLAN
vlan 46
!
interface vlan 46
  description L3_GIS_RESTRICTED_RES-MMP-DC1-GIS
  vrf member RES-MMP-DC1-GIS 
  ip address 10.255.26.57 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf RESTRICTED area 0.0.0.12
  no shutdown
!
!
router ospf RESTRICTED
 vrf RES-MMP-DC1-GIS
   router-id 10.100.101.9
   log-adjacency-changes
!
!
router bgp 65502
 router-id 10.100.101.9
 address-family l2vpn evpn
  maximum-paths 8
vrf SVC-COM-DC1-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.30.2 remote-as 65500
 description TO_dc1dcinxc1dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.6 remote-as 65500
 description TO_dc1dcinxc2dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.10 remote-as 65500
 description TO_dc1dcinxc3dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.14 remote-as 65500
 description TO_dc1dcinxc4dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf SVC-ITC-DC1-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.30.2 remote-as 65500
 description TO_dc1dcinxc1dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.6 remote-as 65500
 description TO_dc1dcinxc2dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.10 remote-as 65500
 description TO_dc1dcinxc3dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.14 remote-as 65500
 description TO_dc1dcinxc4dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf SVC-BSC-DC1-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.30.2 remote-as 65500
 description TO_dc1dcinxc1dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.6 remote-as 65500
 description TO_dc1dcinxc2dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.10 remote-as 65500
 description TO_dc1dcinxc3dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.14 remote-as 65500
 description TO_dc1dcinxc4dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf SVC-TFR-DC1-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.30.2 remote-as 65500
 description TO_dc1dcinxc1dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.6 remote-as 65500
 description TO_dc1dcinxc2dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.10 remote-as 65500
 description TO_dc1dcinxc3dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.14 remote-as 65500
 description TO_dc1dcinxc4dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PA1-DC1-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.30.50 remote-as 65500
 description TO_dc1dcinxc1dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.54 remote-as 65500
 description TO_dc1dcinxc2dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.58 remote-as 65500
 description TO_dc1dcinxc3dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.62 remote-as 65500
 description TO_dc1dcinxc4dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PA2-DC1-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.30.50 remote-as 65500
 description TO_dc1dcinxc1dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.54 remote-as 65500
 description TO_dc1dcinxc2dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.58 remote-as 65500
 description TO_dc1dcinxc3dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.62 remote-as 65500
 description TO_dc1dcinxc4dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PTM-DC1-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.30.50 remote-as 65500
 description TO_dc1dcinxc1dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.54 remote-as 65500
 description TO_dc1dcinxc2dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.58 remote-as 65500
 description TO_dc1dcinxc3dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.62 remote-as 65500
 description TO_dc1dcinxc4dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PTM-DMZ-DC1-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.30.50 remote-as 65500
 description TO_dc1dcinxc1dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.54 remote-as 65500
 description TO_dc1dcinxc2dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.58 remote-as 65500
 description TO_dc1dcinxc3dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.62 remote-as 65500
 description TO_dc1dcinxc4dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf RES-MMP-DC1-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.30.114 remote-as 65500
 description TO_dc1dcinxc1dciouter_RESTRICTED-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.118 remote-as 65500
 description TO_dc1dcinxc2dciouter_RESTRICTED-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.122 remote-as 65500
 description TO_dc1dcinxc3dciouter_RESTRICTED-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.126 remote-as 65500
 description TO_dc1dcinxc4dciouter_RESTRICTED-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
!
!
!
! Allow VLANs on the firewall
!
interface E2/29
description TO_dc1gisnwa1pfw1a_E1/15
switchport
switchport mode trunk
switchport trunk allow vlan 11,12,13,14,27,28,29,30
no shutdown
!
interface E2/30
description TO_dc1gisnwa1pfw1b_E1/15
switchport
switchport mode trunk
switchport trunk allow vlan 11,12,13,14,27,28,29,30
no shutdown
!
interface E2/27
description TO_dc1gisnwa1pfw2a_E1/15
switchport
switchport mode trunk
switchport trunk allow vlan 46
no shutdown
!
interface E2/28
description TO_dc1gisnwa1pfw2b_E1/15
switchport
switchport mode trunk
switchport trunk allow vlan 46
no shutdown
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!! District SOE, DC dc1, nexusVDC N7K-C
!
!
!
! Create L2 VLAN
vlan 43
!
interface vlan 43
  description L3_SOE_AUDIT_AUD-ACC-DC1-SOE
  vrf member AUD-ACC-DC1-SOE 
  ip address 10.255.10.9 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf AUDIT area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 44
!
interface vlan 44
  description L3_SOE_AUDIT_AUD-DAT-DC1-SOE
  vrf member AUD-DAT-DC1-SOE 
  ip address 10.255.10.25 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf AUDIT area 0.0.0.10
  no shutdown
!
!
router ospf AUDIT
 vrf AUD-ACC-DC1-SOE
   router-id 10.100.101.3
   log-adjacency-changes
 vrf AUD-DAT-DC1-SOE
   router-id 10.100.101.3
   log-adjacency-changes
!
!
! Create L2 VLAN
vlan 46
!
interface vlan 46
  description L3_SOE_RESTRICTED_RES-DST-DC1-SOE
  vrf member RES-DST-DC1-SOE 
  ip address 10.255.10.57 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf RESTRICTED area 0.0.0.10
  no shutdown
!
!
router ospf RESTRICTED
 vrf RES-DST-DC1-SOE
   router-id 10.100.101.3
   log-adjacency-changes
!
!
!
! Create L2 VLAN
vlan 36
!
interface vlan 36
  description L3_SOE_DMZ_DMZ-WEB-DC1-SOE-CELL1
  vrf member DMZ-WEB-DC1-SOE-CELL1 
  ip address 10.255.9.153 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 37
!
interface vlan 37
  description L3_SOE_DMZ_DMZ-B2B-DC1-SOE-CELL1
  vrf member DMZ-B2B-DC1-SOE-CELL1 
  ip address 10.255.9.169 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 38
!
interface vlan 38
  description L3_SOE_DMZ_DMZ-MAL-DC1-SOE-CELL1
  vrf member DMZ-MAL-DC1-SOE-CELL1 
  ip address 10.255.9.185 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 39
!
interface vlan 39
  description L3_SOE_DMZ_DMZ-DNS-DC1-SOE-CELL1
  vrf member DMZ-DNS-DC1-SOE-CELL1 
  ip address 10.255.9.201 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 40
!
interface vlan 40
  description L3_SOE_DMZ_DMZ-RAC-DC1-SOE-CELL1
  vrf member DMZ-RAC-DC1-SOE-CELL1 
  ip address 10.255.9.217 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 41
!
interface vlan 41
  description L3_SOE_DMZ_DMZ-PXY-DC1-SOE-CELL1
  vrf member DMZ-PXY-DC1-SOE-CELL1 
  ip address 10.255.9.233 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 48
!
interface vlan 48
  description L3_SOE_DMZ_DMZ-WEB-DC1-SOE-CELL2
  vrf member DMZ-WEB-DC1-SOE-CELL2 
  ip address 10.255.10.89 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 49
!
interface vlan 49
  description L3_SOE_DMZ_DMZ-B2B-DC1-SOE-CELL2
  vrf member DMZ-B2B-DC1-SOE-CELL2 
  ip address 10.255.10.105 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 50
!
interface vlan 50
  description L3_SOE_DMZ_DMZ-MAL-DC1-SOE-CELL2
  vrf member DMZ-MAL-DC1-SOE-CELL2 
  ip address 10.255.10.121 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 51
!
interface vlan 51
  description L3_SOE_DMZ_DMZ-DNS-DC1-SOE-CELL2
  vrf member DMZ-DNS-DC1-SOE-CELL2 
  ip address 10.255.10.137 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
!
!
router ospf DMZ
 vrf DMZ-WEB-DC1-SOE-CELL1
   router-id 10.100.101.3
   log-adjacency-changes
 vrf DMZ-WEB-DC1-SOE-CELL1
   router-id 10.100.101.3
   log-adjacency-changes
 vrf DMZ-B2B-DC1-SOE-CELL1
   router-id 10.100.101.3
   log-adjacency-changes
 vrf DMZ-B2B-DC1-SOE-CELL1
   router-id 10.100.101.3
   log-adjacency-changes
 vrf DMZ-MAL-DC1-SOE-CELL1
   router-id 10.100.101.3
   log-adjacency-changes
 vrf DMZ-MAL-DC1-SOE-CELL1
   router-id 10.100.101.3
   log-adjacency-changes
 vrf DMZ-DNS-DC1-SOE-CELL1
   router-id 10.100.101.3
   log-adjacency-changes
 vrf DMZ-DNS-DC1-SOE-CELL1
   router-id 10.100.101.3
   log-adjacency-changes
 vrf DMZ-RAC-DC1-SOE-CELL1
   router-id 10.100.101.3
   log-adjacency-changes
 vrf DMZ-RAC-DC1-SOE-CELL1
   router-id 10.100.101.3
   log-adjacency-changes
 vrf DMZ-PXY-DC1-SOE-CELL1
   router-id 10.100.101.3
   log-adjacency-changes
 vrf DMZ-PXY-DC1-SOE-CELL1
   router-id 10.100.101.3
   log-adjacency-changes
 vrf DMZ-WEB-DC1-SOE-CELL2
   router-id 10.100.101.3
   log-adjacency-changes
 vrf DMZ-WEB-DC1-SOE-CELL2
   router-id 10.100.101.3
   log-adjacency-changes
 vrf DMZ-B2B-DC1-SOE-CELL2
   router-id 10.100.101.3
   log-adjacency-changes
 vrf DMZ-B2B-DC1-SOE-CELL2
   router-id 10.100.101.3
   log-adjacency-changes
 vrf DMZ-MAL-DC1-SOE-CELL2
   router-id 10.100.101.3
   log-adjacency-changes
 vrf DMZ-MAL-DC1-SOE-CELL2
   router-id 10.100.101.3
   log-adjacency-changes
 vrf DMZ-DNS-DC1-SOE-CELL2
   router-id 10.100.101.3
   log-adjacency-changes
 vrf DMZ-DNS-DC1-SOE-CELL2
   router-id 10.100.101.3
   log-adjacency-changes
!
!
router bgp 65501
 router-id 10.100.101.3
 address-family l2vpn evpn
  maximum-paths 8
vrf AUD-ACC-DC1-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.82 remote-as 65500
 description TO_dc1dcinxc1dciouter_AUDIT-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.86 remote-as 65500
 description TO_dc1dcinxc2dciouter_AUDIT-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.90 remote-as 65500
 description TO_dc1dcinxc3dciouter_AUDIT-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.94 remote-as 65500
 description TO_dc1dcinxc4dciouter_AUDIT-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf AUD-DAT-DC1-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.82 remote-as 65500
 description TO_dc1dcinxc1dciouter_AUDIT-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.86 remote-as 65500
 description TO_dc1dcinxc2dciouter_AUDIT-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.90 remote-as 65500
 description TO_dc1dcinxc3dciouter_AUDIT-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.94 remote-as 65500
 description TO_dc1dcinxc4dciouter_AUDIT-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf RES-DST-DC1-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.114 remote-as 65500
 description TO_dc1dcinxc1dciouter_RESTRICTED-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.118 remote-as 65500
 description TO_dc1dcinxc2dciouter_RESTRICTED-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.122 remote-as 65500
 description TO_dc1dcinxc3dciouter_RESTRICTED-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.126 remote-as 65500
 description TO_dc1dcinxc4dciouter_RESTRICTED-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-WEB-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.66 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.70 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.74 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.78 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-WEB-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.66 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.70 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.74 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.78 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-B2B-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.66 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.70 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.74 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.78 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-B2B-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.66 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.70 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.74 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.78 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-MAL-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.66 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.70 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.74 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.78 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-MAL-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.66 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.70 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.74 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.78 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DNS-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.66 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.70 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.74 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.78 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DNS-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.66 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.70 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.74 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.78 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-RAC-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.146 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.150 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.154 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.158 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-RAC-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.146 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.150 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.154 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.158 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-PXY-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.162 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.166 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.170 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.174 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-PXY-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.162 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.166 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.170 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.174 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-WEB-DC1-SOE-CELL2
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.178 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.182 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.186 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.190 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-WEB-DC1-SOE-CELL2
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.178 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.182 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.186 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.190 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-B2B-DC1-SOE-CELL2
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.178 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.182 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.186 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.190 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-B2B-DC1-SOE-CELL2
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.178 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.182 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.186 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.190 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-MAL-DC1-SOE-CELL2
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.178 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.182 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.186 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.190 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-MAL-DC1-SOE-CELL2
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.178 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.182 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.186 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.190 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DNS-DC1-SOE-CELL2
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.178 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.182 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.186 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.190 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DNS-DC1-SOE-CELL2
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.178 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.182 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.186 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.190 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
!
!
!
! Allow VLANs on the firewall
!
interface E2/12
description TO_dc1soedmb1pfw2b_E1/15
switchport
switchport mode trunk
switchport trunk allow vlan 48,49,50,51
no shutdown
!
interface E2/4
description TO_dc1soedmb1pfw2a_E1/15
switchport
switchport mode trunk
switchport trunk allow vlan 48,49,50,51
no shutdown
!
interface E2/13
description TO_dc1soedma2pfw4b_E1/15
switchport
switchport mode trunk
switchport trunk allow vlan 41
no shutdown
!
interface E2/5
description TO_dc1soedma1pfw4a_E1/15
switchport
switchport mode trunk
switchport trunk allow vlan 41
no shutdown
!
interface E7706 B/02:43
description TO_dc1soedma2pfw2b_E1/15
switchport
switchport mode trunk
switchport trunk allow vlan 36,37,38,39
no shutdown
!
interface E2/3
description TO_dc1soenwa1pfw1a_E1/15
switchport
switchport mode trunk
switchport trunk allow vlan 43,44,46
no shutdown
!
interface E2/6
description TO_dc1soedma1pfw6a_E1/15
switchport
switchport mode trunk
switchport trunk allow vlan 40
no shutdown
!
interface E2/11
description TO_dc1soenwa1pfw1b_E1/15
switchport
switchport mode trunk
switchport trunk allow vlan 43,44,46
no shutdown
!
interface E2/14
description TO_dc1soedma2pfw6b_E1/15
switchport
switchport mode trunk
switchport trunk allow vlan 40
no shutdown
!
interface E7706 A/02:43
description TO_dc1soedma1pfw2a_E1/15
switchport
switchport mode trunk
switchport trunk allow vlan 36,37,38,39
no shutdown
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!! District SOE, DC dc1, nexusVDC N7K-A
!
!
!
! Create L2 VLAN
vlan 43
!
interface vlan 43
  description L3_SOE_AUDIT_AUD-ACC-DC1-SOE
  vrf member AUD-ACC-DC1-SOE 
  ip address 10.255.10.1 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf AUDIT area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 44
!
interface vlan 44
  description L3_SOE_AUDIT_AUD-DAT-DC1-SOE
  vrf member AUD-DAT-DC1-SOE 
  ip address 10.255.10.17 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf AUDIT area 0.0.0.10
  no shutdown
!
!
router ospf AUDIT
 vrf AUD-ACC-DC1-SOE
   router-id 10.100.101.1
   log-adjacency-changes
 vrf AUD-DAT-DC1-SOE
   router-id 10.100.101.1
   log-adjacency-changes
!
!
! Create L2 VLAN
vlan 46
!
interface vlan 46
  description L3_SOE_RESTRICTED_RES-DST-DC1-SOE
  vrf member RES-DST-DC1-SOE 
  ip address 10.255.10.49 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf RESTRICTED area 0.0.0.10
  no shutdown
!
!
router ospf RESTRICTED
 vrf RES-DST-DC1-SOE
   router-id 10.100.101.1
   log-adjacency-changes
!
!
!
! Create L2 VLAN
vlan 36
!
interface vlan 36
  description L3_SOE_DMZ_DMZ-WEB-DC1-SOE-CELL1
  vrf member DMZ-WEB-DC1-SOE-CELL1 
  ip address 10.255.9.145 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 37
!
interface vlan 37
  description L3_SOE_DMZ_DMZ-B2B-DC1-SOE-CELL1
  vrf member DMZ-B2B-DC1-SOE-CELL1 
  ip address 10.255.9.161 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 38
!
interface vlan 38
  description L3_SOE_DMZ_DMZ-MAL-DC1-SOE-CELL1
  vrf member DMZ-MAL-DC1-SOE-CELL1 
  ip address 10.255.9.177 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 39
!
interface vlan 39
  description L3_SOE_DMZ_DMZ-DNS-DC1-SOE-CELL1
  vrf member DMZ-DNS-DC1-SOE-CELL1 
  ip address 10.255.9.193 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 40
!
interface vlan 40
  description L3_SOE_DMZ_DMZ-RAC-DC1-SOE-CELL1
  vrf member DMZ-RAC-DC1-SOE-CELL1 
  ip address 10.255.9.209 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 41
!
interface vlan 41
  description L3_SOE_DMZ_DMZ-PXY-DC1-SOE-CELL1
  vrf member DMZ-PXY-DC1-SOE-CELL1 
  ip address 10.255.9.225 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 48
!
interface vlan 48
  description L3_SOE_DMZ_DMZ-WEB-DC1-SOE-CELL2
  vrf member DMZ-WEB-DC1-SOE-CELL2 
  ip address 10.255.10.81 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 49
!
interface vlan 49
  description L3_SOE_DMZ_DMZ-B2B-DC1-SOE-CELL2
  vrf member DMZ-B2B-DC1-SOE-CELL2 
  ip address 10.255.10.97 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 50
!
interface vlan 50
  description L3_SOE_DMZ_DMZ-MAL-DC1-SOE-CELL2
  vrf member DMZ-MAL-DC1-SOE-CELL2 
  ip address 10.255.10.113 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 51
!
interface vlan 51
  description L3_SOE_DMZ_DMZ-DNS-DC1-SOE-CELL2
  vrf member DMZ-DNS-DC1-SOE-CELL2 
  ip address 10.255.10.129 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
!
!
router ospf DMZ
 vrf DMZ-WEB-DC1-SOE-CELL1
   router-id 10.100.101.1
   log-adjacency-changes
 vrf DMZ-WEB-DC1-SOE-CELL1
   router-id 10.100.101.1
   log-adjacency-changes
 vrf DMZ-B2B-DC1-SOE-CELL1
   router-id 10.100.101.1
   log-adjacency-changes
 vrf DMZ-B2B-DC1-SOE-CELL1
   router-id 10.100.101.1
   log-adjacency-changes
 vrf DMZ-MAL-DC1-SOE-CELL1
   router-id 10.100.101.1
   log-adjacency-changes
 vrf DMZ-MAL-DC1-SOE-CELL1
   router-id 10.100.101.1
   log-adjacency-changes
 vrf DMZ-DNS-DC1-SOE-CELL1
   router-id 10.100.101.1
   log-adjacency-changes
 vrf DMZ-DNS-DC1-SOE-CELL1
   router-id 10.100.101.1
   log-adjacency-changes
 vrf DMZ-RAC-DC1-SOE-CELL1
   router-id 10.100.101.1
   log-adjacency-changes
 vrf DMZ-RAC-DC1-SOE-CELL1
   router-id 10.100.101.1
   log-adjacency-changes
 vrf DMZ-PXY-DC1-SOE-CELL1
   router-id 10.100.101.1
   log-adjacency-changes
 vrf DMZ-PXY-DC1-SOE-CELL1
   router-id 10.100.101.1
   log-adjacency-changes
 vrf DMZ-WEB-DC1-SOE-CELL2
   router-id 10.100.101.1
   log-adjacency-changes
 vrf DMZ-WEB-DC1-SOE-CELL2
   router-id 10.100.101.1
   log-adjacency-changes
 vrf DMZ-B2B-DC1-SOE-CELL2
   router-id 10.100.101.1
   log-adjacency-changes
 vrf DMZ-B2B-DC1-SOE-CELL2
   router-id 10.100.101.1
   log-adjacency-changes
 vrf DMZ-MAL-DC1-SOE-CELL2
   router-id 10.100.101.1
   log-adjacency-changes
 vrf DMZ-MAL-DC1-SOE-CELL2
   router-id 10.100.101.1
   log-adjacency-changes
 vrf DMZ-DNS-DC1-SOE-CELL2
   router-id 10.100.101.1
   log-adjacency-changes
 vrf DMZ-DNS-DC1-SOE-CELL2
   router-id 10.100.101.1
   log-adjacency-changes
!
!
router bgp 65501
 router-id 10.100.101.1
 address-family l2vpn evpn
  maximum-paths 8
vrf AUD-ACC-DC1-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.82 remote-as 65500
 description TO_dc1dcinxc1dciouter_AUDIT-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.86 remote-as 65500
 description TO_dc1dcinxc2dciouter_AUDIT-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.90 remote-as 65500
 description TO_dc1dcinxc3dciouter_AUDIT-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.94 remote-as 65500
 description TO_dc1dcinxc4dciouter_AUDIT-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf AUD-DAT-DC1-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.82 remote-as 65500
 description TO_dc1dcinxc1dciouter_AUDIT-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.86 remote-as 65500
 description TO_dc1dcinxc2dciouter_AUDIT-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.90 remote-as 65500
 description TO_dc1dcinxc3dciouter_AUDIT-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.94 remote-as 65500
 description TO_dc1dcinxc4dciouter_AUDIT-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf RES-DST-DC1-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.114 remote-as 65500
 description TO_dc1dcinxc1dciouter_RESTRICTED-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.118 remote-as 65500
 description TO_dc1dcinxc2dciouter_RESTRICTED-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.122 remote-as 65500
 description TO_dc1dcinxc3dciouter_RESTRICTED-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.126 remote-as 65500
 description TO_dc1dcinxc4dciouter_RESTRICTED-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-WEB-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.66 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.70 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.74 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.78 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-WEB-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.66 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.70 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.74 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.78 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-B2B-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.66 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.70 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.74 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.78 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-B2B-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.66 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.70 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.74 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.78 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-MAL-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.66 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.70 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.74 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.78 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-MAL-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.66 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.70 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.74 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.78 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DNS-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.66 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.70 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.74 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.78 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DNS-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.66 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.70 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.74 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.78 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-RAC-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.146 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.150 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.154 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.158 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-RAC-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.146 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.150 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.154 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.158 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-PXY-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.162 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.166 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.170 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.174 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-PXY-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.162 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.166 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.170 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.174 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-WEB-DC1-SOE-CELL2
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.178 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.182 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.186 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.190 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-WEB-DC1-SOE-CELL2
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.178 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.182 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.186 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.190 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-B2B-DC1-SOE-CELL2
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.178 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.182 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.186 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.190 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-B2B-DC1-SOE-CELL2
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.178 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.182 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.186 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.190 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-MAL-DC1-SOE-CELL2
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.178 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.182 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.186 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.190 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-MAL-DC1-SOE-CELL2
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.178 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.182 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.186 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.190 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DNS-DC1-SOE-CELL2
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.178 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.182 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.186 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.190 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DNS-DC1-SOE-CELL2
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.178 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.182 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.186 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.190 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
!
!
!
! Allow VLANs on the firewall
!
interface E2/12
description TO_dc1soedmb1pfw2b_E1/13
switchport
switchport mode trunk
switchport trunk allow vlan 48,49,50,51
no shutdown
!
interface E2/4
description TO_dc1soedmb1pfw2a_E1/13
switchport
switchport mode trunk
switchport trunk allow vlan 48,49,50,51
no shutdown
!
interface E2/13
description TO_dc1soedma2pfw4b_E1/13
switchport
switchport mode trunk
switchport trunk allow vlan 41
no shutdown
!
interface E2/5
description TO_dc1soedma1pfw4a_E1/13
switchport
switchport mode trunk
switchport trunk allow vlan 41
no shutdown
!
interface E7706 B/02:41
description TO_dc1soedma2pfw2b_E1/13
switchport
switchport mode trunk
switchport trunk allow vlan 36,37,38,39
no shutdown
!
interface E2/3
description TO_dc1soenwa1pfw1a_E1/13
switchport
switchport mode trunk
switchport trunk allow vlan 43,44,46
no shutdown
!
interface E2/6
description TO_dc1soedma1pfw6a_E1/13
switchport
switchport mode trunk
switchport trunk allow vlan 40
no shutdown
!
interface E2/11
description TO_dc1soenwa1pfw1b_E1/13
switchport
switchport mode trunk
switchport trunk allow vlan 43,44,46
no shutdown
!
interface E2/14
description TO_dc1soedma2pfw6b_E1/13
switchport
switchport mode trunk
switchport trunk allow vlan 40
no shutdown
!
interface E7706 A/02:41
description TO_dc1soedma1pfw2a_E1/13
switchport
switchport mode trunk
switchport trunk allow vlan 36,37,38,39
no shutdown
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!! District SOE, DC dc1, nexusVDC N7K-B
!
!
!
! Create L2 VLAN
vlan 43
!
interface vlan 43
  description L3_SOE_AUDIT_AUD-ACC-DC1-SOE
  vrf member AUD-ACC-DC1-SOE 
  ip address 10.255.10.5 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf AUDIT area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 44
!
interface vlan 44
  description L3_SOE_AUDIT_AUD-DAT-DC1-SOE
  vrf member AUD-DAT-DC1-SOE 
  ip address 10.255.10.21 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf AUDIT area 0.0.0.10
  no shutdown
!
!
router ospf AUDIT
 vrf AUD-ACC-DC1-SOE
   router-id 10.100.101.2
   log-adjacency-changes
 vrf AUD-DAT-DC1-SOE
   router-id 10.100.101.2
   log-adjacency-changes
!
!
! Create L2 VLAN
vlan 46
!
interface vlan 46
  description L3_SOE_RESTRICTED_RES-DST-DC1-SOE
  vrf member RES-DST-DC1-SOE 
  ip address 10.255.10.53 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf RESTRICTED area 0.0.0.10
  no shutdown
!
!
router ospf RESTRICTED
 vrf RES-DST-DC1-SOE
   router-id 10.100.101.2
   log-adjacency-changes
!
!
!
! Create L2 VLAN
vlan 36
!
interface vlan 36
  description L3_SOE_DMZ_DMZ-WEB-DC1-SOE-CELL1
  vrf member DMZ-WEB-DC1-SOE-CELL1 
  ip address 10.255.9.149 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 37
!
interface vlan 37
  description L3_SOE_DMZ_DMZ-B2B-DC1-SOE-CELL1
  vrf member DMZ-B2B-DC1-SOE-CELL1 
  ip address 10.255.9.165 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 38
!
interface vlan 38
  description L3_SOE_DMZ_DMZ-MAL-DC1-SOE-CELL1
  vrf member DMZ-MAL-DC1-SOE-CELL1 
  ip address 10.255.9.181 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 39
!
interface vlan 39
  description L3_SOE_DMZ_DMZ-DNS-DC1-SOE-CELL1
  vrf member DMZ-DNS-DC1-SOE-CELL1 
  ip address 10.255.9.197 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 40
!
interface vlan 40
  description L3_SOE_DMZ_DMZ-RAC-DC1-SOE-CELL1
  vrf member DMZ-RAC-DC1-SOE-CELL1 
  ip address 10.255.9.213 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 41
!
interface vlan 41
  description L3_SOE_DMZ_DMZ-PXY-DC1-SOE-CELL1
  vrf member DMZ-PXY-DC1-SOE-CELL1 
  ip address 10.255.9.229 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 48
!
interface vlan 48
  description L3_SOE_DMZ_DMZ-WEB-DC1-SOE-CELL2
  vrf member DMZ-WEB-DC1-SOE-CELL2 
  ip address 10.255.10.85 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 49
!
interface vlan 49
  description L3_SOE_DMZ_DMZ-B2B-DC1-SOE-CELL2
  vrf member DMZ-B2B-DC1-SOE-CELL2 
  ip address 10.255.10.101 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 50
!
interface vlan 50
  description L3_SOE_DMZ_DMZ-MAL-DC1-SOE-CELL2
  vrf member DMZ-MAL-DC1-SOE-CELL2 
  ip address 10.255.10.117 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 51
!
interface vlan 51
  description L3_SOE_DMZ_DMZ-DNS-DC1-SOE-CELL2
  vrf member DMZ-DNS-DC1-SOE-CELL2 
  ip address 10.255.10.133 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
!
!
router ospf DMZ
 vrf DMZ-WEB-DC1-SOE-CELL1
   router-id 10.100.101.2
   log-adjacency-changes
 vrf DMZ-WEB-DC1-SOE-CELL1
   router-id 10.100.101.2
   log-adjacency-changes
 vrf DMZ-B2B-DC1-SOE-CELL1
   router-id 10.100.101.2
   log-adjacency-changes
 vrf DMZ-B2B-DC1-SOE-CELL1
   router-id 10.100.101.2
   log-adjacency-changes
 vrf DMZ-MAL-DC1-SOE-CELL1
   router-id 10.100.101.2
   log-adjacency-changes
 vrf DMZ-MAL-DC1-SOE-CELL1
   router-id 10.100.101.2
   log-adjacency-changes
 vrf DMZ-DNS-DC1-SOE-CELL1
   router-id 10.100.101.2
   log-adjacency-changes
 vrf DMZ-DNS-DC1-SOE-CELL1
   router-id 10.100.101.2
   log-adjacency-changes
 vrf DMZ-RAC-DC1-SOE-CELL1
   router-id 10.100.101.2
   log-adjacency-changes
 vrf DMZ-RAC-DC1-SOE-CELL1
   router-id 10.100.101.2
   log-adjacency-changes
 vrf DMZ-PXY-DC1-SOE-CELL1
   router-id 10.100.101.2
   log-adjacency-changes
 vrf DMZ-PXY-DC1-SOE-CELL1
   router-id 10.100.101.2
   log-adjacency-changes
 vrf DMZ-WEB-DC1-SOE-CELL2
   router-id 10.100.101.2
   log-adjacency-changes
 vrf DMZ-WEB-DC1-SOE-CELL2
   router-id 10.100.101.2
   log-adjacency-changes
 vrf DMZ-B2B-DC1-SOE-CELL2
   router-id 10.100.101.2
   log-adjacency-changes
 vrf DMZ-B2B-DC1-SOE-CELL2
   router-id 10.100.101.2
   log-adjacency-changes
 vrf DMZ-MAL-DC1-SOE-CELL2
   router-id 10.100.101.2
   log-adjacency-changes
 vrf DMZ-MAL-DC1-SOE-CELL2
   router-id 10.100.101.2
   log-adjacency-changes
 vrf DMZ-DNS-DC1-SOE-CELL2
   router-id 10.100.101.2
   log-adjacency-changes
 vrf DMZ-DNS-DC1-SOE-CELL2
   router-id 10.100.101.2
   log-adjacency-changes
!
!
router bgp 65501
 router-id 10.100.101.2
 address-family l2vpn evpn
  maximum-paths 8
vrf AUD-ACC-DC1-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.82 remote-as 65500
 description TO_dc1dcinxc1dciouter_AUDIT-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.86 remote-as 65500
 description TO_dc1dcinxc2dciouter_AUDIT-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.90 remote-as 65500
 description TO_dc1dcinxc3dciouter_AUDIT-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.94 remote-as 65500
 description TO_dc1dcinxc4dciouter_AUDIT-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf AUD-DAT-DC1-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.82 remote-as 65500
 description TO_dc1dcinxc1dciouter_AUDIT-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.86 remote-as 65500
 description TO_dc1dcinxc2dciouter_AUDIT-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.90 remote-as 65500
 description TO_dc1dcinxc3dciouter_AUDIT-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.94 remote-as 65500
 description TO_dc1dcinxc4dciouter_AUDIT-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf RES-DST-DC1-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.114 remote-as 65500
 description TO_dc1dcinxc1dciouter_RESTRICTED-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.118 remote-as 65500
 description TO_dc1dcinxc2dciouter_RESTRICTED-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.122 remote-as 65500
 description TO_dc1dcinxc3dciouter_RESTRICTED-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.126 remote-as 65500
 description TO_dc1dcinxc4dciouter_RESTRICTED-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-WEB-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.66 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.70 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.74 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.78 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-WEB-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.66 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.70 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.74 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.78 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-B2B-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.66 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.70 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.74 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.78 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-B2B-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.66 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.70 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.74 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.78 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-MAL-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.66 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.70 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.74 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.78 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-MAL-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.66 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.70 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.74 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.78 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DNS-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.66 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.70 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.74 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.78 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DNS-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.66 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.70 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.74 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.78 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-RAC-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.146 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.150 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.154 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.158 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-RAC-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.146 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.150 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.154 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.158 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-PXY-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.162 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.166 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.170 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.174 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-PXY-DC1-SOE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.162 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.166 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.170 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.174 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-WEB-DC1-SOE-CELL2
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.178 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.182 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.186 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.190 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-WEB-DC1-SOE-CELL2
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.178 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.182 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.186 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.190 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-B2B-DC1-SOE-CELL2
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.178 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.182 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.186 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.190 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-B2B-DC1-SOE-CELL2
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.178 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.182 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.186 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.190 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-MAL-DC1-SOE-CELL2
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.178 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.182 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.186 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.190 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-MAL-DC1-SOE-CELL2
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.178 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.182 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.186 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.190 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DNS-DC1-SOE-CELL2
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.178 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.182 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.186 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.190 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DNS-DC1-SOE-CELL2
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.14.178 remote-as 65500
 description TO_dc1dcinxc1dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.182 remote-as 65500
 description TO_dc1dcinxc2dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.186 remote-as 65500
 description TO_dc1dcinxc3dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.14.190 remote-as 65500
 description TO_dc1dcinxc4dciouter_DMZ-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
!
!
!
! Allow VLANs on the firewall
!
interface E2/12
description TO_dc1soedmb1pfw2b_E1/14
switchport
switchport mode trunk
switchport trunk allow vlan 48,49,50,51
no shutdown
!
interface E2/4
description TO_dc1soedmb1pfw2a_E1/14
switchport
switchport mode trunk
switchport trunk allow vlan 48,49,50,51
no shutdown
!
interface E2/13
description TO_dc1soedma2pfw4b_E1/14
switchport
switchport mode trunk
switchport trunk allow vlan 41
no shutdown
!
interface E2/5
description TO_dc1soedma1pfw4a_E1/14
switchport
switchport mode trunk
switchport trunk allow vlan 41
no shutdown
!
interface E7706 B/02:42
description TO_dc1soedma2pfw2b_E1/14
switchport
switchport mode trunk
switchport trunk allow vlan 36,37,38,39
no shutdown
!
interface E2/3
description TO_dc1soenwa1pfw1a_E1/14
switchport
switchport mode trunk
switchport trunk allow vlan 43,44,46
no shutdown
!
interface E2/6
description TO_dc1soedma1pfw6a_E1/14
switchport
switchport mode trunk
switchport trunk allow vlan 40
no shutdown
!
interface E2/11
description TO_dc1soenwa1pfw1b_E1/14
switchport
switchport mode trunk
switchport trunk allow vlan 43,44,46
no shutdown
!
interface E2/14
description TO_dc1soedma2pfw6b_E1/14
switchport
switchport mode trunk
switchport trunk allow vlan 40
no shutdown
!
interface E7706 A/02:42
description TO_dc1soedma1pfw2a_E1/14
switchport
switchport mode trunk
switchport trunk allow vlan 36,37,38,39
no shutdown
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!! District GIS, DC dc1, nexusVDC N7K-B
!
! Create L2 VLAN
vlan 11
!
interface vlan 11
  description L3_GIS_SERVICES_SVC-COM-DC1-GIS
  vrf member SVC-COM-DC1-GIS 
  ip address 10.255.24.5 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 12
!
interface vlan 12
  description L3_GIS_SERVICES_SVC-ITC-DC1-GIS
  vrf member SVC-ITC-DC1-GIS 
  ip address 10.255.24.21 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 13
!
interface vlan 13
  description L3_GIS_SERVICES_SVC-BSC-DC1-GIS
  vrf member SVC-BSC-DC1-GIS 
  ip address 10.255.24.37 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 14
!
interface vlan 14
  description L3_GIS_SERVICES_SVC-TFR-DC1-GIS
  vrf member SVC-TFR-DC1-GIS 
  ip address 10.255.24.53 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.12
  no shutdown
!
!
router ospf SERVICES
 vrf SVC-COM-DC1-GIS
   router-id 10.100.101.8
   log-adjacency-changes
 vrf SVC-ITC-DC1-GIS
   router-id 10.100.101.8
   log-adjacency-changes
 vrf SVC-BSC-DC1-GIS
   router-id 10.100.101.8
   log-adjacency-changes
 vrf SVC-TFR-DC1-GIS
   router-id 10.100.101.8
   log-adjacency-changes
!
!
! Create L2 VLAN
vlan 27
!
interface vlan 27
  description L3_GIS_CONTROL_CTL-PA1-DC1-GIS
  vrf member CTL-PA1-DC1-GIS 
  ip address 10.255.25.5 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 28
!
interface vlan 28
  description L3_GIS_CONTROL_CTL-PA2-DC1-GIS
  vrf member CTL-PA2-DC1-GIS 
  ip address 10.255.25.21 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 29
!
interface vlan 29
  description L3_GIS_CONTROL_CTL-PTM-DC1-GIS
  vrf member CTL-PTM-DC1-GIS 
  ip address 10.255.25.37 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 30
!
interface vlan 30
  description L3_GIS_CONTROL_CTL-PTM-DMZ-DC1-GIS
  vrf member CTL-PTM-DMZ-DC1-GIS 
  ip address 10.255.25.53 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.12
  no shutdown
!
!
router ospf CONTROL
 vrf CTL-PA1-DC1-GIS
   router-id 10.100.101.8
   log-adjacency-changes
 vrf CTL-PA2-DC1-GIS
   router-id 10.100.101.8
   log-adjacency-changes
 vrf CTL-PTM-DC1-GIS
   router-id 10.100.101.8
   log-adjacency-changes
 vrf CTL-PTM-DMZ-DC1-GIS
   router-id 10.100.101.8
   log-adjacency-changes
!
!
! Create L2 VLAN
vlan 46
!
interface vlan 46
  description L3_GIS_RESTRICTED_RES-MMP-DC1-GIS
  vrf member RES-MMP-DC1-GIS 
  ip address 10.255.26.53 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf RESTRICTED area 0.0.0.12
  no shutdown
!
!
router ospf RESTRICTED
 vrf RES-MMP-DC1-GIS
   router-id 10.100.101.8
   log-adjacency-changes
!
!
router bgp 65502
 router-id 10.100.101.8
 address-family l2vpn evpn
  maximum-paths 8
vrf SVC-COM-DC1-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.30.2 remote-as 65500
 description TO_dc1dcinxc1dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.6 remote-as 65500
 description TO_dc1dcinxc2dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.10 remote-as 65500
 description TO_dc1dcinxc3dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.14 remote-as 65500
 description TO_dc1dcinxc4dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf SVC-ITC-DC1-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.30.2 remote-as 65500
 description TO_dc1dcinxc1dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.6 remote-as 65500
 description TO_dc1dcinxc2dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.10 remote-as 65500
 description TO_dc1dcinxc3dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.14 remote-as 65500
 description TO_dc1dcinxc4dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf SVC-BSC-DC1-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.30.2 remote-as 65500
 description TO_dc1dcinxc1dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.6 remote-as 65500
 description TO_dc1dcinxc2dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.10 remote-as 65500
 description TO_dc1dcinxc3dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.14 remote-as 65500
 description TO_dc1dcinxc4dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf SVC-TFR-DC1-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.30.2 remote-as 65500
 description TO_dc1dcinxc1dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.6 remote-as 65500
 description TO_dc1dcinxc2dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.10 remote-as 65500
 description TO_dc1dcinxc3dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.14 remote-as 65500
 description TO_dc1dcinxc4dciouter_SERVICES-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PA1-DC1-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.30.50 remote-as 65500
 description TO_dc1dcinxc1dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.54 remote-as 65500
 description TO_dc1dcinxc2dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.58 remote-as 65500
 description TO_dc1dcinxc3dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.62 remote-as 65500
 description TO_dc1dcinxc4dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PA2-DC1-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.30.50 remote-as 65500
 description TO_dc1dcinxc1dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.54 remote-as 65500
 description TO_dc1dcinxc2dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.58 remote-as 65500
 description TO_dc1dcinxc3dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.62 remote-as 65500
 description TO_dc1dcinxc4dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PTM-DC1-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.30.50 remote-as 65500
 description TO_dc1dcinxc1dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.54 remote-as 65500
 description TO_dc1dcinxc2dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.58 remote-as 65500
 description TO_dc1dcinxc3dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.62 remote-as 65500
 description TO_dc1dcinxc4dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PTM-DMZ-DC1-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.30.50 remote-as 65500
 description TO_dc1dcinxc1dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.54 remote-as 65500
 description TO_dc1dcinxc2dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.58 remote-as 65500
 description TO_dc1dcinxc3dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.62 remote-as 65500
 description TO_dc1dcinxc4dciouter_CONTROL-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf RES-MMP-DC1-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.30.114 remote-as 65500
 description TO_dc1dcinxc1dciouter_RESTRICTED-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.118 remote-as 65500
 description TO_dc1dcinxc2dciouter_RESTRICTED-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.122 remote-as 65500
 description TO_dc1dcinxc3dciouter_RESTRICTED-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.30.126 remote-as 65500
 description TO_dc1dcinxc4dciouter_RESTRICTED-DC1-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
!
!
!
! Allow VLANs on the firewall
!
interface E2/29
description TO_dc1gisnwa1pfw1a_E1/14
switchport
switchport mode trunk
switchport trunk allow vlan 11,12,13,14,27,28,29,30
no shutdown
!
interface E2/30
description TO_dc1gisnwa1pfw1b_E1/14
switchport
switchport mode trunk
switchport trunk allow vlan 11,12,13,14,27,28,29,30
no shutdown
!
interface E2/27
description TO_dc1gisnwa1pfw2a_E1/14
switchport
switchport mode trunk
switchport trunk allow vlan 46
no shutdown
!
interface E2/28
description TO_dc1gisnwa1pfw2b_E1/14
switchport
switchport mode trunk
switchport trunk allow vlan 46
no shutdown
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!! District SDE, DC dc2, nexusVDC N7K-E
!
! Create L2 VLAN
vlan 11
!
interface vlan 11
  description L3_SDE_SERVICES_SVC-SDE-DC2-SDE
  vrf member SVC-SDE-DC2-SDE 
  ip address 10.255.40.1 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.11
  no shutdown
! Create L2 VLAN
vlan 12
!
interface vlan 12
  description L3_SDE_SERVICES_SVC-ITC-DC2-SDE
  vrf member SVC-ITC-DC2-SDE 
  ip address 10.255.40.9 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.11
  no shutdown
! Create L2 VLAN
vlan 16
!
interface vlan 16
  description L3_SDE_SERVICES_SVC-MMD-DC2-SDE
  vrf member SVC-MMD-DC2-SDE 
  ip address 10.255.40.41 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.11
  no shutdown
!
!
router ospf SERVICES
 vrf SVC-SDE-DC2-SDE
   router-id 10.100.201.5
   log-adjacency-changes
 vrf SVC-ITC-DC2-SDE
   router-id 10.100.201.5
   log-adjacency-changes
 vrf SVC-MMD-DC2-SDE
   router-id 10.100.201.5
   log-adjacency-changes
!
!
! Create L2 VLAN
vlan 26
!
interface vlan 26
  description L3_SDE_CONTROL_CTL-DA1-DC2-SDE
  vrf member CTL-DA1-DC2-SDE 
  ip address 10.255.40.121 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.11
  no shutdown
! Create L2 VLAN
vlan 27
!
interface vlan 27
  description L3_SDE_CONTROL_CTL-DA2-DC2-SDE
  vrf member CTL-DA2-DC2-SDE 
  ip address 10.255.40.129 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.11
  no shutdown
! Create L2 VLAN
vlan 28
!
interface vlan 28
  description L3_SDE_CONTROL_CTL-PTD-DC2-SDE
  vrf member CTL-PTD-DC2-SDE 
  ip address 10.255.40.137 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.11
  no shutdown
! Create L2 VLAN
vlan 29
!
interface vlan 29
  description L3_SDE_CONTROL_CTL-PTD-DMZ-DC2-SDE
  vrf member CTL-PTD-DMZ-DC2-SDE 
  ip address 10.255.40.145 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.11
  no shutdown
!
!
router ospf CONTROL
 vrf CTL-DA1-DC2-SDE
   router-id 10.100.201.5
   log-adjacency-changes
 vrf CTL-DA2-DC2-SDE
   router-id 10.100.201.5
   log-adjacency-changes
 vrf CTL-PTD-DC2-SDE
   router-id 10.100.201.5
   log-adjacency-changes
 vrf CTL-PTD-DMZ-DC2-SDE
   router-id 10.100.201.5
   log-adjacency-changes
!
!
! Create L2 VLAN
vlan 34
!
interface vlan 34
  description L3_SDE_DMZ_DMZ-DVT-DC2-SDE-CELL1
  vrf member DMZ-DVT-DC2-SDE-CELL1 
  ip address 10.255.40.185 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.11
  no shutdown
!
!
router ospf DMZ
 vrf DMZ-DVT-DC2-SDE-CELL1
   router-id 10.100.201.5
   log-adjacency-changes
 vrf DMZ-DVT-DC2-SDE-CELL1
   router-id 10.100.201.5
   log-adjacency-changes
!
!
router bgp 65516
 router-id 10.100.201.5
 address-family l2vpn evpn
  maximum-paths 8
vrf SVC-SDE-DC2-SDE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.46.2 remote-as 65515
 description TO_dc2sdenxc1sdeouter_SERVICES-DC2-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.46.6 remote-as 65515
 description TO_dc2sdenxc2sdeouter_SERVICES-DC2-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf SVC-ITC-DC2-SDE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.46.2 remote-as 65515
 description TO_dc2sdenxc1sdeouter_SERVICES-DC2-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.46.6 remote-as 65515
 description TO_dc2sdenxc2sdeouter_SERVICES-DC2-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf SVC-MMD-DC2-SDE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.46.58 remote-as 65515
 description TO_dc2sdenxc1sdeouter_SERVICES-DC2-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.46.62 remote-as 65515
 description TO_dc2sdenxc2sdeouter_SERVICES-DC2-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-DA1-DC2-SDE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.46.26 remote-as 65515
 description TO_dc2sdenxc1sdeouter_CONTROL-DC2-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.46.30 remote-as 65515
 description TO_dc2sdenxc2sdeouter_CONTROL-DC2-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-DA2-DC2-SDE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.46.26 remote-as 65515
 description TO_dc2sdenxc1sdeouter_CONTROL-DC2-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.46.30 remote-as 65515
 description TO_dc2sdenxc2sdeouter_CONTROL-DC2-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PTD-DC2-SDE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.46.26 remote-as 65515
 description TO_dc2sdenxc1sdeouter_CONTROL-DC2-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.46.30 remote-as 65515
 description TO_dc2sdenxc2sdeouter_CONTROL-DC2-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PTD-DMZ-DC2-SDE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.46.26 remote-as 65515
 description TO_dc2sdenxc1sdeouter_CONTROL-DC2-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.46.30 remote-as 65515
 description TO_dc2sdenxc2sdeouter_CONTROL-DC2-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DVT-DC2-SDE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.46.34 remote-as 65515
 description TO_dc2sdenxc1sdeouter_DMZ-DC2-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.46.38 remote-as 65515
 description TO_dc2sdenxc2sdeouter_DMZ-DC2-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DVT-DC2-SDE-CELL1
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.46.34 remote-as 65515
 description TO_dc2sdenxc1sdeouter_DMZ-DC2-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.46.38 remote-as 65515
 description TO_dc2sdenxc2sdeouter_DMZ-DC2-SDE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
!
!
!
! Allow VLANs on the firewall
!
interface E2/3
description TO_dc2sdedma1pfw2a_E1/13
switchport
switchport mode trunk
switchport trunk allow vlan 34
no shutdown
!
interface E2/11
description TO_dc2sdedma1pfw2b_E1/13
switchport
switchport mode trunk
switchport trunk allow vlan 34
no shutdown
!
interface E2/5
description TO_dc2sdenwa1pfw1a_E1/13
switchport
switchport mode trunk
switchport trunk allow vlan 11,12,26,27,28,29
no shutdown
!
interface E2/13
description TO_dc2sdenwa1pfw1b_E1/13
switchport
switchport mode trunk
switchport trunk allow vlan 11,12,26,27,28,29
no shutdown
!
interface E2/4
description TO_dc2sdenwa1pfw2a_E1
switchport
switchport mode trunk
switchport trunk allow vlan 16
no shutdown
!
interface E2/12
description TO_dc2sdenwa1pfw2b_E1
switchport
switchport mode trunk
switchport trunk allow vlan 16
no shutdown
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!! District GIS, DC dc2, nexusVDC N7K-C
!
! Create L2 VLAN
vlan 11
!
interface vlan 11
  description L3_GIS_SERVICES_SVC-COM-DC2-GIS
  vrf member SVC-COM-DC2-GIS 
  ip address 10.255.48.9 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 12
!
interface vlan 12
  description L3_GIS_SERVICES_SVC-ITC-DC2-GIS
  vrf member SVC-ITC-DC2-GIS 
  ip address 10.255.48.25 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 13
!
interface vlan 13
  description L3_GIS_SERVICES_SVC-BSC-DC2-GIS
  vrf member SVC-BSC-DC2-GIS 
  ip address 10.255.48.41 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 14
!
interface vlan 14
  description L3_GIS_SERVICES_SVC-TFR-DC2-GIS
  vrf member SVC-TFR-DC2-GIS 
  ip address 10.255.48.57 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.12
  no shutdown
!
!
router ospf SERVICES
 vrf SVC-COM-DC2-GIS
   router-id 10.100.201.9
   log-adjacency-changes
 vrf SVC-ITC-DC2-GIS
   router-id 10.100.201.9
   log-adjacency-changes
 vrf SVC-BSC-DC2-GIS
   router-id 10.100.201.9
   log-adjacency-changes
 vrf SVC-TFR-DC2-GIS
   router-id 10.100.201.9
   log-adjacency-changes
!
!
! Create L2 VLAN
vlan 27
!
interface vlan 27
  description L3_GIS_CONTROL_CTL-PA1-DC2-GIS
  vrf member CTL-PA1-DC2-GIS 
  ip address 10.255.49.9 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 28
!
interface vlan 28
  description L3_GIS_CONTROL_CTL-PA2-DC2-GIS
  vrf member CTL-PA2-DC2-GIS 
  ip address 10.255.49.25 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 29
!
interface vlan 29
  description L3_GIS_CONTROL_CTL-PTM-DC2-GIS
  vrf member CTL-PTM-DC2-GIS 
  ip address 10.255.49.41 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 30
!
interface vlan 30
  description L3_GIS_CONTROL_CTL-PTM-DMZ-DC2-GIS
  vrf member CTL-PTM-DMZ-DC2-GIS 
  ip address 10.255.49.57 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.12
  no shutdown
!
!
router ospf CONTROL
 vrf CTL-PA1-DC2-GIS
   router-id 10.100.201.9
   log-adjacency-changes
 vrf CTL-PA2-DC2-GIS
   router-id 10.100.201.9
   log-adjacency-changes
 vrf CTL-PTM-DC2-GIS
   router-id 10.100.201.9
   log-adjacency-changes
 vrf CTL-PTM-DMZ-DC2-GIS
   router-id 10.100.201.9
   log-adjacency-changes
!
!
! Create L2 VLAN
vlan 46
!
interface vlan 46
  description L3_GIS_RESTRICTED_RES-MMP-DC2-GIS
  vrf member RES-MMP-DC2-GIS 
  ip address 10.255.50.57 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf RESTRICTED area 0.0.0.12
  no shutdown
!
!
router ospf RESTRICTED
 vrf RES-MMP-DC2-GIS
   router-id 10.100.201.9
   log-adjacency-changes
!
!
router bgp 65512
 router-id 10.100.201.9
 address-family l2vpn evpn
  maximum-paths 8
vrf SVC-COM-DC2-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.54.2 remote-as 65510
 description TO_dc2dcinxc1dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.6 remote-as 65510
 description TO_dc2dcinxc2dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.10 remote-as 65510
 description TO_dc2dcinxc3dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.14 remote-as 65510
 description TO_dc2dcinxc4dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf SVC-ITC-DC2-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.54.2 remote-as 65510
 description TO_dc2dcinxc1dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.6 remote-as 65510
 description TO_dc2dcinxc2dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.10 remote-as 65510
 description TO_dc2dcinxc3dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.14 remote-as 65510
 description TO_dc2dcinxc4dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf SVC-BSC-DC2-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.54.2 remote-as 65510
 description TO_dc2dcinxc1dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.6 remote-as 65510
 description TO_dc2dcinxc2dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.10 remote-as 65510
 description TO_dc2dcinxc3dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.14 remote-as 65510
 description TO_dc2dcinxc4dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf SVC-TFR-DC2-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.54.2 remote-as 65510
 description TO_dc2dcinxc1dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.6 remote-as 65510
 description TO_dc2dcinxc2dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.10 remote-as 65510
 description TO_dc2dcinxc3dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.14 remote-as 65510
 description TO_dc2dcinxc4dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PA1-DC2-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.54.50 remote-as 65510
 description TO_dc2dcinxc1dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.54 remote-as 65510
 description TO_dc2dcinxc2dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.58 remote-as 65510
 description TO_dc2dcinxc3dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.62 remote-as 65510
 description TO_dc2dcinxc4dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PA2-DC2-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.54.50 remote-as 65510
 description TO_dc2dcinxc1dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.54 remote-as 65510
 description TO_dc2dcinxc2dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.58 remote-as 65510
 description TO_dc2dcinxc3dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.62 remote-as 65510
 description TO_dc2dcinxc4dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PTM-DC2-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.54.50 remote-as 65510
 description TO_dc2dcinxc1dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.54 remote-as 65510
 description TO_dc2dcinxc2dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.58 remote-as 65510
 description TO_dc2dcinxc3dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.62 remote-as 65510
 description TO_dc2dcinxc4dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PTM-DMZ-DC2-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.54.50 remote-as 65510
 description TO_dc2dcinxc1dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.54 remote-as 65510
 description TO_dc2dcinxc2dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.58 remote-as 65510
 description TO_dc2dcinxc3dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.62 remote-as 65510
 description TO_dc2dcinxc4dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf RES-MMP-DC2-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.54.114 remote-as 65510
 description TO_dc2dcinxc1dciouter_RESTRICTED-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.118 remote-as 65510
 description TO_dc2dcinxc2dciouter_RESTRICTED-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.122 remote-as 65510
 description TO_dc2dcinxc3dciouter_RESTRICTED-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.126 remote-as 65510
 description TO_dc2dcinxc4dciouter_RESTRICTED-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
!
!
!
! Allow VLANs on the firewall
!
interface E2/30
description TO_dc2gisnwa1pfw1b_E1/15
switchport
switchport mode trunk
switchport trunk allow vlan 11,12,13,14,27,28,29,30
no shutdown
!
interface E2/28
description TO_dc2gisnwa1pfw2b_E1/15
switchport
switchport mode trunk
switchport trunk allow vlan 46
no shutdown
!
interface E2/27
description TO_dc2gisnwa1pfw2a_E1/15
switchport
switchport mode trunk
switchport trunk allow vlan 46
no shutdown
!
interface E2/29
description TO_dc2gisnwa1pfw1a_E1/15
switchport
switchport mode trunk
switchport trunk allow vlan 11,12,13,14,27,28,29,30
no shutdown
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!! District SOE, DC dc2, nexusVDC N7K-A
!
!
!
! Create L2 VLAN
vlan 43
!
interface vlan 43
  description L3_SOE_AUDIT_AUD-ACC-DC2-SOE
  vrf member AUD-ACC-DC2-SOE 
  ip address 10.255.34.1 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf AUDIT area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 44
!
interface vlan 44
  description L3_SOE_AUDIT_AUD-DAT-DC2-SOE
  vrf member AUD-DAT-DC2-SOE 
  ip address 10.255.34.17 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf AUDIT area 0.0.0.10
  no shutdown
!
!
router ospf AUDIT
 vrf AUD-ACC-DC2-SOE
   router-id 10.100.201.1
   log-adjacency-changes
 vrf AUD-DAT-DC2-SOE
   router-id 10.100.201.1
   log-adjacency-changes
!
!
! Create L2 VLAN
vlan 46
!
interface vlan 46
  description L3_SOE_RESTRICTED_RES-DST-DC2-SOE
  vrf member RES-DST-DC2-SOE 
  ip address 10.255.34.49 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf RESTRICTED area 0.0.0.10
  no shutdown
!
!
router ospf RESTRICTED
 vrf RES-DST-DC2-SOE
   router-id 10.100.201.1
   log-adjacency-changes
!
!
!
! Create L2 VLAN
vlan 36
!
interface vlan 36
  description L3_SOE_DMZ_DMZ-WEB-DC2-SOE-CELL3
  vrf member DMZ-WEB-DC2-SOE-CELL3 
  ip address 10.255.33.145 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 37
!
interface vlan 37
  description L3_SOE_DMZ_DMZ-B2B-DC2-SOE-CELL3
  vrf member DMZ-B2B-DC2-SOE-CELL3 
  ip address 10.255.33.161 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 38
!
interface vlan 38
  description L3_SOE_DMZ_DMZ-MAL-DC2-SOE-CELL3
  vrf member DMZ-MAL-DC2-SOE-CELL3 
  ip address 10.255.33.177 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 39
!
interface vlan 39
  description L3_SOE_DMZ_DMZ-DNS-DC2-SOE-CELL3
  vrf member DMZ-DNS-DC2-SOE-CELL3 
  ip address 10.255.33.193 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 40
!
interface vlan 40
  description L3_SOE_DMZ_DMZ-RAC-DC2-SOE-CELL3
  vrf member DMZ-RAC-DC2-SOE-CELL3 
  ip address 10.255.33.209 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 41
!
interface vlan 41
  description L3_SOE_DMZ_DMZ-PXY-DC2-SOE-CELL3
  vrf member DMZ-PXY-DC2-SOE-CELL3 
  ip address 10.255.33.225 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 48
!
interface vlan 48
  description L3_SOE_DMZ_DMZ-WEB-DC2-SOE-CELL4
  vrf member DMZ-WEB-DC2-SOE-CELL4 
  ip address 10.255.34.81 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 49
!
interface vlan 49
  description L3_SOE_DMZ_DMZ-B2B-DC2-SOE-CELL4
  vrf member DMZ-B2B-DC2-SOE-CELL4 
  ip address 10.255.34.97 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 50
!
interface vlan 50
  description L3_SOE_DMZ_DMZ-MAL-DC2-SOE-CELL4
  vrf member DMZ-MAL-DC2-SOE-CELL4 
  ip address 10.255.34.113 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 51
!
interface vlan 51
  description L3_SOE_DMZ_DMZ-DNS-DC2-SOE-CELL4
  vrf member DMZ-DNS-DC2-SOE-CELL4 
  ip address 10.255.34.129 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
!
!
router ospf DMZ
 vrf DMZ-WEB-DC2-SOE-CELL3
   router-id 10.100.201.1
   log-adjacency-changes
 vrf DMZ-WEB-DC2-SOE-CELL3
   router-id 10.100.201.1
   log-adjacency-changes
 vrf DMZ-B2B-DC2-SOE-CELL3
   router-id 10.100.201.1
   log-adjacency-changes
 vrf DMZ-B2B-DC2-SOE-CELL3
   router-id 10.100.201.1
   log-adjacency-changes
 vrf DMZ-MAL-DC2-SOE-CELL3
   router-id 10.100.201.1
   log-adjacency-changes
 vrf DMZ-MAL-DC2-SOE-CELL3
   router-id 10.100.201.1
   log-adjacency-changes
 vrf DMZ-DNS-DC2-SOE-CELL3
   router-id 10.100.201.1
   log-adjacency-changes
 vrf DMZ-DNS-DC2-SOE-CELL3
   router-id 10.100.201.1
   log-adjacency-changes
 vrf DMZ-RAC-DC2-SOE-CELL3
   router-id 10.100.201.1
   log-adjacency-changes
 vrf DMZ-RAC-DC2-SOE-CELL3
   router-id 10.100.201.1
   log-adjacency-changes
 vrf DMZ-PXY-DC2-SOE-CELL3
   router-id 10.100.201.1
   log-adjacency-changes
 vrf DMZ-PXY-DC2-SOE-CELL3
   router-id 10.100.201.1
   log-adjacency-changes
 vrf DMZ-WEB-DC2-SOE-CELL4
   router-id 10.100.201.1
   log-adjacency-changes
 vrf DMZ-WEB-DC2-SOE-CELL4
   router-id 10.100.201.1
   log-adjacency-changes
 vrf DMZ-B2B-DC2-SOE-CELL4
   router-id 10.100.201.1
   log-adjacency-changes
 vrf DMZ-B2B-DC2-SOE-CELL4
   router-id 10.100.201.1
   log-adjacency-changes
 vrf DMZ-MAL-DC2-SOE-CELL4
   router-id 10.100.201.1
   log-adjacency-changes
 vrf DMZ-MAL-DC2-SOE-CELL4
   router-id 10.100.201.1
   log-adjacency-changes
 vrf DMZ-DNS-DC2-SOE-CELL4
   router-id 10.100.201.1
   log-adjacency-changes
 vrf DMZ-DNS-DC2-SOE-CELL4
   router-id 10.100.201.1
   log-adjacency-changes
!
!
router bgp 65511
 router-id 10.100.201.1
 address-family l2vpn evpn
  maximum-paths 8
vrf AUD-ACC-DC2-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.82 remote-as 65510
 description TO_dc2dcinxc1dciouter_AUDIT-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.86 remote-as 65510
 description TO_dc2dcinxc2dciouter_AUDIT-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.90 remote-as 65510
 description TO_dc2dcinxc3dciouter_AUDIT-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.94 remote-as 65510
 description TO_dc2dcinxc4dciouter_AUDIT-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf AUD-DAT-DC2-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.82 remote-as 65510
 description TO_dc2dcinxc1dciouter_AUDIT-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.86 remote-as 65510
 description TO_dc2dcinxc2dciouter_AUDIT-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.90 remote-as 65510
 description TO_dc2dcinxc3dciouter_AUDIT-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.94 remote-as 65510
 description TO_dc2dcinxc4dciouter_AUDIT-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf RES-DST-DC2-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.114 remote-as 65510
 description TO_dc2dcinxc1dciouter_RESTRICTED-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.118 remote-as 65510
 description TO_dc2dcinxc2dciouter_RESTRICTED-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.122 remote-as 65510
 description TO_dc2dcinxc3dciouter_RESTRICTED-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.126 remote-as 65510
 description TO_dc2dcinxc4dciouter_RESTRICTED-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-WEB-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.70 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.74 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.78 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-WEB-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.70 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.74 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.78 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-B2B-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.70 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.74 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.78 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-B2B-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.70 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.74 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.78 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-MAL-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.70 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.74 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.78 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-MAL-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.70 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.74 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.78 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DNS-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.70 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.74 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.78 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DNS-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.70 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.74 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.78 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-RAC-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.146 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.150 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.154 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.158 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-RAC-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.146 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.150 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.154 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.158 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-PXY-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.162 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.166 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.170 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.174 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-PXY-DC2-SOE-CELL3
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.162 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.166 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.170 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.174 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-WEB-DC2-SOE-CELL4
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.178 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.182 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.186 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.190 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-WEB-DC2-SOE-CELL4
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.178 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.182 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.186 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.190 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-B2B-DC2-SOE-CELL4
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.178 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.182 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.186 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.190 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-B2B-DC2-SOE-CELL4
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.178 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.182 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.186 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.190 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-MAL-DC2-SOE-CELL4
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.178 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.182 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.186 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.190 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-MAL-DC2-SOE-CELL4
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.178 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.182 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.186 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.190 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DNS-DC2-SOE-CELL4
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.178 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.182 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.186 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.190 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DNS-DC2-SOE-CELL4
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.178 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.182 remote-as 65510
 description TO_dc2dcinxc2dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.186 remote-as 65510
 description TO_dc2dcinxc3dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.38.190 remote-as 65510
 description TO_dc2dcinxc4dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
!
!
!
! Allow VLANs on the firewall
!
interface E2/14
description TO_dc2soedma2pfw6b_E1/13
switchport
switchport mode trunk
switchport trunk allow vlan 40
no shutdown
!
interface E2/11
description TO_dc2soenwa1pfw1b_E1/13
switchport
switchport mode trunk
switchport trunk allow vlan 43,44,46
no shutdown
!
interface E2/13
description TO_dc2soedma2pfw4b_E1/13
switchport
switchport mode trunk
switchport trunk allow vlan 41
no shutdown
!
interface E7706 B/02:41
description TO_dc2soedma2pfw2b_E1/13
switchport
switchport mode trunk
switchport trunk allow vlan 36,37,38,39
no shutdown
!
interface E2/3
description TO_dc2soenwa1pfw1a_E1/13
switchport
switchport mode trunk
switchport trunk allow vlan 43,44,46
no shutdown
!
interface E7706 A/02:41
description TO_dc2soedma1pfw2a_E1/13
switchport
switchport mode trunk
switchport trunk allow vlan 36,37,38,39
no shutdown
!
interface E2/5
description TO_dc2soedma1pfw4a_E1/13
switchport
switchport mode trunk
switchport trunk allow vlan 41
no shutdown
!
interface E2/4
description TO_dc2soedmb1pfw2a_E1/13
switchport
switchport mode trunk
switchport trunk allow vlan 48,49,50,51
no shutdown
!
interface E2/12
description TO_dc2soedmb1pfw2b_E1/13
switchport
switchport mode trunk
switchport trunk allow vlan 48,49,50,51
no shutdown
!
interface E2/6
description TO_dc2soedma1pfw6a_E1/13
switchport
switchport mode trunk
switchport trunk allow vlan 40
no shutdown
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!! District GIS, DC dc2, nexusVDC N7K-A
!
! Create L2 VLAN
vlan 11
!
interface vlan 11
  description L3_GIS_SERVICES_SVC-COM-DC2-GIS
  vrf member SVC-COM-DC2-GIS 
  ip address 10.255.48.1 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 12
!
interface vlan 12
  description L3_GIS_SERVICES_SVC-ITC-DC2-GIS
  vrf member SVC-ITC-DC2-GIS 
  ip address 10.255.48.17 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 13
!
interface vlan 13
  description L3_GIS_SERVICES_SVC-BSC-DC2-GIS
  vrf member SVC-BSC-DC2-GIS 
  ip address 10.255.48.33 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 14
!
interface vlan 14
  description L3_GIS_SERVICES_SVC-TFR-DC2-GIS
  vrf member SVC-TFR-DC2-GIS 
  ip address 10.255.48.49 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.12
  no shutdown
!
!
router ospf SERVICES
 vrf SVC-COM-DC2-GIS
   router-id 10.100.201.7
   log-adjacency-changes
 vrf SVC-ITC-DC2-GIS
   router-id 10.100.201.7
   log-adjacency-changes
 vrf SVC-BSC-DC2-GIS
   router-id 10.100.201.7
   log-adjacency-changes
 vrf SVC-TFR-DC2-GIS
   router-id 10.100.201.7
   log-adjacency-changes
!
!
! Create L2 VLAN
vlan 27
!
interface vlan 27
  description L3_GIS_CONTROL_CTL-PA1-DC2-GIS
  vrf member CTL-PA1-DC2-GIS 
  ip address 10.255.49.1 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 28
!
interface vlan 28
  description L3_GIS_CONTROL_CTL-PA2-DC2-GIS
  vrf member CTL-PA2-DC2-GIS 
  ip address 10.255.49.17 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 29
!
interface vlan 29
  description L3_GIS_CONTROL_CTL-PTM-DC2-GIS
  vrf member CTL-PTM-DC2-GIS 
  ip address 10.255.49.33 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.12
  no shutdown
! Create L2 VLAN
vlan 30
!
interface vlan 30
  description L3_GIS_CONTROL_CTL-PTM-DMZ-DC2-GIS
  vrf member CTL-PTM-DMZ-DC2-GIS 
  ip address 10.255.49.49 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.12
  no shutdown
!
!
router ospf CONTROL
 vrf CTL-PA1-DC2-GIS
   router-id 10.100.201.7
   log-adjacency-changes
 vrf CTL-PA2-DC2-GIS
   router-id 10.100.201.7
   log-adjacency-changes
 vrf CTL-PTM-DC2-GIS
   router-id 10.100.201.7
   log-adjacency-changes
 vrf CTL-PTM-DMZ-DC2-GIS
   router-id 10.100.201.7
   log-adjacency-changes
!
!
! Create L2 VLAN
vlan 46
!
interface vlan 46
  description L3_GIS_RESTRICTED_RES-MMP-DC2-GIS
  vrf member RES-MMP-DC2-GIS 
  ip address 10.255.50.49 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf RESTRICTED area 0.0.0.12
  no shutdown
!
!
router ospf RESTRICTED
 vrf RES-MMP-DC2-GIS
   router-id 10.100.201.7
   log-adjacency-changes
!
!
router bgp 65512
 router-id 10.100.201.7
 address-family l2vpn evpn
  maximum-paths 8
vrf SVC-COM-DC2-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.54.2 remote-as 65510
 description TO_dc2dcinxc1dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.6 remote-as 65510
 description TO_dc2dcinxc2dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.10 remote-as 65510
 description TO_dc2dcinxc3dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.14 remote-as 65510
 description TO_dc2dcinxc4dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf SVC-ITC-DC2-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.54.2 remote-as 65510
 description TO_dc2dcinxc1dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.6 remote-as 65510
 description TO_dc2dcinxc2dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.10 remote-as 65510
 description TO_dc2dcinxc3dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.14 remote-as 65510
 description TO_dc2dcinxc4dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf SVC-BSC-DC2-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.54.2 remote-as 65510
 description TO_dc2dcinxc1dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.6 remote-as 65510
 description TO_dc2dcinxc2dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.10 remote-as 65510
 description TO_dc2dcinxc3dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.14 remote-as 65510
 description TO_dc2dcinxc4dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf SVC-TFR-DC2-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.54.2 remote-as 65510
 description TO_dc2dcinxc1dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.6 remote-as 65510
 description TO_dc2dcinxc2dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.10 remote-as 65510
 description TO_dc2dcinxc3dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.14 remote-as 65510
 description TO_dc2dcinxc4dciouter_SERVICES-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PA1-DC2-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.54.50 remote-as 65510
 description TO_dc2dcinxc1dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.54 remote-as 65510
 description TO_dc2dcinxc2dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.58 remote-as 65510
 description TO_dc2dcinxc3dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.62 remote-as 65510
 description TO_dc2dcinxc4dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PA2-DC2-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.54.50 remote-as 65510
 description TO_dc2dcinxc1dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.54 remote-as 65510
 description TO_dc2dcinxc2dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.58 remote-as 65510
 description TO_dc2dcinxc3dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.62 remote-as 65510
 description TO_dc2dcinxc4dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PTM-DC2-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.54.50 remote-as 65510
 description TO_dc2dcinxc1dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.54 remote-as 65510
 description TO_dc2dcinxc2dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.58 remote-as 65510
 description TO_dc2dcinxc3dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.62 remote-as 65510
 description TO_dc2dcinxc4dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PTM-DMZ-DC2-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.54.50 remote-as 65510
 description TO_dc2dcinxc1dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.54 remote-as 65510
 description TO_dc2dcinxc2dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.58 remote-as 65510
 description TO_dc2dcinxc3dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.62 remote-as 65510
 description TO_dc2dcinxc4dciouter_CONTROL-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf RES-MMP-DC2-GIS
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.54.114 remote-as 65510
 description TO_dc2dcinxc1dciouter_RESTRICTED-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.118 remote-as 65510
 description TO_dc2dcinxc2dciouter_RESTRICTED-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.122 remote-as 65510
 description TO_dc2dcinxc3dciouter_RESTRICTED-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.54.126 remote-as 65510
 description TO_dc2dcinxc4dciouter_RESTRICTED-DC2-GIS
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
!
!
!
! Allow VLANs on the firewall
!
interface E2/30
description TO_dc2gisnwa1pfw1b_E1/13
switchport
switchport mode trunk
switchport trunk allow vlan 11,12,13,14,27,28,29,30
no shutdown
!
interface E2/28
description TO_dc2gisnwa1pfw2b_E1/13
switchport
switchport mode trunk
switchport trunk allow vlan 46
no shutdown
!
interface E2/27
description TO_dc2gisnwa1pfw2a_E1/13
switchport
switchport mode trunk
switchport trunk allow vlan 46
no shutdown
!
interface E2/29
description TO_dc2gisnwa1pfw1a_E1/13
switchport
switchport mode trunk
switchport trunk allow vlan 11,12,13,14,27,28,29,30
no shutdown
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

