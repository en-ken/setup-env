#!/bin/bash

./deploy-dotfiles.sh
is_wsl=$(uname -r | grep 'Microsoft')
if [ $is_wsl ];then
    ./install-common.sh
else
    ./setup-elementaryos.sh
fi
