# Vi mode indicator
function fish_right_prompt
    switch $fish_bind_mode
        case default
            set_color --bold yellow
            echo '[NORMAL]'
        case insert
            set_color --bold blue
            echo '[INSERT]'
        case replace_one
            set_color --bold cyan
            echo '[REPLACE]'
        case visual
            set_color --bold brmagenta
            echo '[VISUAL]'
        case '*'
            set_color --bold red
            echo '[?]'
    end
    set_color normal
end

