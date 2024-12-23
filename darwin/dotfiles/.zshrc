source ${HOME}/.zplug/init.zsh

# plugins
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-syntax-highlighting'
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-history-substring-search'

zplug 'mafredri/zsh-async', from:github
zplug 'sindresorhus/pure'

zplug 'mollifier/anyframe'
zplug 'mollifier/cd-gitroot'

zplug 'junegunn/fzf-bin', as:command, from:gh-r, rename-to:fzf
zplug 'junegunn/fzf', as:command, use:bin/fzf-tmux

zplug 'rupa/z', use:'*.sh'

zplug 'b4b4r07/enhancd', use:enhancd.sh
zplug "b4b4r07/gist", as:command, from:gh-r

zplug 'motemen/ghq', as:command, from:gh-r

# installation script
if ! zplug check --verbose; then
  printf 'Install? [y/N]: '
  if read -q; then
    echo; zplug install
  fi
fi

zplug load --verbose

# path
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

# alias
alias lst='ls -ltr --color=auto'
alias l='ls -ltr --color=auto'
alias la='ls -la --color=auto'
alias ll='ls -l --color=auto'
alias cp='cp -i'
alias rm='rm -i'
