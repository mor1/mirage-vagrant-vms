#!/bin/sh
#
# Copyright (c) 2015 Richard Mortier <mort@cantab.net>
#
# Permission to use, copy, modify, and distribute this software for any purpose
# with or without fee is hereby granted, provided that the above copyright
# notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.
#

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
