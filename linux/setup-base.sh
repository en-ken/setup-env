#!/bin/bash

echo == add-apt-repository ==
sudo apt-get install -y software-properties-common
sudo apt update

echo == git ==
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt update
sudo apt install -y git

echo == vim ==
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install -y vim

echo == standard package ==
sudo apt install -y gcc make
sudo apt install -y libssl-dev libbz2-dev libreadline-dev libsqlite3-dev zlib1g-dev automake autoconf libncurses-dev libyaml-dev libxslt-dev libffi-dev libtool unixodbc-dev gnupg

echo == go ==
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt update
sudo apt install -y golang-go