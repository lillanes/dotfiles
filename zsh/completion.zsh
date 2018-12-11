autoload compinit

# completions compiled db goes in cache location
local XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
[ -d "$XDG_CACHE_HOME/zsh" ] || mkdir -p "$XDG_CACHE_HOME/zsh"
compinit -d $XDG_CACHE_HOME/zsh/zcompdump

# autocompletion does shell expansion, context-sensitive completion, correction,
# and (finally) completions with corrections
zstyle ':completion:*' completer _expand _complete _correct _approximate

# match lowercase to uppercase and fallback to fully case insensitive matching;
# match multiple words separated by a dot, dash, or underscore;
# match inside words
zstyle ':completion:*' matcher-list\
    'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}'\
    'r:|[.-_]=**'\
    'l:|=* r:|=*'

# display colors for completion menu
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# highlight selected item in menu
zstyle ':completion:*' menu select

# give context to what's going on
zstyle ':completion:*:descriptions' format '%BCompleting %d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format '%BNo matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''
