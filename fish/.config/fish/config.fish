# VimLike
fish_vi_key_bindings
alias :e vim
alias :q exit
set -g fish_escape_delay_ms 10

# Cursor shapes
set -g fish_cursor_insert line
set -g fish_cursor_replace_one underscore

# Disable greeting
set fish_greeting

# Do not abbreviate pwd
set -g fish_prompt_pwd_dir_length 0

function fish_user_key_bindings
    # C-c clears command line instead of breaking and starting a new one, this
    # works well with multiline prompts (default behavior does not):
    bind --mode insert \cc 'commandline ""'
    # In other modes, C-c changes mode:
    bind --mode default --sets-mode insert \cc force-repaint
    bind --mode replace_one --sets-mode default \cc force-repaint
    bind --mode visual --sets-mode default \cc end-selection force-repaint

    # Workaround for usable delete key in st:
    bind --mode insert \e\[P delete-char
    bind --mode default \e\[P delete-char
    bind --mode replace_one --sets-mode default \e\[P force-repaint
    bind --mode visual --sets-mode default \e\[P kill-selection end-selection force-repaint
end
