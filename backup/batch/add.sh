#!/bin/sh

#VIPi一覧
#neutron lb-vip-list

#http-vip に割り当てたVIPの確認

#neutron lb-vip-show http-vip

#port_id取得

export MY_POOL_ID=`neutron lb-vip-show http-vip|grep " port_id " |awk '{print $4}';`
#export MY_POOL_ID=`neutron lb-vip-show http-vip|grep " id " |awk '{print $4}';`
echo "下記期待値は2e72dded-d134-4ef6-9a6c-9bcc9c5f1ef0"
echo ${MY_POOL_ID}

function get_floating_ip () { cat - | grep " - " | awk '{print $2}'; }

#nova floating-ip-create Ext-Net
#sleep 30
echo "LBにfloatind-ipを割り当て"
export MY_FLOATING_IP=`nova floating-ip-list | get_floating_ip`
echo "下記期待値は1e95a90c-24c7-4273-be48-b3407db1f39c"
echo ${MY_FLOATING_IP}
#nova floating-ip-associate ${MY_FLOATING_IP} ${MY_POOL_ID}  

