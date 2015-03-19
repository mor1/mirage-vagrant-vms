#!/bin/sh

set -ex

sudo apt-get install -y dnsmasq avahi-daemon # networking

cat <<EOF
interface=br0
dhcp-range=192.168.56.150,192.168.56.200,1h
EOF >> /etc/dnsmasq.conf
