#!/bin/sh

set -ex

if [ -f .vbox_version ] ; then
  # remove old VirtualBox support if installed
  if [ -f /etc/init.d/virtualbox-ose-guest-utils ] ; then
    /etc/init.d/virtualbox-ose-guest-utils stop
  fi

  rmmod vboxguest || true
  aptitude -y purge                             \
           virtualbox-ose-guest-x11             \
           virtualbox-ose-guest-dkms            \
           virtualbox-ose-guest-utils

  apt-get install -y dkms                                # for dynamic compiles
  apt-get -y install --no-install-recommends libdbus-1-3 # reqd for autostart

  # Install the VirtualBox guest additions
  mount -o loop VBoxGuestAdditions.iso /mnt
  ( yes | sh /mnt/VBoxLinuxAdditions.run ) || true
  umount /mnt
  rm -f VBoxGuestAdditions.iso

  # Start the newly build driver
  /etc/init.d/vboxadd start
fi
