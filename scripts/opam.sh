#!/bin/sh

set -ex

rm -rf ~/.config ~/bin

mkdir ~/bin

sudo apt-get install -y ocaml ocaml-native-compilers camlp4-extra # ocaml
sudo apt-get install -y aspcud curl zeroinstall-injector          # 0install
0install add opam http://tools.ocaml.org/opam.xml                 # opam

PATH=~/bin:$PATH
opam init --verbose --auto-setup --yes
eval $(opam config env)
