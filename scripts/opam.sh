#!/bin/sh

set -ex

rm -rf ~/.config ~/bin ~/.opam
sudo apt-get install -y ocaml ocaml-native-compilers camlp4-extra # ocaml

DISTRO=$(cut -f 1 -d ' ' /etc/issue)
if [ "$DISTRO" = "Debian" ] ; then
    ## can't get 0install to work on Debian 7.8.0
    wget http://download.opensuse.org/repositories/home:ocaml/Debian_7.0/Release.key
    sudo apt-key add - < Release.key
    echo 'deb http://download.opensuse.org/repositories/home:/ocaml/Debian_7.0/ /' |\
        sudo tee -a /etc/apt/sources.list.d/opam.list > /dev/null
    sudo apt-get update
    sudo apt-get install -y opam

else                            # not-Debian
    mkdir ~/bin
    export PATH=$HOME/bin:$PATH
    sudo apt-get install -y aspcud curl zeroinstall-injector          # 0install
    0install add opam http://tools.ocaml.org/opam.xml                 # opam

fi

opam init --verbose --auto-setup --yes

if [ "$DISTRO" = "Debian" ] ; then
    opam switch 4.02.1          # Debian still on ocaml-3.12.1 ...
fi

eval $(opam config env)
rm -f Release.key
