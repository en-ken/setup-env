#!/bin/bash
PWD=$(dirname $0)

echo == package update ==
sudo sed -i'~' -E "s#http://(..\.)?(archive|security)\.ubuntu\.com/ubuntu#http://ftp.jaist.ac.jp/pub/Linux/ubuntu#g" /etc/apt/sources.list
sudo apt update
sudo apt dist-upgrade -y

echo == standard package ==
sudo apt install -y language-pack-ja

echo == base installation ==
${PWD}/setup-base.sh

echo "set bell-style none" >> ~/.inputrc
