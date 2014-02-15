#!/usr/bin/env bash

set -ex

git clone git://github.com/mor1/rc-files src/rc-files || true
chown -R vagrant:vagrant src

cd src/rc-files
rm -f ~vagrant/.bashrc ~vagrant/.profile ~vagrant/.ocamlinit
mv ~vagrant/.ssh/authorized_keys ./ssh && rm -rf ~vagrant/.ssh
sudo -u vagrant ./install.sh
