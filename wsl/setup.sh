#!/bin/sh
##package update
sudo sed -i'~' -E "s#http://(..\.)?(archive|security)\.ubuntu\.com/ubuntu#http://ftp.jaist.ac.jp/pub/Linux/ubuntu#g" /etc/apt/sources.list
sudo apt-add-repository -y ppa:git-core/ppa
sudo apt-add-repository -y ppa:fish-shell/release-2 #for fish
sudo apt update && sudo apt upgrade -y

##standard package
sudo apt install -y language-pack-ja
sudo apt install -y git gcc make
sudo apt install -y libssl-dev libbz2-dev libreadline-dev libsqlite3-dev zlib1g-dev

##enable gui
sudo apt -y install x11-apps
echo "export DISPLAY=localhost:0.0" >> ~/.bashrc

##change fonts
sudo ln -s /mnt/c/Windows/Fonts /usr/share/fonts/Windows
sudo apt install -y fontconfig
sudo fc-cache -fv

##terminal
sudo apt install -y gnome-terminal
dbus-uuidgen |sudo tee /etc/machine-id
sudo apt install -y fcitx fcitx-mozc
sudo apt install -y dconf-cli


##fish shell
sudo apt -y install fish
fish -c ls #create config.fish

##download fisherman,nodebrew,pyenv
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman
curl -L git.io/nodebrew | perl - setup
git clone https://github.com/yyuu/pyenv.git ~/.pyenv

##set env
cat << EOT >> ~/.config/fish/config.fish
function x86
    echo '(x86)'
end
function X86
    echo '(X86)'
end
set -x DISPLAY localhost:0.0
set -x GTK_IM_MODULE fcitx
set -x XMODIFIERS "@im=fcitx"
set -x QT_IM_MODULE fcitx
set -x DefaultIMModule fcitx
set -x NO_AT_BRIDGE 2
set -x PATH \$HOME/.nodebrew/current/bin \$HOME/.pyenv/bin \$PATH
source (pyenv init - | psub)
EOT
cat << EOT >> ~/.config/fish/functions/select-gnome-theme.fish 
function select-gnome-theme
  wget -O gogh https://git.io/vQgMr
  chmod +x gogh
  ./gogh
  rm gogh
end
EOT
cat << EOT >> ~/.config/fish/functions/exec-gnome-terminal.fish
function exec-gnome-terminal
  cd
  fcitx-autostart > /dev/null 2>&1
  gnome-terminal
  wait-until-close
end

function is-alive
  ps --no-heading -C gnome-terminal-server
end

function wait-until-close
  while true
    sleep 10
    set res (is-alive)
    if test -z "\$res"
      break
    end
  end
end
EOT
echo "fish" >> ~/.bashrc

##configure under fish
fish -c "fisher omf/theme-l"
under_fish=$(cat << EOS
nodebrew install-binary stable
nodebrew use stable
pyenv install 3.6.4
EOS
)
fish -c $under_fish

##disable beep
echo "set bell-style none" >> ~/.inputrc