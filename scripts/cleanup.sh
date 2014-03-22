cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-eth0
DEVICE=eth0
BOOTPROTO=dhcp
ONBOOT=yes
EOF

xe host-management-disable
managementuuid=`xe pif-list --minimal`
xe pif-forget uuid=$managementuuid

ifconfig eth0 up
dhclient eth0