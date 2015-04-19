#!/bin/sh

set -ex

apt-get update -y
apt-get upgrade -y

apt-get install -y linux-headers-$(uname -r) build-essential m4 # dev environment
apt-get install -y ssh                                          # ssh and scp
apt-get install -y tcpdump                                      # for debugging
apt-get install -y ntp                                          # sanity
apt-get install -y nfs-common nfs-kernel-server                 # file sharing
