# Vagrant specific
date > /etc/vagrant_box_build_time

# Create vagrant user
useradd -G wheel --create-home -s /bin/bash vagrant

# Installing vagrant keys
mkdir -pm 700 /home/vagrant/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh

# Grant sudo rights
echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
sed -i -e "s/Defaults    requiretty/#Defaults    requiretty/g" /etc/sudoers

# Set password
echo 'vagrant:vagrant' | chpasswd

# Setup security groups
sed -i -e 's/net.bridge.bridge-nf-call-iptables = 0/net.bridge.bridge-nf-call-iptables = 1/g' /etc/sysctl.conf
sed -i -e 's/net.bridge.bridge-nf-call-arptables = 0/net.bridge.bridge-nf-call-arptables = 1/g' /etc/sysctl.conf

# Lower dom0_mem
/opt/xensource/libexec/xen-cmdline --set-xen dom0_mem=400M,max:400M
