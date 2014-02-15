# -*- mode: ruby -*-
#
# Copyright (c) 2014 Richard Mortier <mort@cantab.net>
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

# Based off auto-generated Vagrantfile. Uses my mort.io IP address, shares my
# host OSX home directory with the VM via NFS, configure the VM with a
# sensible default RAM, and provision it via scripts if required.

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "debian-7.4.0-xen"
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :private_network, ip: "46.43.42.137"

  config.vm.synced_folder "/Users/mort", "/mort", type: "nfs"
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provider :virtualbox do |vb|
    # vb.gui = true # uncomment to observe boot via Virtualbox GUI
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.provision "shell", path: "./provisioning/hostname.sh"
  config.vm.provision "shell", path: "./provisioning/packages.sh"
  config.vm.provision "shell", path: "./provisioning/opam.sh"
  config.vm.provision "shell", path: "./provisioning/mort.sh"
  config.vm.provision "shell", path: "./provisioning/finish.sh"

end
