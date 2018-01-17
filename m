!!! District SOE, DC dc2, nexusVDC N7K-A
!
interface vlan 26
  description Layer3_CONTROL_CTL-PA0-DC2-SOE
  vrf member CTL-PA0-DC2-SOE 
  ip address 10.255.32.241 255.255.255.252
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.10
  no shutdown
interface vlan 27
  description Layer3_CONTROL_CTL-PA1-DC2-SOE
  vrf member CTL-PA1-DC2-SOE 
  ip address 10.255.33.1 255.255.255.252
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.10
  no shutdown
interface vlan 28
  description Layer3_CONTROL_CTL-PA2-DC2-SOE
  vrf member CTL-PA2-DC2-SOE 
  ip address 10.255.33.17 255.255.255.252
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.10
  no shutdown
interface vlan 29
  description Layer3_CONTROL_CTL-PTM-DC2-SOE
  vrf member CTL-PTM-DC2-SOE 
  ip address 10.255.33.33 255.255.255.252
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.10
  no shutdown
interface vlan 30
  description Layer3_CONTROL_CTL-PTM-DMZ-DC2-SOE
  vrf member CTL-PTM-DMZ-DC2-SOE 
  ip address 10.255.33.49 255.255.255.252
  ip ospf network point-to-point
  ip router ospf CONTROL area 0.0.0.10
  no shutdown
!
!
router ospf CONTROL
 vrf CTL-PA0-DC2-SOE
   router-id 10.100.201.1
   log-adjacency-changes
 vrf CTL-PA1-DC2-SOE
   router-id 10.100.201.1
   log-adjacency-changes
 vrf CTL-PA2-DC2-SOE
   router-id 10.100.201.1
   log-adjacency-changes
 vrf CTL-PTM-DC2-SOE
   router-id 10.100.201.1
   log-adjacency-changes
 vrf CTL-PTM-DMZ-DC2-SOE
   router-id 10.100.201.1
   log-adjacency-changes
!
!
!
interface vlan 43
  description Layer3_AUDIT_AUD-ACC-DC2-SOE
  vrf member AUD-ACC-DC2-SOE 
  ip address 10.255.34.1 255.255.255.252
  ip ospf network point-to-point
  ip router ospf AUDIT area 0.0.0.10
  no shutdown
interface vlan 44
  description Layer3_AUDIT_AUD-DAT-DC2-SOE
  vrf member AUD-DAT-DC2-SOE 
  ip address 10.255.34.17 255.255.255.252
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
!
interface vlan 20
  description Layer3_LIMITED_LTD-VND-DC2-SOE
  vrf member LTD-VND-DC2-SOE 
  ip address 10.255.32.145 255.255.255.252
  ip ospf network point-to-point
  ip router ospf LIMITED area 0.0.0.10
  no shutdown
interface vlan 21
  description Layer3_LIMITED_LTD-INF-DC2-SOE
  vrf member LTD-INF-DC2-SOE 
  ip address 10.255.32.161 255.255.255.252
  ip ospf network point-to-point
  ip router ospf LIMITED area 0.0.0.10
  no shutdown
!
!
router ospf LIMITED
 vrf LTD-VND-DC2-SOE
   router-id 10.100.201.1
   log-adjacency-changes
 vrf LTD-INF-DC2-SOE
   router-id 10.100.201.1
   log-adjacency-changes
!
!
!
interface vlan 45
  description Layer3_RESTRICTED_RES-MFR-DC2-SOE
  vrf member RES-MFR-DC2-SOE 
  ip address 10.255.34.33 255.255.255.252
  ip ospf network point-to-point
  ip router ospf RESTRICTED area 0.0.0.10
  no shutdown
interface vlan 46
  description Layer3_RESTRICTED_RES-DST-DC2-SOE
  vrf member RES-DST-DC2-SOE 
  ip address 10.255.34.49 255.255.255.252
  ip ospf network point-to-point
  ip router ospf RESTRICTED area 0.0.0.10
  no shutdown
interface vlan 47
  description Layer3_RESTRICTED_RES-MMP-DC2-SOE
  vrf member RES-MMP-DC2-SOE 
  ip address 10.255.34.65 255.255.255.252
  ip ospf network point-to-point
  ip router ospf RESTRICTED area 0.0.0.10
  no shutdown
!
!
router ospf RESTRICTED
 vrf RES-MFR-DC2-SOE
   router-id 10.100.201.1
   log-adjacency-changes
 vrf RES-DST-DC2-SOE
   router-id 10.100.201.1
   log-adjacency-changes
 vrf RES-MMP-DC2-SOE
   router-id 10.100.201.1
   log-adjacency-changes
!
!
!
interface vlan 17
  description Layer3_USER_ACCESS_UAC-ENT-DC2-SOE
  vrf member UAC-ENT-DC2-SOE 
  ip address 10.255.32.97 255.255.255.252
  ip ospf network point-to-point
  ip router ospf USER_ACCESS area 0.0.0.10
  no shutdown
!
!
router ospf USER_ACCESS
 vrf UAC-ENT-DC2-SOE
   router-id 10.100.201.1
   log-adjacency-changes
!
!
!
interface vlan 11
  description Layer3_SERVICES_SVC-COM-DC2-SOE
  vrf member SVC-COM-DC2-SOE 
  ip address 10.255.32.1 255.255.255.252
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.10
  no shutdown
interface vlan 12
  description Layer3_SERVICES_SVC-ITC-DC2-SOE
  vrf member SVC-ITC-DC2-SOE 
  ip address 10.255.32.17 255.255.255.252
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.10
  no shutdown
interface vlan 13
  description Layer3_SERVICES_SVC-BSC-DC2-SOE
  vrf member SVC-BSC-DC2-SOE 
  ip address 10.255.32.33 255.255.255.252
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.10
  no shutdown
interface vlan 14
  description Layer3_SERVICES_SVC-TFR-DC2-SOE
  vrf member SVC-TFR-DC2-SOE 
  ip address 10.255.32.49 255.255.255.252
  ip ospf network point-to-point
  ip router ospf SERVICES area 0.0.0.10
  no shutdown
!
!
router ospf SERVICES
 vrf SVC-COM-DC2-SOE
   router-id 10.100.201.1
   log-adjacency-changes
 vrf SVC-ITC-DC2-SOE
   router-id 10.100.201.1
   log-adjacency-changes
 vrf SVC-BSC-DC2-SOE
   router-id 10.100.201.1
   log-adjacency-changes
 vrf SVC-TFR-DC2-SOE
   router-id 10.100.201.1
   log-adjacency-changes
!
!
!
interface vlan 36
  description Layer3_DMZ_DMZ-WEB-DC2-SOE
  vrf member DMZ-WEB-DC2-SOE 
  ip address 10.255.33.145 255.255.255.252
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
interface vlan 37
  description Layer3_DMZ_DMZ-B2B-DC2-SOE
  vrf member DMZ-B2B-DC2-SOE 
  ip address 10.255.33.161 255.255.255.252
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
interface vlan 38
  description Layer3_DMZ_DMZ-MAL-DC2-SOE
  vrf member DMZ-MAL-DC2-SOE 
  ip address 10.255.33.177 255.255.255.252
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
interface vlan 39
  description Layer3_DMZ_DMZ-DNS-DC2-SOE
  vrf member DMZ-DNS-DC2-SOE 
  ip address 10.255.33.193 255.255.255.252
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
interface vlan 40
  description Layer3_DMZ_DMZ-RAC-DC2-SOE
  vrf member DMZ-RAC-DC2-SOE 
  ip address 10.255.33.209 255.255.255.252
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
interface vlan 41
  description Layer3_DMZ_DMZ-PXY-DC2-SOE
  vrf member DMZ-PXY-DC2-SOE 
  ip address 10.255.33.225 255.255.255.252
  ip ospf network point-to-point
  ip router ospf DMZ area 0.0.0.10
  no shutdown
!
!
router ospf DMZ
 vrf DMZ-WEB-DC2-SOE
   router-id 10.100.201.1
   log-adjacency-changes
 vrf DMZ-B2B-DC2-SOE
   router-id 10.100.201.1
   log-adjacency-changes
 vrf DMZ-MAL-DC2-SOE
   router-id 10.100.201.1
   log-adjacency-changes
 vrf DMZ-DNS-DC2-SOE
   router-id 10.100.201.1
   log-adjacency-changes
 vrf DMZ-RAC-DC2-SOE
   router-id 10.100.201.1
   log-adjacency-changes
 vrf DMZ-PXY-DC2-SOE
   router-id 10.100.201.1
   log-adjacency-changes
!
!
!
router bgp 65511
 router-id 10.100.201.1
 address-family l2vpn evpn
  maximum-paths 8
vrf CTL-PA0-DC2-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.50 remote-as 65510
 description TO_dc2dcinxc1dciouter_CONTROL-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PA1-DC2-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.50 remote-as 65510
 description TO_dc2dcinxc1dciouter_CONTROL-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PA2-DC2-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.50 remote-as 65510
 description TO_dc2dcinxc1dciouter_CONTROL-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PTM-DC2-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.50 remote-as 65510
 description TO_dc2dcinxc1dciouter_CONTROL-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf CTL-PTM-DMZ-DC2-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.50 remote-as 65510
 description TO_dc2dcinxc1dciouter_CONTROL-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf AUD-ACC-DC2-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.82 remote-as 65510
 description TO_dc2dcinxc1dciouter_AUDIT-DC2-SOE
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
vrf LTD-VND-DC2-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.34 remote-as 65510
 description TO_dc2dcinxc1dciouter_LIMITED-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf LTD-INF-DC2-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.34 remote-as 65510
 description TO_dc2dcinxc1dciouter_LIMITED-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf RES-MFR-DC2-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.98 remote-as 65510
 description TO_dc2dcinxc1dciouter_RESTRICTED-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf RES-DST-DC2-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.98 remote-as 65510
 description TO_dc2dcinxc1dciouter_RESTRICTED-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf RES-MMP-DC2-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.98 remote-as 65510
 description TO_dc2dcinxc1dciouter_RESTRICTED-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf UAC-ENT-DC2-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.18 remote-as 65510
 description TO_dc2dcinxc1dciouter_USER_ACCESS-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf SVC-COM-DC2-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.2 remote-as 65510
 description TO_dc2dcinxc1dciouter_SERVICES-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf SVC-ITC-DC2-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.2 remote-as 65510
 description TO_dc2dcinxc1dciouter_SERVICES-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf SVC-BSC-DC2-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.2 remote-as 65510
 description TO_dc2dcinxc1dciouter_SERVICES-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf SVC-TFR-DC2-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.2 remote-as 65510
 description TO_dc2dcinxc1dciouter_SERVICES-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-WEB-DC2-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-B2B-DC2-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-MAL-DC2-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-DNS-DC2-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-RAC-DC2-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
vrf DMZ-PXY-DC2-SOE
 address-family ipv4 unicast
  maximum-paths 8
 neighbor 10.255.38.66 remote-as 65510
 description TO_dc2dcinxc1dciouter_DMZ-DC2-SOE
    ebgp-multihop 4
    address-family ipv4 unicast
      send-community both
!
!
!
! Allow VLANs on the firewall
interface E2/5
switchport
switchport trunk allow vlan 11,12,13,14,17,20,21,26,27,28,29,30,36,37,38,39,40,41,43,44,45,46,47
interface E2/6
switchport
switchport trunk allow vlan 11,12,13,14,17,20,21,26,27,28,29,30,36,37,38,39,40,41,43,44,45,46,47
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

