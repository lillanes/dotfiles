autoload colors; colors

# setup LS_COLORS environment variable (if unset)
[ -z "$LS_COLORS" ] && eval $(dircolors -b)
