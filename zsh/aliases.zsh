## Traditional aliases

# ls: color, file type indicator, human readable sizes
alias ls='ls --color=auto --indicator-style=classify -h'
# ll: same as ls, but in long listing format
alias ll='ls -l'
# la: same as ll, but include hidden files
alias la='ll -a'

# cp, mv, rm: include safety measure
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'