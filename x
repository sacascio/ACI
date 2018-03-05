!!! District SOE, DC dc1, nexusVDC N7K-A -- Outer Config
!
!! If prefix-list and route-map commands are already configured on the N7K, they will not be executed
ip prefix-list DEFAULT_ROUTE seq 5 permit 0.0.0.0/0
!
route-map PERMIT_DEFAULT_ONLY permit 10
   match ip address prefix-list DEFAULT_ROUTE
route-map PERMIT_DEFAULT_ONLY deny 20
!
! Create L2 VLAN
vlan 106
!
interface vlan 106
  description L3_SOE_AUDIT
  ip address 10.255.14.82 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SOE area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 105
!
interface vlan 105
  description L3_SOE_DMZ
  ip address 10.255.14.66 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SOE area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 110
!
interface vlan 110
  description L3_SOE_DMZ
  ip address 10.255.14.146 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SOE area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 111
!
interface vlan 111
  description L3_SOE_DMZ
  ip address 10.255.14.162 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SOE area 0.0.0.10
  no shutdown
! Create L2 VLAN
vlan 112
!
interface vlan 112
  description L3_SOE_DMZ
  ip address 10.255.14.178 255.255.255.252
  mtu 9192
  ip ospf network point-to-point
  ip router ospf SOE area 0.0.0.10
  no shutdown
!
!
interface loopback0
   ip address 10.100.101.41 255.255.255.255
router ospf SOE
   router-id 10.100.101.41
!
!
!
router bgp 65500
 router-id 10.100.101.41
 log-neighbor-changes
 address-family ipv4 unicast
    maximum-paths 8
 neighbor 10.255.10.1 remote-as 65501
 description TO_dc1dcinxc1soeinner_AUD-ACC-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.5 remote-as 65501
 description TO_dc1dcinxc2soeinner_AUD-ACC-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.9 remote-as 65501
 description TO_dc1dcinxc3soeinner_AUD-ACC-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.13 remote-as 65501
 description TO_dc1dcinxc4soeinner_AUD-ACC-DC1-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.161 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-B2B-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.161 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-B2B-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.165 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-B2B-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.165 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-B2B-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.169 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-B2B-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.169 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-B2B-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.173 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-B2B-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.173 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-B2B-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.113 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-MAL-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.113 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-MAL-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.117 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-MAL-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.117 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-MAL-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.121 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-MAL-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.121 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-MAL-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.125 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-MAL-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.125 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-MAL-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.97 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-B2B-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.97 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-B2B-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.101 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-B2B-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.101 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-B2B-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.105 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-B2B-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.105 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-B2B-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.109 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-B2B-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.109 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-B2B-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.177 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-MAL-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.177 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-MAL-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.181 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-MAL-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.181 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-MAL-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.185 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-MAL-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.185 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-MAL-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.189 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-MAL-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.189 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-MAL-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.193 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-DNS-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.193 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-DNS-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.197 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-DNS-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.197 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-DNS-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.201 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-DNS-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.201 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-DNS-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.205 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-DNS-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.205 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-DNS-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.225 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-PXY-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.225 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-PXY-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.229 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-PXY-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.229 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-PXY-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.233 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-PXY-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.233 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-PXY-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.237 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-PXY-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.237 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-PXY-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.209 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-RAC-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.209 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-RAC-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.213 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-RAC-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.213 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-RAC-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.217 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-RAC-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.217 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-RAC-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.221 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-RAC-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.221 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-RAC-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.81 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-WEB-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.81 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-WEB-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.85 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-WEB-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.85 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-WEB-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.89 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-WEB-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.89 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-WEB-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.93 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-WEB-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.93 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-WEB-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.145 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-WEB-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.145 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-WEB-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.149 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-WEB-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.149 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-WEB-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.153 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-WEB-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.153 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-WEB-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.157 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-WEB-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.157 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-WEB-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.97 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-B2B-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.97 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-B2B-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.101 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-B2B-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.101 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-B2B-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.105 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-B2B-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.105 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-B2B-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.109 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-B2B-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.109 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-B2B-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.161 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-B2B-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.161 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-B2B-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.165 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-B2B-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.165 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-B2B-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.169 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-B2B-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.169 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-B2B-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.173 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-B2B-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.173 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-B2B-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.81 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-WEB-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.81 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-WEB-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.85 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-WEB-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.85 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-WEB-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.89 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-WEB-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.89 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-WEB-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.93 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-WEB-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.93 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-WEB-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.145 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-WEB-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.145 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-WEB-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.149 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-WEB-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.149 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-WEB-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.153 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-WEB-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.153 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-WEB-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.157 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-WEB-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.157 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-WEB-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.225 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-PXY-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.225 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-PXY-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.229 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-PXY-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.229 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-PXY-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.233 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-PXY-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.233 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-PXY-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.237 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-PXY-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.237 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-PXY-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.113 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-MAL-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.113 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-MAL-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.117 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-MAL-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.117 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-MAL-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.121 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-MAL-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.121 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-MAL-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.125 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-MAL-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.125 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-MAL-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.209 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-RAC-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.209 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-RAC-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.213 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-RAC-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.213 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-RAC-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.217 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-RAC-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.217 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-RAC-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.221 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-RAC-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.221 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-RAC-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.177 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-MAL-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.177 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-MAL-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.181 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-MAL-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.181 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-MAL-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.185 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-MAL-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.185 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-MAL-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.189 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-MAL-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.189 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-MAL-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.129 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-DNS-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.129 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-DNS-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.133 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-DNS-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.133 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-DNS-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.137 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-DNS-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.137 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-DNS-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.141 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-DNS-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.141 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-DNS-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.193 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-DNS-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.193 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-DNS-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.197 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-DNS-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.197 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-DNS-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.201 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-DNS-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.201 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-DNS-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.205 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-DNS-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.9.205 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-DNS-DC1-SOE-CELL1
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.129 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-DNS-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.129 remote-as 65501
 description TO_dc1dcinxc1soeinner_DMZ-DNS-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.133 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-DNS-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.133 remote-as 65501
 description TO_dc1dcinxc2soeinner_DMZ-DNS-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.137 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-DNS-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.137 remote-as 65501
 description TO_dc1dcinxc3soeinner_DMZ-DNS-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.141 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-DNS-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
 neighbor 10.255.10.141 remote-as 65501
 description TO_dc1dcinxc4soeinner_DMZ-DNS-DC1-SOE-CELL2
    ebgp-multihop 4
    address-family ipv4 unicast
       send-community both
       route-map PERMIT_DEFAULT_ONLY out
       default-originate
!
!
router bgp 65500
 neighbor 10.255.15.6 remote-as 64710
 description TO dc1mx480-pe2_XE-0/0/6
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.15.10 remote-as 64710
 description TO dc1mx480-pe3_XE-0/0/6
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.15.2 remote-as 64710
 description TO dc1mx480-pe1_XE-0/0/6
    address-family ipv4 unicast
      send-community both
 neighbor 10.255.15.14 remote-as 64710
 description TO dc1mx480-pe4_XE-0/0/6
    address-family ipv4 unicast
      send-community both
!
!
! Allow VLANs on the firewall
!
interface E5/12
description TO_dc1soedmb1pfw2b_E2/5
switchport
switchport mode trunk
switchport trunk allow vlan 112
no shutdown
!
interface E5/4
description TO_dc1soedmb1pfw2a_E2/5
switchport
switchport mode trunk
switchport trunk allow vlan 112
no shutdown
!
interface E5/19
description TO_dc1soedma2pfw4b_E2/5
switchport
switchport mode trunk
switchport trunk allow vlan 111
no shutdown
!
interface E5/15
description TO_dc1soedma1pfw4a_E2/5
switchport
switchport mode trunk
switchport trunk allow vlan 111
no shutdown
!
interface E5/11
description TO_dc1soedma2pfw2b_E2/5
switchport
switchport mode trunk
switchport trunk allow vlan 105
no shutdown
!
interface E5/5
description TO_dc1soenwa1pfw1a_E2/5
switchport
switchport mode trunk
switchport trunk allow vlan 106
no shutdown
!
interface E5/16
description TO_dc1soedma1pfw6a_E2/5
switchport
switchport mode trunk
switchport trunk allow vlan 110
no shutdown
!
interface E5/13
description TO_dc1soenwa1pfw1b_E2/5
switchport
switchport mode trunk
switchport trunk allow vlan 106
no shutdown
!
interface E5/20
description TO_dc1soedma2pfw6b_E2/5
switchport
switchport mode trunk
switchport trunk allow vlan 110
no shutdown
!
interface E5/3
description TO_dc1soedma1pfw2a_E2/5
switchport
switchport mode trunk
switchport trunk allow vlan 105
no shutdown
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

