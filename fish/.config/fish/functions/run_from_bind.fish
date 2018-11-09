function run_from_bind -d "Adds line breaks to ensure output of whatever is being run appears in a new line and the prompt is shown correctly."
    printf "\n"
    eval $argv
    set -l line_count (count (fish_prompt))
    for _ in (seq 2 $line_count)
        printf "\n"
    end
    commandline -f repaint
end

