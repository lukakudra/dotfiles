#
# ~/.zprofile
#

[[ -f ~/.zshrc ]] && . ~/.zshrc

export PATH=$PATH:$HOME/.scripts
export PATH=$PATH:$HOME/.local/bin
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$GOBIN"
PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="termite"
# export BROWSER="firefox"
export READER="zathura"

if [[ "$(tty)" = "/dev/tty1" ]]; then
    pgrep i3 || exec startx
fi


