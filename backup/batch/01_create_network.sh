#!/bin/sh

#仮想ネットワーク作成
neutron net-create dmz-net
neutron net-create app-net
neutron net-create dbs-net

#仮想サブネット作成
neutron subnet-create --ip-version 4 --gateway 192.168.0.254 --name dmz-subnet dmz-net 192.168.0/24
neutron subnet-create --ip-version 4 --no-gateway --name app-subnet app-net 172.16.10.0/24
neutron subnet-create --ip-version 4 --no-gateway --name dbs-subnet dbs-net 172.16.20.0/24
neutron router-interface-add Ext-Router dmz-subnet

#確認
echo "ネットワークの設計確認"
neutron net-list

sleep 30


#セキュリティグループ作成
neutron security-group-create sg-web-from-internet
neutron security-group-create sg-all-from-app-net
neutron security-group-create sg-all-from-dbs-net
neutron security-group-create sg-all-from-console

#セキュリティルール作成
neutron security-group-rule-create --ethertype IPv4 --protocol tcp --port-range-min 80 --port-range-max 80 --remote-ip-prefix 0.0.0.0/0 sg-web-from-internet
neutron security-group-rule-create --ethertype IPv4 --protocol tcp --port-range-min 443 --port-range-max 443 --remote-ip-prefix 0.0.0.0/0 sg-web-from-internet

neutron security-group-rule-create --ethertype IPv4 --protocol tcp --port-range-min 1 --port-range-max 65535 --remote-ip-prefix 172.16.10.0/24 sg-all-from-app-net
neutron security-group-rule-create --ethertype IPv4 --protocol icmp --remote-ip-prefix 172.16.10.0/24 sg-all-from-app-net

neutron security-group-rule-create --ethertype IPv4 --protocol tcp --port-range-min 1 --port-range-max 65535 --remote-ip-prefix 172.16.20.0/24 sg-all-from-dbs-net
neutron security-group-rule-create --ethertype IPv4 --protocol icmp --remote-ip-prefix 172.16.20.0/24 sg-all-from-dbs-net

neutron security-group-rule-create --ethertype IPv4 --protocol tcp --port-range-min 1 --port-range-max 65535 --remote-ip-prefix 10.0.0.0/24 sg-all-from-console
neutron security-group-rule-create --ethertype IPv4 --protocol icmp --remote-ip-prefix 10.0.0.0/24 sg-all-from-console


