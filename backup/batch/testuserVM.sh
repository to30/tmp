#!/bin/sh

function get_uuid () { cat - | grep " id " | awk '{print $4}'; }
function get_floating_ip () { cat - | grep " - " | awk '{print $4}'; }


export MY_DMZ_NET=`neutron net-show dmz-net | get_uuid`
export MY_APP_NET=`neutron net-show app-net | get_uuid`
export MY_DBS_NET=`neutron net-show dbs-net | get_uuid`
env |grep MY_

nova boot --flavor standard.xsmall --image "centos-base" \
--key-name testkey2016-05-16 --user-data userdata_web.txt \
--security-groups sg-all-from-console,sg-web-from-internet,sg-all-from-app-net \
--availability-zone az1 \
--nic net-id=${MY_DMZ_NET} --nic net-id=${MY_APP_NET} \
testuserVM
