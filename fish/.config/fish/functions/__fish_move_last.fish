function __fish_move_last --description 'Move the last element of a directory history from src to dest'
	set -l src $argv[1]
    set -l dest $argv[2]

    set -l size_src (count $$src)

    if test $size_src = 0
        # Cannot make this step
        printf (_ "Hit end of history…\n")
        return 1
    end

    # Append current dir to the end of the destination
    # LI: use -L flag to avoid expanding symlinks in dir history
    set -g (echo $dest) $$dest (command pwd -L)

    set ssrc $$src

    # Change dir to the last entry in the source dir-hist
    builtin cd $ssrc[$size_src]

    # Keep all but the last from the source dir-hist
    set -e (echo $src)\[$size_src]

    # All ok, return success
    return 0
end
