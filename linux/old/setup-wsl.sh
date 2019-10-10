#!/bin/bash
echo == common installer ==
./setup.sh

echo == xorgs ==
sudo apt install -y x11-apps libxss1 libasound2

echo == ime ==
dbus-uuidgen |sudo tee /etc/machine-id
sudo apt install -y dbus-x11 dconf-cli
sudo apt install -y fcitx-mozc

echo == environment variables ==
cat << EOT >> ~/.config/fish/config.fish
set -x DISPLAY localhost:0.0
set -x NO_AT_BRIDGE 2
set -x GTK_IM_MODULE fcitx
set -x XMODIFIERS "@im=fcitx"
set -x QT_IM_MODULE fcitx
set -x DefaultIMModule fcitx
activate-ime
EOT


cat << EOT >> ~/.config/fish/functions/select-gnome-theme.fish 
function select-gnome-theme
  wget -O gogh https://git.io/vQgMr
  chmod +x gogh
  ./gogh
  rm gogh
end
EOT

cat << EOT >> ~/.config/fish/functions/activate-ime.fish
function activate-ime
  fcitx-autostart > /dev/null 2>&1
end
EOT

