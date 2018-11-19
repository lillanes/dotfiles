function fish_prompt --description 'Write out the prompt'
    set previous_exit_code $status

    switch "$USER"
        case root toor
            set user_color (set_color --bold red)
            set fish_prompt_symbol "#"
        case '*'
            set user_color (set_color --bold blue)
            set fish_prompt_symbol "%%"
    end

    if test $previous_exit_code -gt 0
        set prompt_color (set_color --bold red)
        set error_message " ($previous_exit_code)"
    else
        set prompt_color (set_color normal)
        set error_message ""
    end

    set hostname (prompt_hostname)
    set cwd (prompt_pwd)

    set cwd_color (set_color $fish_color_cwd)

    set length (string length "$USER@$hostname $cwd")
    if test $length -gt $COLUMNS
        set -l remove (math $length - $COLUMNS + 1 + 3)
        set -l wd (string sub --start $remove $cwd)
        set cwd "...$wd"
    end

    printf "$user_color$USER@$hostname $cwd_color$cwd\n"
    printf "$prompt_color$error_message $fish_prompt_symbol "
end
