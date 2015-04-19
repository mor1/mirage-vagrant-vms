#!/bin/sh

set -ex

apt-get -y autoremove
apt-get -y clean

rm -f /var/lib/dhcp/*           # clean up dhcp leases
rm -f ~vagrant/*.sh             # clean up leftover scripts
reboot
