#!/usr/bin/env bash
#
# Copyright (c) 2014 Richard Mortier <mort@cantab.net>
#
# Permission to use, copy, modify, and distribute this software for any purpose
# with or without fee is hereby granted, provided that the above copyright
# notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.
#

# Install OPAM, the latest stable OCaml, and the base Mirage packages for Xen.

set -ex

OCAML_VER=4.01.0

OPAM_VER=1.2.0
OPAM_PKG=opam-full-${OPAM_VER}.tar.gz
OPAM_URL=https://github.com/ocaml/opam/releases/download/${OPAM_VER}/${OPAM_PKG}

sudo -u vagrant bash -lc "(
    which opam || (
        mkdir -p opam-src
        cd opam-src

        wget $OPAM_URL
        tar xzvf opam-full-${OPAM_VER}.tar.gz --strip-components=1

        ./configure
        make lib-ext
        ./configure
        make
        sudo make install

        cd ..
        rm -rf opam-src
    )

    opam init --yes --auto-setup
  )"

OPAM_ENV=$(sudo -u vagrant bash -lc "eval `opam config env`")
sudo -u vagrant bash -lc "(
    eval "$OPAM_ENV"
    opam switch --yes $OCAML_VER
  )"

OPAM_ENV=$(sudo -u vagrant bash -lc "eval `opam config env`")
sudo -u vagrant bash -lc "(
    eval "$OPAM_ENV"
    opam install --yes mirage utop mirage-xen
  )"
