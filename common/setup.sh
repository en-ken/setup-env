#!/bin/sh
##package update
sudo sed -i'~' -E "s#http://(..\.)?(archive|security)\.ubuntu\.com/ubuntu#http://ftp.jaist.ac.jp/pub/Linux/ubuntu#g" /etc/apt/sources.list
#sudo apt-add-repository -y ppa:git-core/ppa
sudo apt update && sudo apt upgrade -y

##standard package
sudo apt install -y git gcc make
sudo apt install -y libssl-dev libbz2-dev libreadline-dev libsqlite3-dev zlib1g-dev automake autoconf libncurses-dev libyaml-dev libxslt-dev libffi-dev libtool unixodbc-dev gnupg

##fish shell
sudo apt -y install fish
fish -c ls #create config.fish

##download fisherman
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman

##download and set asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.5.1
mkdir -p ~/.config/fish/completions
cp ~/.asdf/completions/asdf.fish ~/.config/fish/completions

##set env
cat << EOT >> ~/.config/fish/config.fish
source ~/.asdf/asdf.fish
EOT

##configure under fish
under_fish=$(cat << EOS
fisher omf/theme-l
fisher edc/bass
asdf plugin-add python
asdf plugin-add nodejs
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
EOS
)
fish -c $under_fish



##disable beep
echo "set bell-style none" >> ~/.inputrc
