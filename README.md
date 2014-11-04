# Mirage Virtualbox VMs via Vagrant

## Installing Vagrant

First, install [Vagrant][]. On OSX I use [homebrew][] so I do this as follows:

    $ brew tap phinze/cask
    $ brew install brew-cask
    $ brew cask install vagrant
    $ vagrant --version
    Vagrant 1.4.3

[homebrew]: http://brew.sh/
[vagrant]: http://vagrantup.com/

## Installing packer

Download the [appropriate package](http://www.packer.io/downloads.html) and
install it.

## Before building the VM

Create a directory that will be shared between the host and guest systems.

    mkdir /tmp/mirage-vagrant-vms

On the guest system this will be shared as `/host`.
To use a different directory for host/guest/both, then modify
`Vagrantfile.template`.

## Building the VM

    $ packer build template.json
    $ vagrant box add debian-7.5.0-xen.box --name debian-7.5.0-xen
    $ vagrant init debian-7.5.0-xen

The last command will generate a file called `Vagrantfile`.
Finally, bring up a VM from the box and login; the first time this creates lots
of output as the VM is created, initialised and provisioned. Administrator
privilege is required to create the NFS mounts on the host so that the host
filesystem can be shared with dom0 in the VM (the VirtualBox guest additions do
not work with dom0).

    $ vagrant up
    ...
    $ vagrant ssh
    Linux wheezy-xen 3.2.0-4-amd64 #1 SMP Debian 3.2.54-2 x86_64

    The programs included with the Debian GNU/Linux system are free software;
    the exact distribution terms for each program are described in the
    individual files in /usr/share/doc/*/copyright.

    Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
    permitted by applicable law.
    Last login: Sat Feb 15 13:18:04 2014 from 10.0.2.2
    Linux debian-7 3.2.0-4-amd64 #1 SMP Debian 3.2.54-2 x86_64 GNU/Linux
    Sat Feb 15 20:51:26 UTC 2014

    : vagrant@wheezy-xen:~$;

And that's it -- subsequently, `vagrant halt` will stop the VM (or the usual
`shutdown -h now` when logged into it), `vagrant up` will restart it, and
`vagrant ssh` to login. The VM is accessible from the host at the specified
address (by default, `192.168.77.2`).

If you want to customise the box, I suggest looking at the `Vagrantfile.template` plus
the scripts in `provisioning/`.

If when logging in the first time after provisioning you find that the shared
filesystem is not accessible (by default at `/host`), logout, `vagrant halt` and
`vagrant up`.
