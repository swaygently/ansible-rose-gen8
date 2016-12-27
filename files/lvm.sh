#! /bin/sh

VG_NAME=data1

pvcreate /dev/sdc1
pvscan
pvdisplay /dev/sdc1

vgcreate -s 16M ${VG_NAME} /dev/sdc1
vgscan
vgdisplay ${VG_NAME}

lvcreate -L 10G -n gitlab ${VG_NAME}
lvscan
lvdisplay /dev/${VG_NAME}/gitlab

mkfs.xfs /dev/${VG_NAME}/gitlab

# TODO: /etc/fstab
mkdir /srv/gitlab
mount /dev/${VG_NAME}/gitlab /srv/gitlab
