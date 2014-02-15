#!/usr/bin/env bash

set -ex

OPAM_VER=1.1.1
OPAM_PKG=opam-full-${OPAM_VER}.tar.gz
OPAM_URL=https://github.com/ocaml/opam/releases/download/${OPAM_VER}/${OPAM_PKG}

sudo -u vagrant bash -lc "(
    which opam || (
        mkdir -p opam-src
        cd opam-src

        wget $OPAM_URL
        tar xzvf opam-full-1.1.1.tar.gz --strip-components=1

        ./configure
        make
        sudo make install

        cd ..
        rm -rf opam-src
    )

    opam init --yes --auto-setup
  )"

OPAM_ENV=$(sudo -u vagrant bash -lc "opam config env")
sudo -u vagrant bash -lc "(
    eval "$OPAM_ENV"
    opam switch --yes 4.01.0
  )"

OPAM_ENV=$(sudo -u vagrant bash -lc "opam config env")
sudo -u vagrant bash -lc "(
    eval "$OPAM_ENV"
    opam install --yes mirage utop mirage-xen
  )"
