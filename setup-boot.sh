#!/bin/bash

echo == install refind ==
sudo apt-add-repository ppa:rodsmith/refind
sudo apt update
sudo apt install refind

echo == install theme ==
shell=$(cat <<EOS
cd /boot/efi/EFI/refind/
mkdir -p themes
git clone https://github.com/andersfischernielsen/rEFInd-minimal-black themes/rEFInd-minimal-black
echo "include themes/rEFInd-minimal-black/theme.conf" >> refind.conf
EOS
)

bash -c ${shell}
