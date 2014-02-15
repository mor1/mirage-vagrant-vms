#!/usr/bin/env bash

set -ex

## backports good -- git 1.8 please
BACKPORTS=http://ftp.uk.debian.org/debian
grep wheezy-backports /etc/apt/sources.list ||
    (echo "deb $BACKPORTS wheezy-backports main" >> /etc/apt/sources.list)

sed -i 's/http.us/ftp.uk/g' /etc/apt/sources.list

apt-get update
apt-get -y -t wheezy-backports install "git"

apt-get install -y build-essential m4                        # build tools
apt-get install -y xen-tools                                 # xen client tools
apt-get install -y ocaml ocaml-native-compilers camlp4-extra # ocaml
apt-get install -y aspcud                                    # opam solver
