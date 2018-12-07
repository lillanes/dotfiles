# This key will be used both to attach/create and to detach
ABDUCO_KEY="^A"
function abduco-run {
    if [ -n "$BUFFER" ]; then
        printf '\n'
        # write command to history
        print -s $BUFFER
        # run it in abduco session
        SESSION_NUMBER=$(($(abduco | grep -o '[0-9]\+$' | sort -rh | head -n 1) + 1))
        SESSION_NAME="$USER-run-$SESSION_NUMBER"
        abduco -ce "$ABDUCO_KEY" "$SESSION_NAME" ${(z)BUFFER} < /dev/tty
        # update history
        fc -R
        printf '\n'
        BUFFER=''
        zle reset-prompt
    fi
}
zle -N abduco-run
bindkey "$ABDUCO_KEY" abduco-run
