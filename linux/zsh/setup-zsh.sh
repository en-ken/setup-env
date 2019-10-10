#!/bin/bash
PWD=$(dirname $0)

sudo apt install -y zsh
chsh -s $(which zsh)
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

cp "${PWD}/../config/.zshrc" ~/
