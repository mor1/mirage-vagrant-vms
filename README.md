packer-xenserver
================

PackerFile for creating a XenServer basebox for usage with Vagrant.

The box has two interfaces:

NAT Interface - This supplies internet to the virtual machine and allows vagrant to interact with the virtual machine.

Host-Only Interface - This is used to for the management interface. This interface is given a static IP address of `192.168.56.10`

