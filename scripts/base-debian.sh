#!/bin/sh

set -ex

BACKPORTS=http://http.us.debian.org/debian
MIRROR=ftp.uk.debian.org

## backports good -- git 1.8 please
grep wheezy-backports /etc/apt/sources.list ||
    (echo "deb $BACKPORTS wheezy-backports main" >> /etc/apt/sources.list)
sed -i "s/http.us.debian.org/$MIRROR/g" /etc/apt/sources.list
apt-get update
apt-get -y -t wheezy-backports install "git"

# echo 'vagrant ALL=NOPASSWD:ALL' > /etc/sudoers.d/vagrant
# echo 'UseDNS no' >> /etc/ssh/sshd_config

# Remove 5s grub timeout to speed up booting
cat <<EOF > /etc/default/grub
# If you change this file, run 'update-grub' afterwards to update
# /boot/grub/grub.cfg.

GRUB_DEFAULT=0
GRUB_TIMEOUT=0
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT="quiet"
GRUB_CMDLINE_LINUX="debian-installer=en_US"
EOF

update-grub
