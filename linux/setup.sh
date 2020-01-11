#!/bin/bash
PWD=$(dirname $0)

${PWD}/deploy-dotfiles.sh
is_wsl=$(uname -r | grep 'Microsoft')
if [ $is_wsl ];then
    ${PWD}/setup-base-ubuntu.sh
else
    ${PWD}/setup-elementaryos.sh
fi
