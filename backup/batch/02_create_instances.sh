#!/bin/sh

function get_uuid () { cat - | grep " id " | awk '{print $4}'; }
function get_floating_ip () { cat - | grep " - " | awk '{print $4}'; }


export MY_DMZ_NET=`neutron net-show dmz-net | get_uuid`
export MY_APP_NET=`neutron net-show app-net | get_uuid`
export MY_DBS_NET=`neutron net-show dbs-net | get_uuid`
env |grep MY_

nova boot --flavor standard.xsmall --image "centos-base" \
--key-name key-for-internal --user-data userdata_web.txt \
--security-groups sg-all-from-console,sg-web-from-internet,sg-all-from-app-net \
--availability-zone az1 \
--nic net-id=${MY_DMZ_NET} --nic net-id=${MY_APP_NET} \
web01

nova boot --flavor standard.xsmall --image "centos-base" \
--key-name key-for-internal --user-data userdata_app.txt \
--security-groups sg-all-from-console,sg-all-from-app-net,sg-all-from-dbs-net \
--availability-zone az1 \
--nic net-id=${MY_DMZ_NET} --nic net-id=${MY_APP_NET} --nic net-id=${MY_DBS_NET} \
app01

nova boot --flavor standard.xsmall --image "centos-base" \
--key-name key-for-internal --user-data userdata_dbs.txt \
--security-groups sg-all-from-console,sg-all-from-dbs-net \
--availability-zone az1 \
--nic net-id=${MY_DMZ_NET} --nic net-id=${MY_DBS_NET} \
dbs01

#サーバ一覧
sleep 30
echo "サーバ一覧"
nova list

nova floating-ip-create Ext-Net
echo "WEB01にfloatind-ipを割り当て"
export MY_FLOATING_IP=`nova floating-ip-list | get_floating_ip`
echo ${MY_FLOATING_IP}
nova floating-ip-associate web01 ${MY_FLOATING_IP}
nova list


