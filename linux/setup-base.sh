#!/bin/bash


is_ubuntu() {
    if [ -e /etc/lsb-release ]; then
        return 0
    else
        return 1
    fi
}

echo == add-apt-repository ==
is_ubuntu && \
sudo apt-get install -y software-properties-common && \
sudo apt update

echo == git ==
is_ubuntu && \
sudo add-apt-repository -y ppa:git-core/ppa && \
sudo apt update
sudo apt install -y git

echo == vim ==
is_ubuntu && \
sudo add-apt-repository ppa:jonathonf/vim && \
sudo apt update
sudo apt install -y vim

echo == standard package ==
sudo apt install -y gcc make
sudo apt install -y libssl-dev libbz2-dev libreadline-dev libsqlite3-dev zlib1g-dev automake autoconf libncurses-dev libyaml-dev libxslt-dev libffi-dev libtool unixodbc-dev gnupg

echo == go ==
is_ubuntu && \
sudo add-apt-repository ppa:longsleep/golang-backports && \
sudo apt update
sudo apt install -y golang-go
if [ -e ~/go ]; then
    mkdir ~/go
fi
