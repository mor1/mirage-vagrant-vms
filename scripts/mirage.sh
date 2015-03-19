#!/bin/sh

set -ex
sudo apt-get install -y libssl-dev pkg-config # required by many mirage apps
opam install mirage --yes                     # install mirage
