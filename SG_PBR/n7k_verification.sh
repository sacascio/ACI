#!/bin/sh

fwinnerints=""
fwouterints=""


get_bgp_neighbors() {

echo "! NEW BGP NEIGHBORS FOR VRF $3"
for i in `grep -iw neighbor N7K_PREWORK/$1dcinxc$2dciouter_$3|awk ' { print $2 } '`
do
grep -w $i x
done   
echo

echo "! OLD BGP NEIGHBORS FOR VRF $3"
dir=`ls -d N7K_CUTOVER/*|grep $3|grep -v exe|sed "s/N7K_CUTOVER//g"`
for i in `grep -iw neighbor N7K_CUTOVER/$dir/$1dcinxc$2dciouter|awk ' { print $2 } '`
do
grep -w $i x
done  
echo 
}

get_inner_fw_int() {
if [ $1 -ge 11 ]  && [ $1 -le 30 ]; then
fwinnerints="Ethernet2/3 Ethernet2/11"
fi

if [ $1 -ge 43 ]  && [ $1 -le 46 ]; then
fwinnerints="Ethernet2/3 Ethernet2/11"
fi

if [ $1 -ge 48 ]  && [ $1 -le 50 ]; then
fwinnerints="Ethernet2/4 Ethernet2/12"
fi

if [ $1 -ge 36 ]  && [ $1 -le 39 ]; then
fwinnerints="Ethernet2/2 Ethernet2/10"
fi

if [ $1 -eq 41 ] ; then
fwinnerints="Ethernet2/5 Ethernet2/13"
fi

if [ $1 -eq 40 ] ; then
fwinnerints="Ethernet2/6 Ethernet2/14"
fi

}

get_outer_fw_int() {

if [ $1 -ge 101 ]  && [ $1 -le 104 ] ; then
fwouterints="Ethernet5/5 Ethernet5/13"
fi

if [ $1 -eq 106 ] || [ $1 -eq 108 ] ; then
fwouterints="Ethernet5/5 Ethernet5/13"
fi

if [ $1 -eq 112 ] || [ $1 -eq 113 ] ; then
fwouterints="Ethernet5/4 Ethernet5/12"
fi

if [ $1 -eq 111 ]  ; then
fwouterints="Ethernet5/15 Ethernet5/19"
fi

if [ $1 -eq 110 ]  ; then
fwouterints="Ethernet5/16 Ethernet5/20"
fi

if [ $1 -eq 105 ]  ; then
fwouterints="Ethernet5/3 Ethernet5/11"
fi

}


if [ "$#" -ne 5 ]; then
echo "Usage: $0 VRF inner_svi outer_svi dc district"
echo "Example CTL-PA0 26 104 dc1 soe"
exit
fi

vrf=$1
i_svi=$2
o_svi=$3
dc=$4
district=$5

get_inner_fw_int $i_svi
get_outer_fw_int $o_svi


dc=`echo $dc | tr '[:upper:]' '[:lower:]'`
district=`echo $district | tr '[:upper:]' '[:lower:]'`

inner1_creds=`ls *1${district}inner_creds`
inner2_creds=`ls *2${district}inner_creds`
inner3_creds=`ls *3${district}inner_creds`
inner4_creds=`ls *4${district}inner_creds`
outer1_creds=`ls *1dciouter_creds`
outer2_creds=`ls *2dciouter_creds`
outer3_creds=`ls *3dciouter_creds`
outer4_creds=`ls *4dciouter_creds`


echo "show ip int br vrf $vrf" > inner_check
echo "show ip bgp summary vrf $vrf" >> inner_check
for i in `echo $fwinnerints`
do
echo "show run int $i" >> inner_check
done

echo "! Inner1"
./check_n7k_output.py -c $inner1_creds -f inner_check
echo "! Inner2"
./check_n7k_output.py -c $inner2_creds -f inner_check
echo "! Inner3"
./check_n7k_output.py -c $inner3_creds -f inner_check
echo "! Inner4"
./check_n7k_output.py -c $inner4_creds -f inner_check

# Prepare outer VDC check
#echo "sh ip int br | inc $o_svi" > outer_check
echo "sh ip int br | inc 'Vlan$o_svi'" > outer_check
echo "sh ip int br | inc Eth5/25.$i_svi" >> outer_check
echo "sh ip int br | inc Eth5/26.$i_svi" >> outer_check
echo "sh ip int br | inc Eth5/27.$i_svi" >> outer_check
echo "sh ip int br | inc Eth5/28.$i_svi" >> outer_check
echo "sh ip bgp summary" > bgp_check

for i in `echo $fwouterints`
do
echo "show run int $i" >> outer_check
done

echo "! Outer 1"
./check_n7k_output.py -c $outer1_creds -f outer_check
./check_n7k_output.py -c $outer1_creds -f bgp_check > x
get_bgp_neighbors $dc 1 $vrf

echo "! Outer 2"
./check_n7k_output.py -c $outer2_creds -f outer_check
./check_n7k_output.py -c $outer2_creds -f bgp_check > x
get_bgp_neighbors $dc 2 $vrf

echo "! Outer 3"
./check_n7k_output.py -c $outer3_creds -f outer_check
./check_n7k_output.py -c $outer3_creds -f bgp_check > x
get_bgp_neighbors $dc 3 $vrf

echo "! Outer 4"
./check_n7k_output.py -c $outer4_creds -f outer_check
./check_n7k_output.py -c $outer4_creds -f bgp_check > x
get_bgp_neighbors $dc 4 $vrf

rm inner_check
rm outer_check
rm x
rm bgp_check
