#!/bin/bash
echo == common installer ==
#sudo sed -i -E 's/juno/bionic/g' /etc/apt/sources.list
#sudo sed -i -E 's/juno/bionic/g' etc/apt/sources.list.d/appcenter.list
#sudo sed -i -E 's/juno/bionic/g' etc/apt/sources.list.d/elementary.list
#sudo sed -i -E 's/juno/bionic/g' etc/apt/sources.list.d/patches.list
./install-common.sh

echo == define function ==
# $1: github relative path such as "en-ken/setup-env" 
# $2: file extension such as zip, tar.gz, etc... 
function get_latest_download_path(){ 
    local path=$(curl -L "https://github.com/$1/releases/latest" | grep -o "href=\".*/releases/download/.*\.$2\"" | sed 's/href="\(.*\)"/\1/g') 
    echo "https://github.com${path}"
}

echo == for apt-add-repository ==
sudo apt install -y software-properties-common

echo == ime ==
sudo apt install -y fcitx-mozc

echo == firefox ==
sudo apt install -y firefox

echo == chrome ==
sudo apt-get install google-chrome-stable

echo == albert ==
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/Ubuntu_18.04/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list"
sudo apt update
sudo apt install -y albert

echo == docker ==
./install-docker.sh

echo == hyper ==
utils/install-latest.sh zeit hyper

echo == boostnote ==
utils/install-latest.sh BoostIO boost-releases

echo == power management ==
sudo apt-get install -y tlp tlp-rdw
sudo systemctl start tlp
sudo systemctl enable tlp

echo == look and feel ==
sudo add-apt-repository -y ppa:philip.scott/elementary-tweaks
sudo apt update
sudo apt install -y elementary-tweaks
sudo apt-get install -y conky

echo == font ==
CICA_PATH=$(get_latest_download_path "miiton/Cica" "zip")
curl -L -o /tmp/Cica.zip ${CICA_PATH}
unzip /tmp/Cica.zip
mkdir -p ~/.fonts
mv /tmp/Cica-*.ttf ~/.fonts/.
sudo fc-cache -fv

LANG=C xdg-user-dirs-gtk-update

