set -g theme_color_scheme base16-light
set -g theme_newline_cursor yes

# SSH Agent
set -x SSH_AGENT_FILE $HOME/.ssh/ssh-agent
if test -f $SSH_AGENT_FILE
   source $SSH_AGENT_FILE
end
ssh-add -l > /dev/null ^&1
if test $status -ne 0
  ssh-agent -c > $SSH_AGENT_FILE
  source $SSH_AGENT_FILE
  ssh-add $HOME/.ssh/id_rsa
end

# env diff absorption
if test -e "$HOME/homebrew/bin"
    set -x  fish_user_paths  "$HOME/homebrew/bin" $fish_user_paths
    set BREW_HOME $HOME/homebrew
end
if test -e "/home/linuxbrew/.linuxbrew/bin"
    set -x fish_user_paths /home/linuxbrew/.linuxbrew/bin $fish_user_paths
    set BREW_HOME /home/linuxbrew/.linuxbrew
end

source "$HOME/google-cloud-sdk/path.fish.inc"
eval (direnv hook fish)

# GOPATH
set -x GOPATH $HOME/go
set -x PATH "$GOPATH/bin" $PATH
set -x GOROOT (asdf where golang)/go

# local bin
set -x PATH ./bin $PATH
set -x PATH $HOME/Library/Android/sdk/platform-tools $PATH

# asdf must be at the BOTTOM
source $BREW_HOME/opt/asdf/asdf.fish
