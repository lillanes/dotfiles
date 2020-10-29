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

## Replace right side prompt with timestamp after accepting command
function replace-rprompt-with-timestamp {
    OLD_PROMPT="$RPROMPT"
    RPROMPT="%F{white}[%D{%Y-%m-%f %H:%M:%S}]%f"
    zle reset-prompt
    RPROMPT="$OLD_PROMPT"
    zle .accept-line
}
zle -N accept-line replace-rprompt-with-timestamp

## Replace right side prompt with red timestamp after aborting command
# This has some issues: receiving INT while on a minibuffer, for example, will
# exit the minibuffer and set a red timestamp instead of the current mode
function replace-rprompt-with-red-timestamp {
    OLD_PROMPT="$RPROMPT"
    RPROMPT="%F{red}[%D{%Y-%m-%f %H:%M:%S}]%f"
    zle reset-prompt
    RPROMPT="$OLD_PROMPT"
    zle send-break
}
trap 'replace-rprompt-with-red-timestamp' INT
