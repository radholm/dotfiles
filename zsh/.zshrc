HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
bindkey -v
KEYTIMEOUT=1
EDITOR=nvim

PATH="$HOME/.scripts:$HOME/.local/bin:/opt/cisco/anyconnect/bin:$(go env GOPATH)/bin:$PATH"

alias vim="nvim"
alias icat='kitty +kitten icat'
. "$HOME/.cargo/env"

zstyle :compinstall filename '/home/radhofre/.zshrc'
autoload -Uz compinit
compinit
