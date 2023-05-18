[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/vim"
plug "hlissner/zsh-autopair"
plug "zap-zsh/fzf"
plug "zap-zsh/exa"
plug "spaceship-prompt/spaceship-prompt"

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
KEYTIMEOUT=1
EDITOR=nvim
setopt AUTOCD EXTENDEDGLOB CD_SILENT
# setopt PROMPT_SUBST
# bindkey '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
# bindkey '^R' history-incremental-pattern-search-backward
# bindkey "^l" () { clear; kitty +kitten icat "https://picsum.photos/1900/200?grayscale" }
# bindkey -M vicmd '/' vi-history-search-forward
bindkey '^ ' autosuggest-accept

# autoload -Uz vcs_info
autoload -U compinit && compinit -u
# autoload -Uz promptinit && promptinit
# precmd () { vcs_info }
# zstyle :compinstall filename '/home/radhofre/.zshrc'
# zstyle ':vcs_info:git:*' formats '%b '

# PROMPT="%F{white}%~%f %F{white}${vcs_info_msg_0_}%f"$'\n'"> "

PATH="$HOME/.scripts:$HOME/.local/bin:/opt/cisco/anyconnect/bin:$(go env GOPATH)/bin:$PATH"

. "$HOME/.cargo/env"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=fg:#c0c0c0,bg:#000000,hl:#ffffff --color=fg+:#d0d0d0,bg+:#000000,hl+:#ffffff --color=info:#ffffff,prompt:#ffffff,pointer:#ffffff --color=marker:#424242,spinner:#bcbcbc,header:#7f7f7f'
export DEV=$HOME/.dev/

alias vim="nvim"
alias icat='kitty +kitten icat'

icat "https://picsum.photos/1900/200?grayscale"

# bun completions
[ -s "/home/radhofre/.bun/_bun" ] && source "/home/radhofre/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
