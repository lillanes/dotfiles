# VimLike
fish_vi_key_bindings
alias :e vim
alias :q exit

# Disable greeting
set fish_greeting

# Do not abbreviate pwd
set -g fish_prompt_pwd_dir_length 0

function fish_user_key_bindings
    bind -M insert \cc 'commandline ""'
end
