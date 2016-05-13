#!/bin/sh

function get_uuid () { cat - | grep " HTTP " | awk '{print $2}'; }

neutron lb-pool-create --name http-pool --lb-method ROUND_ROBIN --protocol HTTP --subnet-id dmz-subnet

#ここでLB配下に入れるIPアドレス取得も自働化する必要がある
neutron lb-member-create --address 192.168.0.11 --protocol-port 80 http-pool
neutron lb-member-create --address 192.168.0.14 --protocol-port 80 http-pool

#確認
echo "LB配下のメンバリスト"
neutron lb-member-list

echo "HTTPプール"
neutron lb-pool-show http-pool

echo "死活監視ルール登録"
neutron lb-healthmonitor-create --delay 5 --type HTTP --max-retries 3 --timeout 2

function get_uuid () { cat - | grep " HTTP " | awk '{print $2}'; }

export MY_HEALTH_MONITOR=`neutron lb-healthmonitor-list | get_uuid`

echo ${MY_HEALTH_MONITOR}

neutron lb-healthmonitor-associate ${MY_HEALTH_MONITOR} http-pool

#確認

neutron lb-pool-show http-pool

#VirtualIP作成
neutron lb-vip-create --name http-vip --protocol-port 80 --protocol HTTP --subnet-id dmz-subnet http-pool

#VIPi一覧
#neutron lb-vip-list

#http-vip に割り当てたVIPの確認

#neutron lb-vip-show http-vip

#port_id取得

export MY_POOL_ID=`neutron lb-vip-show http-vip|grep " port_id " |awk '{print $4}';`
#echo "下記期待値は2e72dded-d134-4ef6-9a6c-9bcc9c5f1ef0"
echo ${MY_POOL_ID}

function get_floating_ip () { cat - | grep " - " | awk '{print $2}'; }

nova floating-ip-create Ext-Net
sleep 5
echo "LBにfloatind-ipを割り当て"
export MY_FLOATING_IP=`nova floating-ip-list | get_floating_ip`
#echo "下記期待値は1e95a90c-24c7-4273-be48-b3407db1f39c"
echo ${MY_FLOATING_IP}

#未確認
nova floating-ip-associate ${MY_FLOATING_IP} ${MY_POOL_ID}






