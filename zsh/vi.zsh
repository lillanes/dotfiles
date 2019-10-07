# Vi-like bindings
bindkey -v
export KEYTIMEOUT=1
alias :e='vim'
alias :q='exit'

# backspace through edit start point
bindkey "^?" backward-delete-char
