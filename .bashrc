#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

gb() {
    echo -n '(' && git branch 2>/dev/null | grep '^*' | colrm 1 2 | tr -d '\n' && echo  -n ')'
}
git_branch() {
    gb | sed 's/()//'
}

git_separator() {
    [ -z $(git_branch) ] && echo "" || echo "-"
}

PS1="\[\033[1;35m\]\$(git_branch)\[\033[0;37m\]\$(git_separator)\[\033[0;37m\]\$(echo \"[\")$(if [[ ${EUID} == 0 ]]; then echo '\[\033[1;31m\]\u\[\033[1;37m\]@\[\033[1;33m\]\h\[\033[0;37m\]]-[\[\033[1;96m\]\W\[\033[0;37m\]]\[\033[1;37m\]#\[\033[0;37m\] '; else echo '\[\033[1;32m\]\u\[\033[1;37m\]@\[\033[1;33m\]\h\[\033[0;37m\]]-[\[\033[1;96m\]\W\[\033[0;37m\]]\[\033[1;37m\]$\[\033[0;37m\] '; fi)"

# Set vi mode for bash
set -o vi

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
[ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash
[ -f /usr/share/fzf/completion.bash ] && source /usr/share/fzf/completion.bash

# Unlimited bash history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
export HISTFILE=~/.bash_unlimited_history
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Aliases:
 alias myscrot='scrot ~/Pictures/screenshots/%b%d::%H%M%S.png'

