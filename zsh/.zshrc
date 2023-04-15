source ~/.zsh/zsh-snap/znap.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
KEYTIMEOUT=1
EDITOR=nvim
setopt AUTOCD EXTENDEDGLOB
setopt PROMPT_SUBST CD_SILENT
bindkey -v
bindkey '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
bindkey '^R' history-incremental-pattern-search-backward
bindkey -M vicmd '/' vi-history-search-forward

autoload -Uz vcs_info
autoload -Uz compinit && compinit
autoload -Uz promptinit && promptinit
precmd () { vcs_info }
zstyle :compinstall filename '/home/radhofre/.zshrc'
zstyle ':vcs_info:git:*' formats '%b '

PROMPT="%F{white}%~%f %F{white}${vcs_info_msg_0_}%f"$'\n'"> "

PATH="$HOME/.scripts:$HOME/.local/bin:/opt/cisco/anyconnect/bin:$(go env GOPATH)/bin:$PATH"
. "$HOME/.cargo/env"

alias vim="nvim"
alias icat='kitty +kitten icat'
