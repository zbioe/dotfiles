# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Enable XON/XOFF flow control
stty -ixon

# Aliases
for f in $HOME/.aliases.d/*.sh; do
	source $f
done

# Profiles
for f in $HOME/.profile.d/*.sh; do
    source $f
done

# Key Map
setxkbmap -model abnt2 -layout br -variant abnt2 -option ctrl:swapcaps

# Sure about emacs mode
bindkey -e

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME=dogenpunk

# auto-update (in days).
export UPDATE_ZSH_DAYS=26

# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $HOME/.oh-my-zsh/oh-my-zsh.sh

# User configuration

# Language environment
export LANG=en_US.UTF-8

# Editor sessions
export EDITOR='emacs -nw'

# autoload -U edit-command-line
# zle -N edit-command-line
bindkey '^U' edit-command-line                   # Opens emacs to edit current command line
bindkey '^R' history-incremental-search-backward # Perform backward search in command line history
bindkey '^S' history-incremental-search-forward  # Perform forward search in command line history
bindkey '^P' history-search-backward             # Go back/search in history (autocomplete)
bindkey '^N' history-search-forward              # Go forward/search in history (autocomplete)
bindkey '^[h' backward-kill-word		 # Emacs like


# define commands to copy and paste x clipboard

# ^Xw - copy region, or cut buffer
# ^Xy - paste x clipboard

# in both cases, modifies CUTBUFFER

copy-to-xclip() {
    [[ "$REGION_ACTIVE" -ne 0 ]] && zle copy-region-as-kill
    print -rn -- $CUTBUFFER | xclip -selection clipboard -i
}

zle -N copy-to-xclip
bindkey "^Xw" copy-to-xclip

paste-xclip() {
    killring=("$CUTBUFFER" "${(@)killring[1,-2]}")
    CUTBUFFER=$(xclip -selection clipboard -o)
    zle yank
}

zle -N paste-xclip
bindkey "^Xy" paste-xclip

DISABLE_AUTO_TITLE="true"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
