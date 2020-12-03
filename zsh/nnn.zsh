# use nuke to open files
export NNN_OPENER="$XDG_CONFIG_HOME/nnn/plugins/nuke"

# plugins:
#  - preview-tabbed: open a tabbed window (gui)
#  - preview-tui: open in terminal (tmux split)
export NNN_PLUG='P:preview-tabbed;p:preview-tui'

# use as alias to enable cd on quit
nnn ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # cd on quit only on ^G
    NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    command nnn -acd "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}
