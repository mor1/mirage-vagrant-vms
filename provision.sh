#!/usr/bin/env bash

set -ex

OPAM_VER=1.1.1
OPAM_PKG=opam-full-${OPAM_VER}.tar.gz
OPAM_URL=https://github.com/ocaml/opam/releases/download/${OPAM_VER}/${OPAM_PKG}

## build tools
apt-get install -y build-essential m4 git

## ocaml
apt-get install -y ocaml ocaml-native-compilers camlp4-extra

## opam
apt-get install -y aspcud

wget $OPAM_URL
mkdir opam-src
mv $OPAM_PKG opam-src
cd opam-src

tar xzvf opam-full-1.1.1.tar.gz --strip-components=1
./configure
make
make install

opam init --yes
opam switch --yes 4.01.0
opam install --yes mirage utop
