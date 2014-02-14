#!/usr/bin/env bash

set -ex

apt-get install -y build-essential m4 git                    # build tools
apt-get install -y xen-tools                                 # xen client tools
apt-get install -y ocaml ocaml-native-compilers camlp4-extra # ocaml
apt-get install -y aspcud                                    # opam solver

## virtualbox guest additions

# apt-get install -y module-assistant || true
# m-a prepare
# autopoint debhelper gettext html2text intltool-debian kbuild libcroco3 libgettextpo0 libmail-sendmail-perl libsys-hostname-long-perl libunistring0 po-debconf virtualbox-source
# sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" >> /etc/apt/sources.list'
# $ wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
# $ sudo apt-get update
# $ sudo apt-get install virtualbox-4.3

# apt-get install -y virtualbox-guest-dkms

# mount /media/cdrom
# sh /media/cdrom/VBoxLinuxAdditions.run
