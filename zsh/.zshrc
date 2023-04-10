source ~/.zsh/zsh-snap/znap.zsh
znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt AUTOCD EXTENDEDGLOB
setopt PROMPT_SUBST CD_SILENT
bindkey -v
bindkey '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
bindkey '^R' history-incremental-pattern-search-backward
bindkey -M vicmd '/' vi-history-search-forward
KEYTIMEOUT=1
EDITOR=nvim

autoload -Uz vcs_info
precmd () { vcs_info }
autoload -Uz compinit
autoload -Uz promptinit && promptinit
compinit
zstyle :compinstall filename '/home/radhofre/.zshrc'
zstyle ':vcs_info:git:*' formats '%b '
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

PROMPT=""$'\n'"%F{white}%~%f %F{white}${vcs_info_msg_0_}%f"$'\n'"> "

PATH="$HOME/.scripts:$HOME/.local/bin:/opt/cisco/anyconnect/bin:$(go env GOPATH)/bin:$PATH"
. "$HOME/.cargo/env"

alias vim="nvim"
alias icat='kitty +kitten icat'
