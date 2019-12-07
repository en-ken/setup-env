#!/bin/bash
PWD=$(dirname $0)

is_ubuntu() {
    [ -e /etc/lsb-release ]
}


echo == fish shell ==
if is_ubuntu; then
    sudo apt-add-repository -y ppa:fish-shell/release-3
else
    echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_9.0/ /' >     /etc/apt/sources.list.d/shells:fish:release:3.list
    wget -nv https://download.opensuse.org/repositories/shells:fish:release:3/Debian_9.0/Release.key -O Release.key
    apt-key add - < Release.key
fi
sudo apt update
sudo apt install -y fish
fish -c ls #create config.fish


echo == install fisher ==
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

echo == bass ==
fish -c 'fisher add edc/bass'

echo == theme ==
#fisher add omf/theme-bobthefish
fish -c 'fisher add rafaelrinaldi/pure'

echo == fzf ==
sudo apt install -y fzf
fish -c 'fisher add jethrokuan/fzf'

echo == z ==
fish -c 'fisher add jethrokuan/z'

echo == ghq ==
fish -c 'go get github.com/motemen/ghq; fisher add decors/fish-ghq'
