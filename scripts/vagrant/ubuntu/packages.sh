#!/usr/bin/env bash
#
# Copyright (c) 2015 Richard Mortier <mort@cantab.net>
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

apt-get update
apt-get install build-essential git m4
apt-get install xen-hypervisor-4.4-amd64 bridge-utils
apt-get install \
        ocaml-compiler-libs ocaml-interp ocaml-base-nox ocaml-base \
        ocaml ocaml-nox ocaml-native-compilers camlp4 camlp4-extra
