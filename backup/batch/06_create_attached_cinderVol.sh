#!/bin/sh

cinder create --display-name dbs_vol01 --availability-zone az1 1
cinder list

function get_uuid () { cat - | grep " id " | awk '{print $4}'; }
export MY_DBS_VOL01=`cinder show dbs_vol01 | get_uuid`
echo ${MY_DBS_VOL01}
nova volume-attach dbs01 $MY_DBS_VOL01


#ボリュームをアタッチしたdbs01での作業
  lsblk コマンドでの確認
  lsblk /dev/vdc　コマンドでの確認
  fdisk /dev/sdc
  mkfs.ext4 -L mysql_data /dev/vdc
  tune2fs -c 0 -i 0 -r 0 /dev/vdc1
  mkdir /tmp/data
  mount LABEL=mysql_data /tmp/data
  chown -R mysql:mysql /tmp/data
  service mysqld stop
  mv /var/lib/mysql/* /tmp/data/
  ls -lF /tmp/data
  umount /tmp/data
  echo "LABEL=mysql_data /var/lib/mysql ext4 defaults,noatime 0 2" >> /etc/fstab
  mount /var/lib/mysql
  df -h /var/lib/mysql
  service mysqld start

############################################################################

#スナップショットは本来静止点を作る為サービスの停止->ボリュームの切断(nova volume-detach dbs01 $MY_DBS_VOL01 でin-use->detaching->available)
してから取得するのが本筋だが、今回は誰も使っていないので--force オプションを使って取得

cinder snapshot-create --force --display-name dbs_vol01-snap001 $MY_DBS_VOL01

#上記で取得したスナップショットを元に新規ボリュームを作成
export MY_DBS_VOL01_SNAP001=`cinder snapshot-show dbs_vol01-snap001|get_uuid`

echo ${MY_DBS_VOL01_SNAP001}

cinder create --snapshot-id ${MY_DBS_VOL01_SNAP001} --display-name dbs_vol01_res --availability-zone az1 1

#スナップショットから作成されたボリュームなのでオリジナルと同じラベル名（mysql_data）を持っているので
OS再起動を行う際には必ずどちらかのボリュームをデタッチしておくことまた一時的に切り替えるのであれば
service mysqld stop && umount /var/lib/mysql
mount /dev/vdd1 /varlib/mysql && service mysqld start
の様にunmountした後ラベル名を使わないでmountすること

#スナップショット削除
cinder snapshot-delete ${MY_DBS_VOL01_SNAP001}

############################################################################
#ボリュームバックアップ：処理時間は長いけどSwiftにデータ保管されるのでデータの安全性は高くなる
実際には停止時間を短縮したいのでスナップショット->ボリューム作成->ボリュームバックアップ（Swiftへの転送だけできないか？）

(venv27) [root@step-server batch]# cinder list
+--------------------------------------+-----------+---------------+------+-------------+----------+--------------------------------------+
|                  ID                  |   Status  |  Display Name | Size | Volume Type | Bootable |             Attached to              |
+--------------------------------------+-----------+---------------+------+-------------+----------+--------------------------------------+
| 5829b1b3-e159-4b9d-b967-0df7cb878d88 |   in-use  |   dbs_vol01   |  1   |     None    |  false   | 1eccf954-f23c-435e-956d-d8995bce4863 |
| 6211589d-bdd9-4253-bc22-b4e130d8a4df | available | dbs_vol01_res |  1   |     None    |  false   |                                      |
+--------------------------------------+-----------+---------------+------+-------------+----------+--------------------------------------+
dbs_vol01_resのIDを使ってボリュームバックアップ作成
(venv27) [root@step-server batch]# cinder backup-create --display-name dbs_vol01_res-backup01 6211589d-bdd9-4253-bc22-b4e130d8a4df
+-----------+--------------------------------------+
|  Property |                Value                 |
+-----------+--------------------------------------+
|     id    | 98ae575e-e91b-47fa-bf41-8da7458b0123 |
|    name   |        dbs_vol01_res-backup01        |
| volume_id | 6211589d-bdd9-4253-bc22-b4e130d8a4df |
+-----------+--------------------------------------+
(venv27) [root@step-server batch]# cinder backup-list
+--------------------------------------+--------------------------------------+-----------+------------------------+------+--------------+---------------+
|                  ID                  |              Volume ID               |   Status  |          Name          | Size | Object Count |   Container   |
+--------------------------------------+--------------------------------------+-----------+------------------------+------+--------------+---------------+
| 98ae575e-e91b-47fa-bf41-8da7458b0123 | 6211589d-bdd9-4253-bc22-b4e130d8a4df | available | dbs_vol01_res-backup01 |  1   |      22      | volumebackups |
+--------------------------------------+--------------------------------------+-----------+------------------------+------+--------------+---------------+
(venv27) [root@step-server batch]# cinder backup-show 98ae575e-e91b-47fa-bf41-8da7458b0123
+-------------------+--------------------------------------+
|      Property     |                Value                 |
+-------------------+--------------------------------------+
| availability_zone |                 az1                  |
|     container     |            volumebackups             |
|     created_at    |      2016-05-11T07:40:48.000000      |
|    description    |                 None                 |
|    fail_reason    |                 None                 |
|         id        | 98ae575e-e91b-47fa-bf41-8da7458b0123 |
|        name       |        dbs_vol01_res-backup01        |
|    object_count   |                  22                  |
|        size       |                  1                   |
|       status      |              available               |
|     volume_id     | 6211589d-bdd9-4253-bc22-b4e130d8a4df |
+-------------------+--------------------------------------+
上記container部からSwift上のvolumebackupsに分割格納されていることがわかる
(venv27) [root@step-server batch]# swift list volumebackups
volume_6211589d-bdd9-4253-bc22-b4e130d8a4df/20160511074049/az_az1_backup_98ae575e-e91b-47fa-bf41-8da7458b0123-00001
volume_6211589d-bdd9-4253-bc22-b4e130d8a4df/20160511074049/az_az1_backup_98ae575e-e91b-47fa-bf41-8da7458b0123-00002
volume_6211589d-bdd9-4253-bc22-b4e130d8a4df/20160511074049/az_az1_backup_98ae575e-e91b-47fa-bf41-8da7458b0123-00003
volume_6211589d-bdd9-4253-bc22-b4e130d8a4df/20160511074049/az_az1_backup_98ae575e-e91b-47fa-bf41-8da7458b0123-00004
volume_6211589d-bdd9-4253-bc22-b4e130d8a4df/20160511074049/az_az1_backup_98ae575e-e91b-47fa-bf41-8da7458b0123-00005
volume_6211589d-bdd9-4253-bc22-b4e130d8a4df/20160511074049/az_az1_backup_98ae575e-e91b-47fa-bf41-8da7458b0123-00006
volume_6211589d-bdd9-4253-bc22-b4e130d8a4df/20160511074049/az_az1_backup_98ae575e-e91b-47fa-bf41-8da7458b0123-00007
volume_6211589d-bdd9-4253-bc22-b4e130d8a4df/20160511074049/az_az1_backup_98ae575e-e91b-47fa-bf41-8da7458b0123-00008
volume_6211589d-bdd9-4253-bc22-b4e130d8a4df/20160511074049/az_az1_backup_98ae575e-e91b-47fa-bf41-8da7458b0123-00009
volume_6211589d-bdd9-4253-bc22-b4e130d8a4df/20160511074049/az_az1_backup_98ae575e-e91b-47fa-bf41-8da7458b0123-00010
volume_6211589d-bdd9-4253-bc22-b4e130d8a4df/20160511074049/az_az1_backup_98ae575e-e91b-47fa-bf41-8da7458b0123-00011
volume_6211589d-bdd9-4253-bc22-b4e130d8a4df/20160511074049/az_az1_backup_98ae575e-e91b-47fa-bf41-8da7458b0123-00012
volume_6211589d-bdd9-4253-bc22-b4e130d8a4df/20160511074049/az_az1_backup_98ae575e-e91b-47fa-bf41-8da7458b0123-00013
volume_6211589d-bdd9-4253-bc22-b4e130d8a4df/20160511074049/az_az1_backup_98ae575e-e91b-47fa-bf41-8da7458b0123-00014
volume_6211589d-bdd9-4253-bc22-b4e130d8a4df/20160511074049/az_az1_backup_98ae575e-e91b-47fa-bf41-8da7458b0123-00015
volume_6211589d-bdd9-4253-bc22-b4e130d8a4df/20160511074049/az_az1_backup_98ae575e-e91b-47fa-bf41-8da7458b0123-00016
volume_6211589d-bdd9-4253-bc22-b4e130d8a4df/20160511074049/az_az1_backup_98ae575e-e91b-47fa-bf41-8da7458b0123-00017
volume_6211589d-bdd9-4253-bc22-b4e130d8a4df/20160511074049/az_az1_backup_98ae575e-e91b-47fa-bf41-8da7458b0123-00018
volume_6211589d-bdd9-4253-bc22-b4e130d8a4df/20160511074049/az_az1_backup_98ae575e-e91b-47fa-bf41-8da7458b0123-00019
volume_6211589d-bdd9-4253-bc22-b4e130d8a4df/20160511074049/az_az1_backup_98ae575e-e91b-47fa-bf41-8da7458b0123-00020
volume_6211589d-bdd9-4253-bc22-b4e130d8a4df/20160511074049/az_az1_backup_98ae575e-e91b-47fa-bf41-8da7458b0123-00021
volume_6211589d-bdd9-4253-bc22-b4e130d8a4df/20160511074049/az_az1_backup_98ae575e-e91b-47fa-bf41-8da7458b0123_metadata
volume_6211589d-bdd9-4253-bc22-b4e130d8a4df/20160511074049/az_az1_backup_98ae575e-e91b-47fa-bf41-8da7458b0123_sha256file
(venv27) [root@step-server batch]#

#####################################################################################
#新規ボリュームへのリストア

(venv27) [root@step-server batch]# cinder create --display-name dbs_vol02 --availability-zone az1 1
+---------------------+--------------------------------------+
|       Property      |                Value                 |
+---------------------+--------------------------------------+
|     attachments     |                  []                  |
|  availability_zone  |                 az1                  |
|       bootable      |                false                 |
|      created_at     |      2016-05-11T07:59:52.038190      |
| display_description |                 None                 |
|     display_name    |              dbs_vol02               |
|      encrypted      |                False                 |
|          id         | d77ba89a-c651-4063-be59-9f15fc12a84d |
|       metadata      |                  {}                  |
|     multiattach     |                false                 |
|         size        |                  1                   |
|     snapshot_id     |                 None                 |
|     source_volid    |                 None                 |
|        status       |               creating               |
|     volume_type     |                 None                 |
+---------------------+--------------------------------------+
(venv27) [root@step-server batch]# cinder list
+--------------------------------------+-----------+---------------+------+-------------+----------+--------------------------------------+
|                  ID                  |   Status  |  Display Name | Size | Volume Type | Bootable |             Attached to              |
+--------------------------------------+-----------+---------------+------+-------------+----------+--------------------------------------+
| 5829b1b3-e159-4b9d-b967-0df7cb878d88 |   in-use  |   dbs_vol01   |  1   |     None    |  false   | 1eccf954-f23c-435e-956d-d8995bce4863 |
| 6211589d-bdd9-4253-bc22-b4e130d8a4df | available | dbs_vol01_res |  1   |     None    |  false   |                                      |
| d77ba89a-c651-4063-be59-9f15fc12a84d | available |   dbs_vol02   |  1   |     None    |  false   |                                      |
+--------------------------------------+-----------+---------------+------+-------------+----------+--------------------------------------+
(venv27) [root@step-server batch]#
(venv27) [root@step-server batch]# cinder backup-list
+--------------------------------------+--------------------------------------+-----------+------------------------+------+--------------+---------------+
|                  ID                  |              Volume ID               |   Status  |          Name          | Size | Object Count |   Container   |
+--------------------------------------+--------------------------------------+-----------+------------------------+------+--------------+---------------+
| 98ae575e-e91b-47fa-bf41-8da7458b0123 | 6211589d-bdd9-4253-bc22-b4e130d8a4df | available | dbs_vol01_res-backup01 |  1   |      22      | volumebackups |
+--------------------------------------+--------------------------------------+-----------+------------------------+------+--------------+---------------+
(venv27) [root@step-server batch]# cinder backup-restore --volume-id d77ba89a-c651-4063-be59-9f15fc12a84d 98ae575e-e91b-47fa-bf41-8da7458b0123
(venv27) [root@step-server batch]# cinder list
+--------------------------------------+------------------+---------------+------+-------------+----------+--------------------------------------+
|                  ID                  |      Status      |  Display Name | Size | Volume Type | Bootable |             Attached to              |
+--------------------------------------+------------------+---------------+------+-------------+----------+--------------------------------------+
| 5829b1b3-e159-4b9d-b967-0df7cb878d88 |      in-use      |   dbs_vol01   |  1   |     None    |  false   | 1eccf954-f23c-435e-956d-d8995bce4863 |
| 6211589d-bdd9-4253-bc22-b4e130d8a4df |    available     | dbs_vol01_res |  1   |     None    |  false   |                                      |
| d77ba89a-c651-4063-be59-9f15fc12a84d | restoring-backup |   dbs_vol02   |  1   |     None    |  false   |                                      |
+--------------------------------------+------------------+---------------+------+-------------+----------+--------------------------------------+

(venv27) [root@step-server batch]# cinder list
+--------------------------------------+-----------+---------------+------+-------------+----------+--------------------------------------+
|                  ID                  |   Status  |  Display Name | Size | Volume Type | Bootable |             Attached to              |
+--------------------------------------+-----------+---------------+------+-------------+----------+--------------------------------------+
| 5829b1b3-e159-4b9d-b967-0df7cb878d88 |   in-use  |   dbs_vol01   |  1   |     None    |  false   | 1eccf954-f23c-435e-956d-d8995bce4863 |
| 6211589d-bdd9-4253-bc22-b4e130d8a4df | available | dbs_vol01_res |  1   |     None    |  false   |                                      |
| d77ba89a-c651-4063-be59-9f15fc12a84d | available |   dbs_vol02   |  1   |     None    |  false   |                                      |
+--------------------------------------+-----------+---------------+------+-------------+----------+--------------------------------------+
(venv27) [root@step-server batch]#
#######################################################################################













