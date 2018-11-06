# VimLike
fish_vi_key_bindings
alias :e vim
alias :q exit
set -g fish_escape_delay_ms 10

# Disable greeting
set fish_greeting

# Do not abbreviate pwd
set -g fish_prompt_pwd_dir_length 0

function fish_user_key_bindings
    # C-c clears command line instead of breaking and starting a new one, this
    # works well with multiline prompts (default behavior does not):
    bind -M default \cc 'commandline ""'
    bind -M insert \cc 'commandline ""'
    bind -M replace \cc 'commandline ""'
    bind -M visual \cc 'commandline ""'
    # Workaround for usable delete key in st:
    bind -M insert \e\[P delete-char
end
