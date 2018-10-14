# pyenv
PATH="$HOME/.pyenv/bin:$PATH"

# my own local stuff
PATH="$HOME/.local/bin:$PATH"

# paths for local-installed libs
LIBRARY_PATH="$HOME/.local/lib:$LIBRARY_PATH"
LD_LIBRARY_PATH="$HOME/.local/lib:$LD_LIBRARY_PATH"

# paths for local-installed python libs
PYTHONPATH="$HOME/.local/lib/python"

# export and run stuff that needs to be run
eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

if [[ -a "$HOME/.zshenv.local" ]]; then
    source "$HOME/.zshenv.local"
fi

export PATH
export CPLUS_INCLUDE_PATH
export LIBRARY_PATH
export LD_LIBRARY_PATH
export PYTHONPATH
