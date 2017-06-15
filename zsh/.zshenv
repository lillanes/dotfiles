# pyenv
PATH="$HOME/.pyenv/bin:$PATH"

# my own local stuff
PATH="$HOME/.local/bin:$PATH"

# export and run stuff that needs to be run
export PATH
eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
