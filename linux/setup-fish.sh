#!/bin/bash
PWD=$(dirname $0)

is_ubuntu() {
    if [ -e /etc/lsb-release ]; then
        return 0
    else
        return 1
    fi
}


echo == fish shell ==
if [ is_ubuntu ]; then
    sudo apt-add-repository -y ppa:fish-shell/release-3
else
    echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_9.0/ /' >     /etc/apt/sources.list.d/shells:fish:release:3.list
    wget -nv https://download.opensuse.org/repositories/shells:fish:release:3/Debian_9.0/Release.key -O Release.key
    apt-key add - < Release.key
fi
sudo apt update
sudo apt install -y fish
fish -c ls #create config.fish


echo == execute fish ==
FISH_SCRIPT=`cat << EOS
echo == install fisher ==
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

fisher add edc/bass

echo == theme ==
#fisher add omf/theme-bobthefish
fisher add rafaelrinaldi/pure

go get github.com/motemen/ghq

echo == fzf ==
sudo apt install -y fzf
fisher add 'jethrokuan/fzf'

echo == z ==
fisher add 'jethrokuan/z'

echo == ghq ==
go get github.com/motemen/ghq
fisher add decors/fish-ghq
EOS
`

fish -c ${FISH_SCRIPT}