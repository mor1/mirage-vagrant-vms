#!/bin/sh

# Update the box
apt-get -y update
apt-get -y upgrade
apt-get -y install linux-headers-$(uname -r)

# sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=sudo' /etc/sudoers
# sed -i -e 's/%sudo  ALL=(ALL:ALL) ALL/%sudo  ALL=NOPASSWD:ALL/g' /etc/sudoers
# echo "UseDNS no" >> /etc/ssh/sshd_config

# Install dependencies
apt-get -y install dkms
apt-get -y install nfs-common
