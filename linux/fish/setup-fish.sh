#!/bin/bash
PWD=$(dirname $0)

echo == fish shell ==
sudo apt-add-repository -y ppa:fish-shell/release-3
sudo apt update
sudo apt install fish
chsh -s `which fish`
fish -c ls #create config.fish

echo == execute fish ==
fish "${PWD}/setup.fish"
