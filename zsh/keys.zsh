# Put the terminal in 'application mode' when using zle. This enables using
# terminfo correctly.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init() { echoti smkx }
    function zle-line-finish() { echoti rmkx }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

# home and end keys
(( ${+terminfo[khome]} )) && bindkey "${terminfo[khome]}" beginning-of-line
(( ${+terminfo[khome]} )) && bindkey "${terminfo[kend]}" end-of-line

# delete
(( ${+terminfo[kdch1]} )) && bindkey "${terminfo[kdch1]}" delete-char

# C-left and C-right
(( ${+terminfo[kLFT5]} )) && bindkey "${terminfo[kLFT5]}" backward-word
(( ${+terminfo[kRIT5]} )) && bindkey "${terminfo[kRIT5]}" forward-word

(( ${+terminfo[kpp]} )) && bindkey -s "${terminfo[kpp]}" "\a"
(( ${+terminfo[knp]} )) && bindkey -s "${terminfo[knp]}" "\a"
