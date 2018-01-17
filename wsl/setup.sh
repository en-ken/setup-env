#!/bin/sh
echo @@package update
sudo sed -i'~' -E "s#http://(..\.)?(archive|security)\.ubuntu\.com/ubuntu#http://ftp.jaist.ac.jp/pub/Linux/ubuntu#g" /etc/apt/sources.list
sudo apt-add-repository -y ppa:git-core/ppa
sudo apt-add-repository -y ppa:fish-shell/release-2 #for fish
sudo apt update && sudo apt upgrade -y

echo @@standard package
sudo apt install -y git gcc make

echo @@enable gui
sudo apt -y install x11-apps
echo "export DISPLAY=localhost:0.0" >> ~/.bashrc

echo @@change fonts
sudo ln -s /mnt/c/Windows/Fonts /usr/share/fonts/Windows
sudo apt install -y fontconfig
sudo fc-cache -fv

echo @@terminal
sudo apt install -y gnome-terminal
dbus-uuidgen |sudo tee /etc/machine-id

echo @@fcitx
sudo apt install -y fcitx fcitx-mozc

echo @@fish shell
sudo apt -y install fish
fish
cat << EOT >> ~/.config/fish/config.fish
function x86
    echo '(x86)'
end
function X86
    echo '(X86)'
end
set -x DISPLAY localhost:0.0
EOT
source ~/.config/fish/config.fish
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman
fisher install omf/theme-agnoster

echo @@nodebrew pyenv
curl -L git.io/nodebrew | perl - setup
git clone https://github.com/yyuu/pyenv.git ~/.pyenv
echo 'set -x PATH $HOME/.nodebrew/current/bin $HOME/.pyenv/bin $PATH' >> ~/.config/fish/config.fish
echo 'source (pyenv init - | psub)' >> ~/.config/fish/config.fish
source ~/.config/fish/config.fish

nodebrew install-binary stable
nodebrew use stable

sudo apt install -y libssl-dev libbz2-dev libreadline-dev libsqlite3-dev zlib1g-dev
pyenv install 3.6.4

echo @@disable beep
echo "set bell-style none" >> ~/.inputrc