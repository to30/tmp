ping www.google.com
exit
ls
more openrc 
cd install_cli/
ls
more install.sh 
ls -ltr /etc/bash_completion.d/
cd
yum update
yum install -y -q epel-release
yum install -y -q gcc gcc-c++ make python-devel python-pip openssl-devel libxml2 libxml2-devel libxslt libxslt-devel libffi libffi-devel libyaml libyaml-devel
yum groupinstall "Development tools"
yum install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel
cd /tmp
curl -O https://www.python.org/ftp/python/2.7.6/Python-2.7.6.tgz
tar zxf Python-2.7.6.tgz
cd Python-2.7.6
./configure --prefix=/opt/local
make && make altinstall
echo $?
curl -kL https://bootstrap.pypa.io/get-pip.py | /opt/local/bin/python2.7
cd
mkdir virtualenv
cd virtualenv/
virtualenv -p /opt/local/bin/python2.7 venv27
/opt/local/bin/pip2.7 install virtualenv
virtualenv -p /opt/local/bin/python2.7 venv27
/opt/local/bin/python2.7 |virtualenv -p /opt/local/bin/python2.7 venv27
cat /root/.bashrc
virtualenv -p /opt/local/bin/python2.7 venv27
/opt/local/bin/pip2.7 install virtualenv
virtualenv
mkvirtualenv
virtualenv -p /opt/local/bin/python2.7 venv27
pip install virtualenv
virtualenv -p /opt/local/bin/python2.7 venv27
cd
. ven27/bin/activate
. virtualenv/ven27/bin/activate
cd virtualenv/
. ven27/bin/activate
pip install 'requests[security]'
ls
cd venv27/
ls
cd ..
cd
ls
. virtualenv/venv27/bin/activate
exit
ls
vi openrc 
source openrc 
ls
cd virtualenv/
ls
cd ../
ls
./virtualenv/venv27/bin
cd
ls
. virtualenv/ven27/bin/activate
cd virtualenv/
virtualenv -p /opt/local/bin/python2.7 venv27
. ven27/bin/activate
ls
cd venv27/
ls
cd bin/
ls
pwd
cd
vi openrc 
source openrc 
vi openrc 
source openrc 
ls
vi requirements.txt
cd install_cli/
ls
vi requirements.txt 
cd ..
vi requirements.txt 
cat install_cli/requirements.txt 
cat requirements.txt 
pip install -q -r requirements.txt
exit
ls
source openrc 
pip install virtualenv
pip install 'requests[security]'
pip install -q -r requirements.txt
pip freeze
cd install_cli/
ls
cat install.sh 
yum install -y bash-completion
cat install.sh 
for service in nova neutron cinder keystone glance; do     wget -q -O /etc/bash_completion.d/${service} http://git.openstack.org/cgit/openstack/python-${service}client/plain/tools/${service}.bash_completion; done
ls -ltr /etc/bash_completion.d/
find / -name keystone.bash_completion
find / -name keystone.bash
cat install.sh 
ls
wget -keystone https://raw.github.com/openstack/python-keystoneclient/master/tools/keystone.bash_completion
wget -O keystone https://raw.github.com/openstack/python-keystoneclient/master/tools/keystone.bash_completion
ls -ltr
rm keystone 
find / -name keystone
ls -ltr /etc/bash_completion.d/keystone
find / -name keystone.bash
ls
cat install.sh 
env|grep OS_
cd ..
vi openrc 
wget -q -O /etc/bash_completion.d/heat http://git.openstack.org/cgit/openstack/python-heatclient/plain/tools/heat.bash_completion
ls -ltr /etc/bash_completion.d/heat
ls
cat requirements.txt 
wget -q -O /etc/bash_completion.d/ceilometer http://git.openstack.org/cgit/openstack/python-ceilometerclient/plain/tools/ceilometer.bash_completion
ls -ltr /etc/bash_completion.d/ceilometer
wget -q -O /etc/bash_completion.d/keystone http://git.openstack.org/cgit/openstack/python-keystoneclient/plain/tools/keystone.bash_completion
ls -ltr /etc/bash_completion.d/keystone
ls -ltr /etc/bash_completion.d/ceilometer
ls -ltr /etc/bash_completion.d/heat
ls
cd install_cli/
ls
vi install.sh 
ls
cd ..
ls
cp requirements.txt install_cli/requirements.txt
cd install_cli/
vi requirements.txt 
ls -asl
cd git
ls
cd .git
vi config 
cd ..
mv install_cli o_install_cli
git clone https://github.com/to30/install_cli.git
cd install_cli/
cat .git/config 
ls
diff requirements.txt ../o_install_cli/requirements.txt 
ls
cp ../o_install_cli/requirements.txt .
diff install.sh ../o_install_cli/install.sh 
vi install.sh 
git add .
git commit -m "added ceilometer to install.sh and version up python-client to requirements.txt"
git config --global user.name "to30"
git config --global user.email tomonaga@mx2.mesh.ne.jp
git commit -m "added ceilometer to install.sh and version up python-client to requirements.txt"
git log
git push origin master
vi .git/conf
vi .git/config 
git push origin master
ls
vi README.md 
git add .
git commit -m "READMEに課題追加"
git push origin master
exit
source openrc 
vi openrc 
source openrc 
ls
rm -Rf o_install_cli
ls
mkdir batch
cd batch
vi 01_create_network.sh
ls -ltr
chmod 755 01_create_network.sh 
./01_create_network.sh 
vi 01_create_network.sh
./01_create_network.sh 
exit
source openrc 
cd batch/
vi 01_create_network.sh 
./01_create_network.sh 
vi 01_create_network.sh 
cd ..
ls
git clone https://github.com/josug-book1-materials/chapter05-10.git
vi batch/01_create_network.sh 
nova keypair-add key-for-internal | tee key-for-internal.pem
chmod 600 key-for-internal.pem 
exit
ls
vi userdata_web.txt
cp userdata_web.txt userdata_app.txt
vi userdata_app.txt 
cp userdata_web.txt userdata_dbs.txt
vi userdata_dbs.txt 
cd batch/
cp ~/chapter05-10/06/03_set_network_uuid_to_val.sh 02_set_network_uuid_to_val.sh
vi 02_set_network_uuid_to_val.sh 
chmod 02_set_network_uuid_to_val.sh 
chmod 755 02_set_network_uuid_to_val.sh 
./02_set_network_uuid_to_val.sh 
cd ..
source openrc 
./02_set_network_uuid_to_val.sh 
cd batch/
./02_set_network_uuid_to_val.sh 
cd ..
vi openrc 
cd batch/
cat 02_set_network_uuid_to_val.sh 
export MY_DMZ_NET=`neutron net-show dmz-net | get_uuid`
env |grep MY_
vi 02_set_network_uuid_to_val.sh 
./02_set_network_uuid_to_val.sh 
cp ~/chapter05-10/06/04_create_instances.sh 03_create_instances.sh
cat 03_create_instances.sh 
vi 03_create_instances.sh 
cd ..
ls
cp key-for-internal.pem batch/
cp move userdata_*  batch/
move userdata_*  batch/
mv userdata_*  batch/
ls
ls batch/
pwd
diff userdata_app.txt batch/userdata_app.txt
rm userdata_app.txt 
cd batch/
ls
chmod 755 03_create_instances.sh 
ls
cat userdata_app.txt
cat userdata_dbs.txt 
cat userdata_web.txt 
ls
./02_set_network_uuid_to_val.sh 
./03_create_instances.sh 
vi 03_create_instances.sh 
cat 02_set_network_uuid_to_val.sh 
vi 03_create_instances.sh 
./03_create_instances.sh 
ls
rm 02_set_network_uuid_to_val.sh 
mv 03_create_instances.sh 02_create_instances.sh 
ls -ltr
cat 02_create_instances.sh 
function get_uuid () { cat - | grep " id " | awk '{print $4}'; }
neutron net-show dmz-net
neutron net-show dmz-net|grep id
neutron net-show dmz-net|grep " id "
neutron net-show dmz-net|grep " id "|awk 'print $4'
neutron net-show dmz-net|grep " id "|awk '{print $4}'
vi 02_create_instances.sh 
nova list
ssh -i key-for-internal.pem root@192.168.0.3
ssh -i key-for-internal.pem root@192.168.0.4
ping 192.168.0.4
vi 01_create_network.sh 
./01_create_network.sh 
ls
./02_create_instances.sh 
vi 02_create_instances.sh 
nova list
ssh -i key-for-internal.pem root@192.168.0.6
nova console-log app01
ssh -i key-for-internal.pem root@192.168.0.6
nova list
ssh -i key-for-internal.pem root@192.168.0.5
ssh -i key-for-internal.pem root@192.168.0.6
ls
cat userdata_app.txt 
cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
date
ls
exit
ssh -i key-for-internal.pem root@192.168.0.9
ssh -i key-for-internal.pem root@192.168.0.6
ssh -i key-for-internal.pem root@192.168.0.9
ssh -i key-for-internal.pem root@192.168.0.8
ssh -i key-for-internal.pem root@192.168.0.12
ssh -i key-for-internal.pem root@192.168.0.11
ssh -i key-for-internal.pem root@192.168.0.12
ssh -i key-for-internal.pem root@192.168.0.13
ssh -i key-for-internal.pem root@192.168.0.12
ssh -i key-for-internal.pem root@192.168.0.11
ssh -i key-for-internal.pem root@192.168.0.14
ls
cat batch/02_create_instances.sh 
exit
source openrc 
cd batch/
ls -ltr
./02_create_instances.sh 
nova console-log app01
nova list
nova console-log web01
nova console-log db01
nova list
nova console-log dbs01
nova list
ls
more userdata_app.txt
ls -ltr
vi userdata_web.txt 
vi userdata_dbs.txt 
vi userdata_app.txt 
ls -ltr
./02_create_instances.sh 
nova console-log dbs01
watch nova console-log dbs01
nova console-log dbs01
nova list
ls
more userdata_app.txt 
nova list
3
nova floating-ip-create Ext-Net
nova floating-ip-bulk-list 
nova floating-ip-list
cat 02_create_instances.sh 
nova floating-ip-list
function get_floating-ip () { cat - | grep " - " | awk '{print $2}'; }
vi 02_create_instances.sh 
export MY_FLOATING_IP=`nova floating-ip-list | get_floating-ip`
echo $MY_FLOATING_IP
function get_floating-ip () { cat - | grep " - " | awk '{print $4}'; }
export MY_FLOATING_IP=`nova floating-ip-list | get_floating-ip`
echo $MY_FLOATING_IP
vi 02_create_instances.sh 
vi 02_add.sh
chmod 755 02_add.sh 
./02_add.sh 
vi 02_add.sh
cat 02_create_instances.sh 
vi 02_add.sh
./02_add.sh 
vi 02_add.sh
cat 02_create_instances.sh 
vi 02_add.sh
./02_add.sh 
vi 02_add.sh
./02_add.sh 
vi 02_add.sh
./02_add.sh 
vi 02_add.sh
./02_add.sh 
cat 02_add.sh
vi 02_add.sh
./02_add.sh 
cat 02_add.sh
vi 02_create_instances.sh 
openstack server list --name,web01
openstack server list 
openstack server list --field Name
neutron lb-pool-create --name http-pool --lb-method -
ls
rm 02_add.sh 
cp userdata_web.txt userdata_web_auto_setting.txt
vi userdata_web_auto_setting.txt 
ls
cp 02_create_instances.sh 03_create_web_auto_setting.sh
vi 03_create_web_auto_setting.sh 
cat 02_create_instances.sh 
i 03_create_web_auto_setting.sh 
vi 03_create_web_auto_setting.sh 
chmod 755 03_create_web_auto_setting.sh 
./03_create_web_auto_setting.sh 
nova console-log web02
nova list
ls
cp 03_create_web_auto_setting.sh 04_create_lb_setting.sh
chmod 755 04_create_lb_setting.sh 
vi 04_create_lb_setting.sh 
nova list|grep web
nova list|grep "web"| awk '{print $12}'
ls
vi 04_create_lb_setting.sh 
./04_create_lb_setting.sh 
neutron lb-member-list
vi 04_create_lb_setting.sh 
cat 04_create_lb_setting.sh 
neutron lb-member-list
neutron lb-pool-show http-pool
neutron lb-healthmonitor-create --delay 5 --type HTTP --max-retries 3 --timeout 2
vi add.sh
cat 01_create_network.sh 
vi 01_create_network.sh 
cat 02_create_instances.sh 
vi add.sh 
cat 02_create_instances.sh 
vi add.sh 
neutron lb-healthmonitor-show 
neutron lb-healthmonitor-list
vi add.sh 
chmod 755 add.sh 
./add.sh 
vi add.sh 
ls -ltr
vi 04_create_lb_setting.sh 
vi add.sh 
./add.sh 
vi add.sh 
./add.sh 
vi add.sh 
ls -ltr
vi 04_create_lb_setting.sh 
vi add.sh 
cat 02_create_instances.sh 
vi add.sh 
./add.sh 
neutron floatingip-list
cat 02_create_instances.sh 
vi add.sh 
cat 02_create_instances.sh 
vi add.sh 
cat 02_create_instances.sh 
vi 02_create_instances.sh 
vi add.sh 
cat add.sh 
vi add.sh 
./add.sh 
vi add.sh 
./add.sh 
vi add.sh 
nova list
vi add.sh 
./add.sh 
neutron floatingip-list
cat 02_create_instances.sh 
vi add.sh 
./add.sh 
neutron floatingip-list
vi add.sh 
nova floating-ip-list
vi add.sh 
./add.sh 
vi add.sh 
./add.sh 
neutron floatingip-associate http-vip 192.168.100.133
neutron floatingip-associate http-vip 1e95a90c-24c7-4273-be48-b3407db1f39c
neutron floatingip-associate 1e95a90c-24c7-4273-be48-b3407db1f39c http-vip
neutron floatingip-associate 1e95a90c-24c7-4273-be48-b3407db1f39c 26c22a91-0ca4-4cde-a196-c705d220f5e6
neutron floatingip-associate 1e95a90c-24c7-4273-be48-b3407db1f39c 2e72dded-d134-4ef6-9a6c-9bcc9c5f1ef0
nova floating-ip-list
vi add.sh 
./add.sh 
vi add.sh 
ls
cat 04_create_lb_setting.sh 
ls -ltr
cat add.sh 
ls -ltr
vi 04_create_lb_setting.sh 
ls -ltr
cd ..
ls
exit
ssh -i key-for-internal.pem root@192.168.0.14
source openrc 
nova console-log web02
ssh -i key-for-internal.pem 192.168.0.14
neutron floatingip-list
exit
source openrc 
nova aggregate-list
nova baremetal-node-list
nova absolute-limits
nova aggregate-list
nova server-group-list
nova server-group-create --policy anti-affinity test-anti-affinity 
nova server-group-list
nova server-group-create --policy affinity test-affinity
nova server-group-list
exit
ls
source openrc 
nova aggregate-details ag1
ls
cd batch/
ls
cp userdata_app.txt userdata_v2_app.txt
vi userdata_v2_app.txt 
cp userdata_web_auto_setting.txt userdata_v2_web.txt
vi userdata_v2_web.txt 
cp ../chapter05-10/08/01_create_v2_servers.sh .
ls -ltr
mv 01_create_v2_servers.sh 05_create_v2_servers.sh
vi 05_create_v2_servers.sh 
chmod 755 05_create_v2_servers.sh 
./05_create_v2_servers.sh 
ls -ltr userdata_dbs.txt
vi 05_create_v2_servers.sh 
ls -ltr userdata_dbs.txt
vi 05_create_v2_servers.sh 
./05_create_v2_servers.sh 
vi userdata_dbs.txt
ls -ltr
./05_create_v2_servers.sh 
vi 05_create_v2_servers.sh 
pwd
cp ../openrc .
vi 05_create_v2_servers.sh 
./05_create_v2_servers.sh 
ls openrc 
ls -ltr openrc 
vi 05_create_v2_servers.sh 
./05_create_v2_servers.sh 
vi openrc 
exit
cd batch/
source openrc 
sh 05_create_v2_servers.sh 
exit
cd batch/
./05_create_v2_servers.sh 
cat 05_create_v2_servers.sh 
cat openrc
pwd
vi 05_create_v2_servers.sh 
./05_create_v2_servers.sh 
vi 05_create_v2_servers.sh 
./05_create_v2_servers.sh 
source openrc 
swift list
swift stat sample_bbs
ls 
cat 04_create_lb_setting.sh 
neutron lb-member-create --address 192.168.0.18 --protocol-port 80 http-pool
nova list
nova list 
neutron lb-member-create --address 192.168.0.19 --protocol-port 80 http-pool
ssh -i key-for-internal.pem root@192.168.0.18
ls
vi 04_create_lb_setting.sh 
vi 05_create_v2_servers.sh 
ssh -i key-for-internal.pem root@192.168.0.18
ls
vi userdata_v2_app.txt 
vi 05_create_v2_servers.sh 
ssh -i key-for-internal.pem root@192.168.0.17
ls
vi 05_create_v2_servers.sh 
vi userdata_v2_app.txt 
ssh -i key-for-internal.pem root@192.168.0.18
ssh -i key-for-internal.pem root@192.168.0.17
ssh -i key-for-internal.pem root@192.168.0.13
ssh -i key-for-internal.pem root@192.168.0.17
ssh -i key-for-internal.pem root@192.168.0.16
exit
cd bat
cd batch/
ls -ltr
cat userdata_v2_web.txt
ls
cat userdata_app.txt
cat 02_create_instances.sh 
ls
ls -ltr
vi userdata_v2_web.txt
vi userdata_v2_app.txt 
vi 05_create_v2_servers.sh
cat userdata_v2_app.txt
exit
ssh -i key-for-internal.pem root@192.168.0.17
ssh -i key-for-internal.pem root@192.168.0.16
ssh -i key-for-internal.pem root@192.168.0.18
ssh -i key-for-internal.pem root@192.168.0.19
cd batch/
source openrc 
cinder create --display-name dbs_vol01 --availability-zone az1 1
cinder list
function get uuid () { cat - grep " id " | awk '{print $4}'; }
function get_uuid () { cat - grep " id " | awk '{print $4}'; }
export MY_DBS_VOL01=`cinder show dbs_vol01 | get_uuid`
function get_uuid () { cat - | grep " id " | awk '{print $4}'; }
export MY_DBS_VOL01=`cinder show dbs_vol01 | get_uuid`
echo $MY_DBS_VOL01
nova volume-attach dbs01 $MY_DBS_VOL01
ls
vi 06_create_attached_cinderVol.sh
ssh -i key-for-internal.pem root@192.168.0.13
ssh -i key-for-internal.pem root@192.168.0.12
cinder snapshot-create --display-name dbs_vol1-snap001 $MY_DBS_VOL01
echo $MY_DBS_VOL01
cinder snapshot-create --force --display-name dbs_vol1-snap001 $MY_DBS_VOL01
cinder snapshot-create --force True --display-name dbs_vol1-snap001 $MY_DBS_VOL01
cinder snapshot-list
ls
vi 06_create_attached_cinderVol.sh 
export MY_DBS_VOL01_SNAP001=`cinder snapshot-show dbs_vol01-snap001|get_uuid`
echo ${MY_DBS_VOL01_SNAP001}
export MY_DBS_VOL01_SNAP001=`cinder snapshot-show dbs_vol1-snap001|get_uuid`
echo ${MY_DBS_VOL01_SNAP001}
vi 06_create_attached_cinderVol.sh 
cinder create --snapshot-id ${MY_DBS_VOL01_SNAP001} --display-name dbs_vol01_res --availability-zone az1 1
vi 06_create_attached_cinderVol.sh 
cinder list
vi 06_create_attached_cinderVol.sh 
cinder list
cinder snapshot-delete ${MY_DBS_VOL01_SNAP001}
vi 06_create_attached_cinderVol.sh 
cinder backup-create --display-name dbs_vol01_res-backup01 6211589d-bdd9-4253-bc22-b4e130d8a4df
cinder backup-list 
cinder backup-show 98ae575e-e91b-47fa-bf41-8da7458b0123
swift list volumebackups
vi 06_create_attached_cinderVol.sh 
swift list
swift list volumebackups
cinder create --display-name dbs_vol02 --availability-zone az1 1
cinder list
cinder backup-restore --volume-id d77ba89a-c651-4063-be59-9f15fc12a84d 6211589d-bdd9-4253-bc22-b4e130d8a4df
cinder backup-list 
cinder backup-restore --volume-id d77ba89a-c651-4063-be59-9f15fc12a84d 98ae575e-e91b-47fa-bf41-8da7458b0123
cinder list
vi 06_create_attached_cinderVol.sh 
ls
cat userdata_v2_web.txt
ls
cp ../chapter05-10/10/01_create_az2_servers.sh .
mv 01_create_az2_servers.sh 07_create_az2_servers.sh
vi 07_create_az2_servers.sh 
sh 07_create_az2_servers.sh 
ssh -i key-for-internal.pem root@192.168.0.20
ssh -i key-for-internal.pem root@192.168.0.21
ls
cat 04_create_lb_setting.sh 
neutron lb-member-create --address 192.168.0.21 --protocol-port 80 http-pool
ssh -i key-for-internal.pem root@192.168.0.21
ls
cat 06_create_attached_cinderVol.sh 
nova volume-attach az2-web d77ba89a-c651-4063-be59-9f15fc12a84d 
nova volume-detach az2-web d77ba89a-c651-4063-be59-9f15fc12a84d 
pwd
ls -ltr
cd
ls
cd virtualenv/
ls
useradd tomo
sudo tomo
sudo -u tomo -h
su tomo
exit
su tomo
ls
cp key-for-internal.pem /home/tomo/
su tomo
chown tomo. /home/tomo/key-for-internal.pem 
su tomo
cd /home/tomo
ls
cd venv/
ls
cd venv27/
ls
find . -name ansible.cfg
exit
ssh -i key-for-internal.pem root@192.168.0.13
exit
ls
cat openrc 
ls
source openrc 
pip freeze
pip freeze > /tmp/pip_root.txt
pip freeze
exit
ls
cat openrc 
cd batch/
ls
cat 01_create_network.sh 
cat 02_create_instances.sh 
cd ..
ls
cd batch
cd ..
exit
ls -ltr batch/
exit
cd /home/tomo
find . -name ansible.cfg
su tomo
useradd testuser
su testuser
cd /home/testuser/.ssh/
ssh-keygen -s id_rsa -I test-certificate -n root -V +4d id_rsa.pub 
exit
su testuser
ls
source openrc 
nova keypair-add --pub-key /home/testuser/.ssh/id_rsa.pub testkey2016-05-16
nova keypair-list 
nova keypair-list help
cd batch/
ls
cat 02_create_instances.sh 
vi testuserVM.sh
chmod 755 testuserVM.sh 
./testuserVM.sh 
exit
su testuser
ls
source openrc 
nova keypair-add --pub-key /home/testuser/.ssh/id_rsa-cert.pub testkey2016-05-16
nova keypair-delete testkey2016-05-16
nova keypair-list 
nova keypair-add --pub-key /home/testuser/.ssh/id_rsa-cert.pub testkey2016-05-16
nova keypair-list 
./testuserVM.sh 
cd batch/
./testuserVM.sh 
su testuser
su tomo
exit
su tomo
su testuser
ls -ltr /
cd
ls
pwd
su testuser
source openrc 
nova keypair-delete testkey2016-05-16
nova keypair-add --pub-key /home/testuser/.ssh/id_rsa.pub testkey2016-05-16
ls -ltr
cd batch/
ls -ltr
./testuserVM.sh 
exit
source openrc 
nova keypair-delete testkey2016-05-16
nova keypair-add --pub-key /home/testuser/.ssh/id_rsa-cert.pub testkey2016-05-16
nova keypair-list
cd /home/testuser/.ssh
ls -ltr
ls -ltr /home/testuser/.ssh/id_rsa-cert.pub
exit
cd /home/tomo
source opeAnsible 
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 -e username=testuser testkey_mgr.yml
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 -e username=testuser testkey_mgr.yml -vvvv
exit
ls -ltr /home/testuser/.ssh/id_rsa-cert.pub
cd /home
ls -ltr /home
cd
source openrc 
pip install jinja2 passlib pycrypto pyyaml
pip install ansible
ls -asl
mkdir log
 vi .ansible.cfg
ls -ltr key-for-internal.pem
cp /home/tomo/ansible_hosts .
cp /home/tomo/testkey_mgr.yml .
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 -e username=testuser testkey_mgr.yml
ls -asl
vi .ansible.cfg
cp /home/tomo/.ansible.cfg .
vi .ansible.cfg 
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 -e username=testuser testkey_mgr.yml
vi testkey_mgr.yml 
exit
su testuser
exit
su testuser
su tomo
exit
source openrc 
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 -e username=testuser testkey_mgr.yml
vi testkey_mgr.yml 
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 -e username=testuser testkey_mgr.yml
deactivate
su testuser
cd
vi testkey_mgr.yml 
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 -e username=testuser testkey_mgr.yml
sourcd openrc 
source openrc 
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 -e username=testuser testkey_mgr.yml
ssh -i /home/testuser/.ssh/id_rsa testuser@192.168.0.21
exit
ls 
ls
cat testkey_mgr.yml
exit
useradd test2
passwd test2
su test2
ls
source openrc 
vi testkey_mgr.yml 
rm -f testkey_mgr.retry
cp testkey_mgr.yml local_testkey_mgr.yml
vi local_testkey_mgr.yml
ansible-playbook -i ansible_hosts -u root  -e username=test3 local_testkey_mgr.yml 
vi local_testkey_mgr.yml
ansible-playbook -i ansible_hosts -u root  -e username=test3 local_testkey_mgr.yml 
vi local_testkey_mgr.yml
ansible-playbook -i ansible_hosts -u root  -e username=test3 local_testkey_mgr.yml 
ls -ltr /home/test2/.ssh/
vi local_testkey_mgr.yml
ls -ltr
exit
source openrc 
neutron security-group-list
cd /home/tomo
ls
cat testkey_mgr.yml
ls
ls -ltr
cd
ls
cls -ltr
ls -ltr
cat local_testkey_mgr.yml
exit
source openrc 
nova boot help --hint
nova help boot --hint
nova boot help
nova boot help --hint
ls
cat batch/02_create_instances.sh 
nova boot standard.xsmall help --hint
nova boot --flavor standard.xsmall --image tekitou help --hint
nova boot --flavor standard.xsmall --image=tekitou help --hint
exit
source openrc 
nova list
su tomo
ls
cd batch/
ls
cat 01_create_network.sh 
cat 02_create_instances.sh 
cat openrc 
cat 02_create_instances.sh 
cat userdata_app.txt
ls
exit
