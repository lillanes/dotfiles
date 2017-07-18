# Set up the prompt

autoload -Uz promptinit
promptinit
#prompt adam1 grey white

setopt histignorealldups sharehistory

# Vi mode
bindkey -v
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

PROMPT="%K{grey}%n@%m %B%F{green}%~%F{white}$prompt_newline %# %b%f%k" 

VIM_NORMAL_PROMPT="%B%F{yellow}[NORMAL]%{$reset_color%}"
VIM_INSERT_PROMPT="%B%F{blue}[INSERT]%{$reset_color%}"

precmd () {
    RPROMPT="$VIM_INSERT_PROMPT"
}

function vim-prompt-toggle {
    RPROMPT="${${KEYMAP/vicmd/$VIM_NORMAL_PROMPT}/(main|viins)/$VIM_INSERT_PROMPT}"
    zle reset-prompt
}

zle -N zle-keymap-select vim-prompt-toggle
export KEYTIMEOUT=1

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Autocomplete search:
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# Color
alias ls='ls --color=auto'

# Vimlike:
alias :q=exit
alias :qa=exit

# multi move (eg: mv source_*.tgz target_*.tgz)
autoload -U zmv
alias mmv='noglob zmv -W'

# use = as calculator 
= () { python2 -c "import sys; print eval('$@')" }

# aliases for ls
alias ll='ls -l'
alias la='ls -la'

# tmux
alias tmux='tmux -2 attach'

# emacs: open files in existing emacs session if possible
export ALTERNATE_EDITOR=""
alias :e='emacs-gui-or-tty'
alias :en='emacsclient --create-frame --no-wait'
