#!/bin/bash

echo == install refind ==
sudo apt-add-repository ppa:rodsmith/refind
sudo apt update
sudo apt install refind

echo == install theme ==
shell=$(cat <<EOS
cd /boot/efi/EFI/refind/
mkdir -p themes
git clone https://github.com/EvanPurkhiser/rEFInd-minimal themes/rEFInd-minimal
echo "include themes/refind-minimal/theme.conf" >> refind.conf
EOS
)

bash -c ${shell}
