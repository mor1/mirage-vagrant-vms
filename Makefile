box-%:
	packer build $*/template.json
	vagrant box add -f $*-xen boxes/$*-amd64.box

# vagrant:
# 	ln -sf Vagrantfile.ubuntu-14.04-xen Vagrantfile
# 	vagrant provision

# boot:
# 	vagrant up
