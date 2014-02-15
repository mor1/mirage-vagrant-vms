#!/usr/bin/env bash

set -ex

OPAM_VER=1.1.1
OPAM_PKG=opam-full-${OPAM_VER}.tar.gz
OPAM_URL=https://github.com/ocaml/opam/releases/download/${OPAM_VER}/${OPAM_PKG}

mkdir -p opam-src
cd opam-src

wget $OPAM_URL
tar xzvf opam-full-1.1.1.tar.gz --strip-components=1

./configure
make
make install

cd ..
rm -rf opam-src

sudo -u vagrant -c "opam init --yes --auto-setup    \
  && eval $(opam config env)                        \
  && opam switch --yes 4.01.0                       \
  && eval $(opam config env)                        \
  && opam install --yes mirage utop"
