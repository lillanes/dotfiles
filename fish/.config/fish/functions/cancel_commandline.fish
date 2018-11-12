# Odd things abound here. I'm using tput to clear the lines (sending el), but
# this seems to affect a different location than printing the new lines (with
# \n). However, \n does affect the cursor, it seems.
function cancel_commandline -d "Clears to the right of cursor, inserts a symbol and sets a new prompt line."
    set -l cmd (commandline)
    if test -n "$cmd"
        # Print symbol at cursor location (and clear the rest of line)
        printf "%s^C%s%s\n" (set_color -r) (set_color normal) (tput el)

        # Jump over extra lines of prompt (and clear the lines for the next prompt)
        set -l prompt_lines (count (fish_prompt))
        for i in (seq 2 $prompt_lines)
            printf "%s\n" (tput el)
        end

        # Jump over lines before cursor (why can't this go before?)
        set -l current_cmd_line (commandline -L)
        for i in (seq 2 $current_cmd_line)
            printf "\n"
        end

        # Clear command line, and repaint
        commandline ""
        commandline -f repaint
    end
end

