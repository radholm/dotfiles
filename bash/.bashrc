#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

PATH="$HOME/.scripts:/opt/cisco/anyconnect/bin:$PATH"
EDITOR="nvim"

alias msteams='teams --no-sandbox --disable-seccomp-filter-sandbox --enable-features=WebRTCPipeWireCapturer'
alias vim='nvim'
alias icat='kitty +kitten icat'

#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
