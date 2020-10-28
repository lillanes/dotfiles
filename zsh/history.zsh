# Allow multiple instances to share single history and store history
# immediately (as opposed to on exit)
setopt INC_APPEND_HISTORY
# Avoid duplicates
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
# Share history among multiple simultaneous sessions
setopt SHAREHISTORY

# Keep big history
HISTSIZE=10000
SAVEHIST=10000

# History file is kept in XDG cache path
local XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
[ -d "$XDG_CACHE_HOME/zsh" ] || mkdir -p "$XDG_CACHE_HOME/zsh"
HISTFILE=$XDG_CACHE_HOME/zsh/histfile

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

# vim-like up/down also filters history:
bindkey -a 'k' up-line-or-beginning-search
bindkey -a 'j' down-line-or-beginning-search
