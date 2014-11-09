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

# Configure `apt` to use UK mirror, install a recent `git` from backports and
# base system packages.

set -ex

BACKPORTS=http://http.us.debian.org/debian
MIRROR=ftp.uk.debian.org

## backports good -- git 1.8 please
grep wheezy-backports /etc/apt/sources.list ||
    (echo "deb $BACKPORTS wheezy-backports main" >> /etc/apt/sources.list)

sed -i "s/http.us.debian.org/$MIRROR/g" /etc/apt/sources.list

apt-get update
apt-get -y -t wheezy-backports install "git"

apt-get install -y build-essential m4                        # build tools
apt-get install -y xen-tools                                 # xen client tools
apt-get install -y ocaml ocaml-native-compilers camlp4-extra # ocaml
apt-get install -y aspcud                                    # opam solver
apt-get install -y ssh                                       # ssh and scp
