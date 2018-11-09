function fish_prompt --description 'Write out the prompt'
    #Save the return status of the previous command
    set stat $status

    switch "$USER"
        case root toor
            set_color -o red
            set prompt "#"
        case '*'
            set_color -o blue
            set prompt "%"
    end
    printf "%s@%s " $USER (prompt_hostname)
    set_color $fish_color_cwd
    printf "%s \n" (prompt_pwd)
    if test $stat -gt 0
        set_color -o red
        printf " (%s) %% " $stat
    else
        set_color normal
        printf " %s " $prompt
    end
end
