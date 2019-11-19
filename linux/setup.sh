#!/bin/bash

./deploy-dotfiles.sh
./install-common.sh
is_wsl=$(uname -r | grep 'Microsoft')
if [ ! $is_wsl ];then
    ./setup-elementaryos.sh
fi
