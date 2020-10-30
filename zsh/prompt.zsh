## Enable expansions
setopt prompt_subst

## Define colors
# username in red if shell is privileged (e.g., root), blue otherwise
usercolor='%(!.%F{red}.%F{blue})'
# working directory in green
pwdcolor='%F{green}'
# shell symbol in fg (white) or red if last command resulted in error
symbolcolor='%(?.%F{fg}.%F{red})'
# Define prompt itself
PROMPT='%B$usercolor$USER@$HOST $pwdcolor%~
 $symbolcolor%# %b%f'

## Display current vi mode on right side prompt
insert_mode_prompt='%B%F{blue}[INSERT]'
normal_mode_prompt='%B%F{yellow}[NORMAL]'
precmd() {
    RPROMPT=$insert_mode_prompt
}
function mode-prompt-toggle {
    RPROMPT='${${KEYMAP/vicmd/$normal_mode_prompt}/(main|viins)/$insert_mode_prompt}'
    zle reset-prompt
}
zle -N zle-keymap-select mode-prompt-toggle

## Display timestamp on right side before running a command
# (not actually part of the prompt, but feel prompt-like)
preexec() {
    tput cuu 1             # move up
    tput cuf $(tput cols)  # move to end of line
    tput cub 21            # move back so timestamp fits
    tput ich 21            # make space to avoid overwriting important data
    printf "$fg[white]%s$fg[default]\n" "$(date +'[%F %H:%M:%S]')"
}

# Hide right prompt for past lines
setopt transient_rprompt
