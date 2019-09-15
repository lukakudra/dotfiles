# Zplugin plugin manager
[ -f ~/.zplugin/bin/zplugin.zsh ] && source ~/.zplugin/bin/zplugin.zsh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Colored ls output
alias ls='ls --color=auto'

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

# Enable autocompletion
autoload -Uz compinit && compinit

# Pure prompt theme with zplugin
zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light sindresorhus/pure

## Prompt
# autoload -Uz promptinit && promptinit
# prompt fade

## Git information
# autoload -Uz vcs_info
# precmd_vcs_info() { vcs_info }
# precmd_functions+=( precmd_vcs_info )
# setopt prompt_subst
# RPROMPT=\$vcs_info_msg_0_
# # PROMPT=\$vcs_info_msg_0_'%# '
# zstyle ':vcs_info:git:*' formats '%b'

HISTFILE=~/.histfile
HISTSIZE=99999999
SAVEHIST=$HISTSIZE
setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -v
bindkey '^R' history-incremental-search-backward
zstyle :compinstall filename '/home/luka/.zshrc'

# Case insensitive autocomplete
setopt MENU_COMPLETE
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Syntax higlighting
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Autosuggestions
[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Fzf bindings and completion
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
export FZF_DEFAULT_COMMAND='rg --hidden --files'
export FZF_CTRL_T_COMMAND='rg --hidden --files'

