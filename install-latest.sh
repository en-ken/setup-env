#!/bin/bash
# $1 account of github
# $2 project name

sudo apt install -y curl jq

suffix=$(date +%s)
latest_url=$(curl https://api.github.com/repos/$1/$2/releases/latest |\
jq .assets[].browser_download_url | grep amd64.deb | sed -e 's/"//g')
curl -L -o /tmp/$1_${suffix}.deb ${latest_url}
sudo dpkg -i /tmp/$1_${suffix}.deb
