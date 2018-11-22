function fish_right_prompt --description 'Display Vi-mode on right side'
    switch $fish_bind_mode
        case default
            set_color --bold yellow
            printf '[NORMAL]'
        case insert
            set_color --bold blue
            printf '[INSERT]'
        case replace_one
            set_color --bold cyan
            printf '[REPLACE]'
        case visual
            set_color --bold magenta
            printf '[VISUAL]'
        case paste
            set_color --bold red
            printf '[PASTE]'
        case '*'
            set_color --bold brred
            printf '[?]'
    end
    set_color normal
end

