#!/usr/bin/fish
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
