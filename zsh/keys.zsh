# Put the terminal in 'application mode' when using zle. This enables using
# terminfo correctly.
function zle-line-init() { echoti smkx }
function zle-line-finish() { echoti rmkx }
zle -N zle-line-init
zle -N zle-line-finish

# home and end keys
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line

# delete
bindkey "${terminfo[kdch1]}" delete-char

# C-left and C-right
bindkey "${terminfo[kLFT5]}" backward-word
bindkey "${terminfo[kRIT5]}" forward-word
