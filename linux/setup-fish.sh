#!/bin/bash
PWD=$(dirname $0)

echo == fish shell ==
sudo apt-add-repository -y ppa:fish-shell/release-3
sudo apt update
sudo apt install fish
chsh -s `which fish`
fish -c ls #create config.fish

echo == execute fish ==
SCRIPT=$(cat << EOS
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
)

fish -c ${FISH_SCRIPT}
