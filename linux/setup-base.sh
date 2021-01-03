#!/bin/bash
PWD=$(dirname $0)


is_ubuntu() {
    [ -e /etc/lsb-release ]
}

echo == add-apt-repository ==
is_ubuntu && \
sudo apt-get install -y software-properties-common && \
sudo apt update

echo == git ==
is_ubuntu && \
sudo add-apt-repository -y ppa:git-core/ppa && \
sudo apt update
sudo apt install -y git

echo === git config setting ==
echo -n "Input name (default:$USER) :"
read NAME
[ -z $NAME ] && NAME=$USER

while true
do
    echo -n "Input email :"
    read EMAIL
    [ -n $EMAIL ] && break
done

git config --global alias.c commit
git config --global alias.b branch
git config --global alias.r rebase
git config --global alias.co checkout
git config --global alias.st status
git config --global user.name ${NAME}
git config --global user.email ${EMAIL}
git config --global core.editor vim
git config --global core.autocrlf input

echo == vim ==
is_ubuntu && \
sudo add-apt-repository ppa:jonathonf/vim && \
sudo apt update
sudo apt install -y vim

echo == tmux ==
sudo apt install -y tmux

echo == fish ==
${PWD}/setup-fish.sh

echo == dev packages ==
sudo apt install -y build-essential
#sudo apt install -y libssl-dev libbz2-dev libreadline-dev libsqlite3-dev zlib1g-dev automake autoconf libncurses-dev libyaml-dev libxslt-dev libffi-dev libtool unixodbc-dev gnupg

echo == linuxbrew ==
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
. ~/.profile

echo == anyenv ==
#brew install anyenv
#anyenv install --init
#anyenv install goenv
#anyenv install nodenv

echo == asdf ==
brew install asdf
asdf plugin add golang
asdf plugin add python
asdf plugin add nodejs
asdf plugin add rust

echo == fzf ==
brew install fzf

echo == ghq ==
brew install ghq

