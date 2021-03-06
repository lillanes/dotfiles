### explicit definition of default XDG spec paths ###
[ -z "$XDG_CONFIG_HOME" ] && XDG_CONFIG_HOME="$HOME/.config"
[ -z "$XDG_CACHE_HOME" ] && XDG_CACHE_HOME="$HOME/.cache"
[ -z "$XDG_DATA_HOME" ] && XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME
export XDG_CACHE_HOME
export XDG_DATA_HOME


### add user space install paths ###
PATH="$HOME/.local/bin:$PATH"


### keep config files and stored data according to XDG paths ###

mkdir -p "$XDG_CONFIG_HOME"
mkdir -p "$XDG_CACHE_HOME"
mkdir -p "$XDG_DATA_HOME"

# gnupg:
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
mkdir -p "$GNUPGHOME"

# less: config and history files
mkdir -p "$XDG_CACHE_HOME/less"
mkdir -p "$XDG_CONFIG_HOME/less"
export LESSHISTFILE="$XDG_CACHE_HOME/less/histfile"
export LESSKEY="$XDG_CONFIG_HOME/less/lesskey"

# ncurses/terminfo: compiled terminfo files
export TERMINFO_DIRS="$XDG_DATA_HOME/terminfo:/usr/local/share/terminfo:/etc/terminfo:/lib/terminfo:/usr/share/terminfo"

# python: startup script to manage history file
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/startup.py"

# vim: config files (caches and backups are handled by vim itself)
export VIMINIT=":source $XDG_CONFIG_HOME/vim/vimrc"


### source local profile if it exists ###
[ -f "$XDG_CONFIG_HOME/profile" ] && source "$XDG_CONFIG_HOME/profile"
