#!/usr/bin/env bash

set -ex

su - vagrant

OPAM_VER=1.1.1
OPAM_PKG=opam-full-${OPAM_VER}.tar.gz
OPAM_URL=https://github.com/ocaml/opam/releases/download/${OPAM_VER}/${OPAM_PKG}

if [ ! -r "opam-src/$OPAM_PKG" ] ; then
    mkdir -p opam-src
    wget $OPAM_URL
    mv $OPAM_PKG opam-src
fi

cd opam-src
tar xzvf opam-full-1.1.1.tar.gz --strip-components=1

./configure
make
make install

opam init --yes --auto-setup
eval $(opam config env)

opam switch --yes 4.01.0
opam install --yes mirage utop
