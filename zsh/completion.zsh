autoload compinit

# Completions compiled db goes in cache location
local XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
[ -d "$XDG_CACHE_HOME/zsh" ] || mkdir -p "$XDG_CACHE_HOME/zsh"
compinit -d $XDG_CACHE_HOME/zsh/zcompdump

# Fuzzier matching for completions
zstyle ':completion:*' completer _expand _complete _correct _approximate

# Match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Display colors for completion menu
eval $(dircolors -b)
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Highlight selected item in menu
zstyle ':completion:*' menu select=1

# Give context to what's going on
zstyle ':completion:*:descriptions' format '%BCompleting %d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format '%BNo matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''
