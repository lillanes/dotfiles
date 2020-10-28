# spelling correction for commands and parameters
setopt correct
setopt correctall

# Print error exit codes. Set as an event triggered after exit of the current
# function, because print_exit_value gets restored on exit (and we are
# currently inside an anonymous function defined in zshrc).
trap 'setopt print_exit_value' EXIT
