#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# two lines prompt with exit code check
#PS1="\[\033[0;37m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[1;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[1;31m\]\u\[\033[1;37m\]@\[\033[1;33m\]\h'; else echo '\[\033[1;32m\]\u\[\033[1;37m\]@\[\033[1;33m\]\h'; fi)\[\033[0;37m\]]\342\224\200[\[\033[1;96m\]\w\[\033[0;37m\]]\n└───▶ "

# one line prompt without exit code check
PS1="\[\033[0;37m\]\$(echo \"[\")$(if [[ ${EUID} == 0 ]]; then echo '\[\033[1;31m\]\u\[\033[1;37m\]@\[\033[1;33m\]\h\[\033[0;37m\]]\342\224\200[\[\033[1;96m\]\w\[\033[0;37m\]]\[\033[1;37m\]#\[\033[0;37m\] '; else echo '\[\033[1;32m\]\u\[\033[1;37m\]@\[\033[1;33m\]\h\[\033[0;37m\]]\342\224\200[\[\033[1;96m\]\w\[\033[0;37m\]]\[\033[1;37m\]$\[\033[0;37m\] '; fi)"

# Set vi mode for bash
set -o vi

# This is so tmux can use vim with colors
if [[ $TERM == xterm ]]; then TERM=xterm-256color; fi
if [[ $TERM == urxvt ]]; then TERM=xterm-256color; fi

# Show NTFS folders with normal colors
LS_COLORS=$LS_COLORS:'ow=1;34:tw=1;34:' ; export LS_COLORS

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# Support for 256-color gruvbox pallete
source "$HOME/.vim/plugged//gruvbox/gruvbox_256palette.sh"

# Disable Ctrl + s in terminal
stty -ixon

# Fzf bindings and completion
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

# Aliases:
 alias myscrot='scrot ~/Pictures/screenshots/%b%d::%H%M%S.png'

