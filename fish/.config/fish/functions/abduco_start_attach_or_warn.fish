function abduco_start_attach_or_warn -d "Attaches to a given session or starts it (defaults to \"default\"), unless already attached to something."
    if set -q ABDUCO_SESSION
        echo "Attaching from within attached session?"
        return 1
    end
    set -l SESSION "default"
    if test -n "$argv[1]"
        set SESSION "$argv[1]"
    end
    abduco -A $SESSION
end

