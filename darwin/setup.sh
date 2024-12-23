#!/bin/bash
PWD=$(dirname $0)

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

brew install fish && echo 'exec fish' >> ~/.zshrc
brew install fzf
brew install ghq
brew install tmux
brew install direnv
curl https://mise.run | sh

echo == fish setup ==
fish ${PWD}/setup-fish.fish
