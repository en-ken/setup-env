set -g theme_color_scheme base16-light
set -g theme_newline_cursor yes

set -x GOPATH $HOME/go
if test -e $GOPATH/bin
    set -x PATH $GOPATH/bin $PATH
end
