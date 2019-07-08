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

# Show NTFS folders with normal colors
LS_COLORS=$LS_COLORS:'ow=1;34:tw=1;34:' ; export LS_COLORS

# Disable Ctrl + s in terminal
stty -ixon

# Aliases:
 alias myscrot='scrot ~/Pictures/screenshots/%b%d::%H%M%S.png'
