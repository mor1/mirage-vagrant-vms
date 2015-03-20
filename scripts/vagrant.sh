#!/bin/sh

set -ex

date > /etc/vagrant_box_build_time

useradd -G sudo --create-home -s /bin/bash vagrant || true
useradd -G wheel --create-home -s /bin/bash vagrant

mkdir -pm 700 /home/vagrant/.ssh
wget --no-check-certificate                                             \
     'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' \
     -O /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh

echo 'vagrant:vagrant' | chpasswd
echo 'UseDNS no' >> /etc/ssh/sshd_config
echo "vagrant ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
sed -i -e "s/Defaults    requiretty/#Defaults    requiretty/g" /etc/sudoers

mkdir -p /vagrant || true

echo 'Welcome to your Vagrant-built virtual machine.' > /var/run/motd || true

apt-get -y install nfs-common nfs-kernel-server

## XenServer specifics
sed -i -e 's/net.bridge.bridge-nf-call-iptables = 0/net.bridge.bridge-nf-call-iptables = 1/g' /etc/sysctl.conf || true
sed -i -e 's/net.bridge.bridge-nf-call-arptables = 0/net.bridge.bridge-nf-call-arptables = 1/g' /etc/sysctl.conf || true
/opt/xensource/libexec/xen-cmdline --set-xen dom0_mem=400M,max:400M || true
