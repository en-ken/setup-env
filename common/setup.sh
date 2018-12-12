#!/bin/sh
echo == package update ==
sudo sed -i'~' -E "s#http://(..\.)?(archive|security)\.ubuntu\.com/ubuntu#http://ftp.jaist.ac.jp/pub/Linux/ubuntu#g" /etc/apt/sources.list
sudo apt update
sudo apt upgrade -y

echo == git ==
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt update
sudo apt install -y git

echo == standard package ==
sudo apt install -y language-pack-ja
sudo apt install -y gcc make
sudo apt install -y libssl-dev libbz2-dev libreadline-dev libsqlite3-dev zlib1g-dev automake autoconf libncurses-dev libyaml-dev libxslt-dev libffi-dev libtool unixodbc-dev gnupg

echo == fish shell ==
sudo apt-add-repository -y ppa:fish-shell/release-2
sudo apt update
sudo apt install fish
chsh -s `which fish`
fish -c ls #create config.fish

echo == execute fish ==
fish "`dirname $0`/setup.fish"

##disable beep
echo "set bell-style none" >> ~/.inputrc
