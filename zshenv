source "$HOME/.profile"

# zsh: config files (not perfect, .zshrc and others still needs the dot in
# front) (history files are handled by zsh itself)
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# avoid .zcompdump file where I don't want it
skip_global_compinit=1
