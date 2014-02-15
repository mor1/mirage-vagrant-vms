# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "debian-7.4.0-xen"
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :private_network, ip: "46.43.42.137"

  config.vm.synced_folder "/Users/mort", "/mort", type: "nfs"
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provider :virtualbox do |vb|
    # vb.gui = true
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.provision "shell", path: "./provisioning/packages.sh"
  config.vm.provision "shell", path: "./provisioning/opam.sh"
  config.vm.provision "shell", path: "./provisioning/mort.sh"
end
