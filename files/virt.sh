#! /bin/sh

osinfo-query os

#TODO: 重复执行时需要判断是否已创建；
virsh list --all --name


virt-install \
    --name 01_router \
    --vcpus 1 --memory 1024 \
    --cdrom={{ gen8_opnsense_iso }} \
    --disk path=/var/lib/libvirt/images/01_router.qcow2,size=10  \
    --os-variant freebsd10.3 \
    --network bridge=br0,model=virtio \
    --network bridge=br1,model=virtio \
    --graphics vnc,listen=0.0.0.0,password=KeyTone123,port=5901 \
    --noautoconsole \
    --security type=none \
    --virt-type kvm \
    --hvm

echo "01_router VNC `virsh vncdisplay 01_router`"
virsh domiflist 01_router


virt-install \
    --name 02_portal \
    --vcpus 1 --memory 2048 \
    --cdrom={{ gen8_centos_iso }} \
    --disk path=/var/lib/libvirt/images/02_portal.qcow2,size=30  \
    --os-variant rhel7.3 \
    --network bridge=br1,model=virtio \
    --graphics vnc,listen=0.0.0.0,password=KeyTone123,port=5902 \
    --noautoconsole \
    --security type=none \
    --virt-type kvm \
    --hvm

echo "02_portal VNC `virsh vncdisplay 02_portal`"


virt-install \
    --name 03_htpc \
    --vcpus 1 --memory 1024 \
    --cdrom={{ gen8_ubuntu_iso }} \
    --disk path=/var/lib/libvirt/images/03_htpc.qcow2,size=20  \
    --os-variant ubuntu14.04 \
    --network bridge=br1,model=virtio \
    --graphics vnc,listen=0.0.0.0,password=KeyTone123,port=5903 \
    --noautoconsole \
    --security type=none \
    --virt-type kvm \
    --hvm

echo "03_htpc VNC `virsh vncdisplay 03_htpc`"


virsh list --all
