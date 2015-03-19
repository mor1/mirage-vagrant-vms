#!/bin/sh

apt-get install -y xen-hypervisor-4.4-amd64 bridge-utils xen-tools

dpkg-divert --divert /etc/grub.d/08_linux_xen --rename /etc/grub.d/20_linux_xen

update-grub

echo >> /etc/network/interfaces <<EOF
auto xenbr0
iface xenbr0 inet dhcp
  bridge_ports eth0
EOF
