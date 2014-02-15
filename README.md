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

## Installing Veewee

If you want to build the base box yourself, install [Ruby][] -- I use [rvm][] --
and then install [veewee][]:

    $ \curl -sSL https://get.rvm.io | bash -s stable --ruby
    $ gem install ruby
    $ veewee version
    Version : 0.3.12 - use at your own risk

[ruby]: https://www.ruby-lang.org/
[rvm]: https://rvm.io/
[veewee]: https://github.com/jedi4ever/veewee

## Building the VM

First, clone my Vagrant repo:

    $ git clone https://github.com/mor1/mirage-vagrant-vms.git
    $ cd mirage-vagrant-vms

Then, build the box from the basebox:

    $ veewee vbox build 'debian-7.4.0-xen'
    $ veewee vbox export 'debian-7.4.0-xen'
    $ mv debian-7.4.0-xen.box boxes
    $ vagrant box add debian-7.4.0-xen boxes/debian-7.4.0-xen.box

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
address (by default, `46.43.42.137`).

If you want to customise the box, I suggest looking at the `Vagrantfile` plus
the scripts in `provisioning/`.

If when logging in the first time after provisioning you find that the shared
filesystem is not accessible (by default at `/mort`), logout, `vagrant halt` and
`vagrant up`.
