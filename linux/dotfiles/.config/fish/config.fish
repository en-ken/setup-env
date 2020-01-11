set -g theme_color_scheme base16-light
set -g theme_newline_cursor yes

set -x fish_user_paths /home/linuxbrew/.linuxbrew/bin $fish_user_paths
status --is-interactive; and source (env SHELL=fish anyenv init -|psub)

set -x GOPATH $HOME/go
if test -e $GOPATH/bin
    set -x PATH $GOPATH/bin $PATH
end
