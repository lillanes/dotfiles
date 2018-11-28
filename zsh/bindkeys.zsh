# This key will be used both to attach/create and to detach
ABDUCO_KEY="^A"
function abduco-attach-or-create {
    if [ -n "$ABDUCO_SESSION" ]; then
        echo "here"
        return 1
    fi
    ABDUCO_SESSION_NAME="${BUFFER:-default}"
    printf '\n'
    abduco -Ae "$ABDUCO_KEY" "$ABDUCO_SESSION_NAME" < /dev/tty
    printf '\n'
    zle reset-prompt
}
zle -N abduco-attach-or-create
bindkey "$ABDUCO_KEY" abduco-attach-or-create
