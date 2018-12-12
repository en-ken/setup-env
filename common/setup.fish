#!/usr/bin/fish
echo == install fisher ==
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fish_update_completions

echo == install standard packages ==
fisher add jethrokuan/z
fisher add edc/bass

echo == install theme ==
fisher add omf/theme-bobthefish
string trim '
set -g theme_color_scheme base16-light
set -g theme_newline_cursor yes
' >> ~/.config/fish/config.fish

echo == install asdf ==
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.5.1
mkdir -p ~/.config/fish/completions
cp ~/.asdf/completions/asdf.fish ~/.config/fish/completions
string trim 'source ~/.asdf/asdf.fish' >> ~/.config/fish/config.fish
source ~/.config/fish/config.fish
asdf plugin-add python
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

echo == install fzf ==
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
fisher add jethrokuan/fzf

echo == intall go ==
sudo apt install -y golang-go
mkdir $HOME/go
string trim '
set -x GOPATH $HOME/go
set -x PATH $GOPATH/bin $PATH
' >> ~/.config/fish/config.fish
source ~/.config/fish/config.fish

go get github.com/motemen/ghq
fisher add decors/fish-ghq

echo == install node by fnm ==
fisher add jorgebucaran/fnm
fnm latest
