#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH=$PATH:$HOME/.scripts
export PATH=$PATH:/opt/mpich/bin
export PATH=$PATH:$HOME/.local/bin
export EDITOR="vim"
export VISUAL="vim"
export TERMINAL="xterm"
export BROWSER="firefox"
export READER="zathura"

# if [[ "$(tty)" = "/dev/tty1" ]]; then
	# pgrep xfce4-session || exec startx
# fi


if [[ "$(tty)" = "/dev/tty1" ]]; then
    pgrep i3 || exec startx
fi


