cd
ls
exit
cd
pwd
ls
pwd
mkdir venv
cd venv/
virtualenv -p /opt/local/bin/python2.7 venv27
ls
cd
ls
. venv/venv27/bin/activate
pip install jinja2 passlib pycrypto pyyaml
pip install ansible
pwd
vi opeAnsible
ls /home/tomo/venv/venv27/bin/activate
ls -ltr /home/tomo/venv/venv27/bin/activate
mkdir log
vi .ansible.cfg
echo "localhost ansible_connection=local" >ansible_hosts
ansible all -i ansible_hosts -m ping
ansible all -i ansible_hosts -m ping -u root
exit
ls
cd
ls
ls -ltr
sudo chown tomo. key-for-internal.pem 
exit
ls
cd
ls -ltr
source opeAnsible 
vi ansible_hosts
vi .ansible.cfg 
ls
vi .ansible.cfg 
ansible all -i ansible_hosts -m ping -u root
ansible all -i ansible_hosts -m ping -u tomo
history
cat .ansible.cfg 
cat ansible_hosts 
ansible all -i ansible_hosts -m ping -u root
ansible all -i ansible_hosts -m ping -u tomo
exit
cd
ls
source opeAnsible 
cat .ansible.cfg 
pwd
ls
vi sample-11-1.yml
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.10 sample-11-1.yml 
vi sample-11-1.yml
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.10 sample-11-1.yml 
cat ansible_hosts 
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 sample-11-1.yml 
vi sample-11-1.yml
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 sample-11-1.yml 
echo $?
vi sample-11-1.yml
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 sample-11-1.yml 
cp sample-11-1.yml sample-11-2.yml
vi sample-11-2.yml 
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 sample-11-2.yml 
vi sample-11-2.yml 
ssh -i key-for-internal.pem root@192.168.0.21
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 sample-11-2.yml 
vi sample-11-2-1.yml 
rm sample-11-2-1.yml
ls -ltr
vi sample-11-2.yml 
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 sample-11-2.yml 
vi sample-11-2.yml 
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 sample-11-2.yml 
vi sample-11-2.yml 
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 sample-11-2.yml 
vi sample-11-2.yml 
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 sample-11-2.yml 
vi sample-11-2.yml 
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 sample-11-2.yml 
vi sample-11-2.yml 
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 sample-11-2.yml 
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 sample-11-2.yml -vvvv
vi sample-11-2.yml 
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 sample-11-2.yml
vi sample-11-2.yml 
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 sample-11-2.yml
vi sample-11-2.yml 
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 sample-11-2.yml
ansible-playbook -vvv -i ansible_hosts -u root -e target=192.168.0.21 sample-11-2.yml
ssh -i root@192.168.0.21
ssh -i key-for-internal.pem root@192.168.0.21
ansible-playbook -vvv -i ansible_hosts -u root -e target=192.168.0.21 sample-11-2.yml
ssh -i key-for-internal.pem root@192.168.0.21
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 sample-11-2.yml
ssh -i key-for-internal.pem root@192.168.0.21
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 sample-11-2.yml
ssh -i key-for-internal.pem root@192.168.0.21
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 sample-11-2.yml
cp sample-11-2.yml sample-11-3.yml
vi sample-11-3.yml 
ls -asl
cd .ssh
ls -asl
vi sample-11-3.yml 
cd ..
vi sample-11-3.yml 
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 -e username=admin sample-11-3.yml 
ssh ansible@192.168.0.21
ssh -i key-for-internal.pem root@192.168.0.21
ssh ansible@192.168.0.21
ssh -i key-for-internal.pem ansible@192.168.0.21
vi sample-11-3.yml 
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 -e username=admin sample-11-3.yml 
ssh -i key-for-internal.pem root@192.168.0.21
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 -e username=xyz sample-11-3.yml 
ssh -i key-for-internal.pem root@192.168.0.21
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 sample-11-3.yml 
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 -e username=xyz sample-11-3.yml 
vi sample-11-3.yml 
ssh -i key-for-internal.pem root@192.168.0.21
cat sample-11-3.yml 
ssh -i key-for-internal.pem root@192.168.0.21
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 sample-11-3.yml 
ssh -i key-for-internal.pem root@192.168.0.21
cp sample-11-3.yml  sample-11-4.yml
cat sample-11-3.retry 
vi sample-11-4.yml
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 sample-11-4.yml 
ssh -i key-for-internal.pem root@192.168.0.21
vi sample-11-4.yml
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 sample-11-4.yml 
ssh -i key-for-internal.pem root@192.168.0.21
ls
ls -ltr
cp sample-11-4.yml sample-11-5.yml
vi sample-11-5.yml 
vi my.cfn.j2
cat my.cfn.j2 
vi ansible_hosts 
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.13 sample-11-5.yml 
vi sample-11-5.yml 
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.13 sample-11-5.yml 
pwd
ls -ltr /home/tomo/my.cnf.j2
ls -ltr
ls my.cnf.j2
mv my.cfn.j2 my.cnf.j2
ls -ltr /home/tomo/my.cnf.j2
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.13 sample-11-5.yml 
cp sample-11-5.yml sample-11-6.yml
vi sample-11-6.yml
cat ansible_hosts 
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 sample-11-6.yml 
vi sample-11-6.yml
ping 192.168.0.21
pip freez
pip freeze
pip freeze > /tmp/pip_tomo.txt
pip install python-ceilometerclient==1.1.2
pip install python-cinderclient==1.1.3
pip install python-glanceclient==0.17.3
pip install python-heatclient==0.4.0
pip install python-keystoneclient==1.3.4
pip freeze
pip install python-neutronclient==2.4.0
pip install python-novaclient==2.23.3
pip install python-openstackclient==1.0.5
pip install python-saharaclient==0.8.0
pip install python-swiftclient==2.4.0
pip install python-troveclient==1.0.9
env | grep OS_
ls -ltr
vi opeAnsible 
exit
cd
ls
source opeAnsible 
cat opeAnsible 
echo $OS_DMZ_NET
echo $OS_AUTH_URL
ssh-keygen -t rsa -b 2048 -N ""
echo $HOME
nova keypair-add --pub-key $HOME/.ssh/id_rsa.pub key-for-ansible
nova keypair-list
ls -ltr
pwd
git clone https://github.com/josug-book1-materials/chapter11.git
cp chapter11/playbooks/book1/create_sample_vm.yml .
ls -ltr
cat create_sample_vm.yml 
pip which python
which python
ls -ltr ~/venv/venv27/bin/python
ls -ltr ~/venv/venv27/bin/
ls -ltr ~/venv/venv27/
ls -ltr ~/venv/venv27/include/
which python
deactive
deactivate
source opeAnsible 
deactivate 
source opeAnsible 
ls
grep when *.yml
vi sample-11-2.yml
history|grep sample-11-2.yml
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 sample-11-2.yml
vi sample-11-2.yml
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 sample-11-2.yml
ansible-playbook -i ansible_hosts -e target=web create_sample_vm.yml 
vi create_sample_vm.yml 
nova boot --host --help
nova help host
ansible-playbook -i ansible_hosts -e target=web create_sample_vm.yml 
vi create_sample_vm.yml 
ansible-playbook -i ansible_hosts -e target=web create_sample_vm.yml 
pip freez
pip freeze
vi create_sample_vm.yml 
ansible-playbook -i ansible_hosts -e target=web create_sample_vm.yml 
vi create_sample_vm.yml 
ansible-playbook -i ansible_hosts -e target=web create_sample_vm.yml 
vi create_sample_vm.yml 
ansible-playbook -i ansible_hosts -e target=web create_sample_vm.yml 
vi create_sample_vm.yml 
pip freeze
ls
cat sample-11-2.yml
cat sample-11-1.yml 
cat sample-11-3.yml 
cp sample-11-3.yml testkey_mgr.yml 
vi testkey_mgr.yml 
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 -e username=tako testkey_mgr.yml 
ssh -i key-for-internal.pem root@192.168.0.21
nova keypair-show
nova help keypair-show
nova keypair-list
nova keypair-show key-for-ansible
nova keypair-show --limit key-for-ansible
nova keypair-show --limit 
nova keypair-list
exit
cd
ls
source opeAnsible 
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.23 -e username=testuser testkey_mgr.yml 
vi ansible_hosts 
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.23 -e username=testuser testkey_mgr.yml 
vi ansible_hosts 
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.29 -e username=testuser testkey_mgr.yml 
vi ansible_hosts 
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.29 -e username=testuser testkey_mgr.yml 
exit
ls
cd
ls
source opeAnsible 
vi testkey_mgr.yml
cat ansible_hosts 
vi testkey_mgr.yml
cat sample-11-2.yml
vi testkey_mgr.yml
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 -e username=testuser testkey_mgr.yml 
vi testkey_mgr.yml
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 -e username=testuser testkey_mgr.yml 
vi testkey_mgr.yml
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 -e username=testuser testkey_mgr.yml 
ls -ltr /home/testuser/.ssh/id_rsa-cert.pub
vi testkey_mgr.yml
ls -ltr /home/testuser/.ssh/id_rsa-cert.pub
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 -e username=testuser testkey_mgr.yml 
vi testkey_mgr.yml
ls -ltr /home/testuser/
vi testkey_mgr.yml
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 -e username=testuser testkey_mgr.yml 
vi testkey_mgr.yml
ansible-playbook -i ansible_hosts -u root -e target=192.168.0.21 -e username=testuser testkey_mgr.yml 
vi testkey_mgr.yml
ls -asl
exit
cd tomo
ls
cd
ls
exit
