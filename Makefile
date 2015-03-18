box:
	packer build templates/ubuntu-14.04-amd64.json

vagrant:
	ln -sf Vagrantfile.ubuntu-14.04-xen Vagrantfile
	vagrant provision

boot:
	vagrant up
