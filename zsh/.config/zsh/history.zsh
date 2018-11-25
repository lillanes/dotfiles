# Allow multiple instances to share single history
setopt APPEND_HISTORY
# Store history immediately (as opposed to on exit)
setopt INC_APPEND_HISTORY
# Avoid duplicates
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS

# Keep big history
HISTSIZE=10000
SAVEHIST=10000

# Standard history file
HISTFILE=$ZCACHEDIR/histfile

# C-R/C-F for history search
bindkey '^r' history-incremental-search-backward
bindkey '^f' history-incremental-search-forward

# Up/down arrows for filtered history search 
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
