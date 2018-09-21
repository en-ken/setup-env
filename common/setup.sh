#!/bin/sh
echo == package update ==
sudo sed -i'~' -E "s#http://(..\.)?(archive|security)\.ubuntu\.com/ubuntu#http://ftp.jaist.ac.jp/pub/Linux/ubuntu#g" /etc/apt/sources.list
sudo apt update && sudo apt upgrade -y

echo == standard package ==
sudo apt install -y language-pack-ja
sudo apt install -y git gcc make
sudo apt install -y libssl-dev libbz2-dev libreadline-dev libsqlite3-dev zlib1g-dev automake autoconf libncurses-dev libyaml-dev libxslt-dev libffi-dev libtool unixodbc-dev gnupg

echo == fish shell ==
sudo apt -y install fish
fish -c ls #create config.fish

echo == download fisherman ==
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman

echo == download and set asdf ==
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.5.1
mkdir -p ~/.config/fish/completions
cp ~/.asdf/completions/asdf.fish ~/.config/fish/completions

echo == set env ==
cat << EOT >> ~/.config/fish/config.fish
source ~/.asdf/asdf.fish
EOT

echo == execute fish ==
fish "`dirname $0`/setup.fish"

##disable beep
echo "set bell-style none" >> ~/.inputrc
