import atexit
import readline
import os
import sys

oldhook = getattr(sys, '__interactivehook__', None)
if oldhook:
    def newhook():
        oldhook()
        atexit.unregister(readline.write_history_file)

        cache_path = os.path.join(os.path.expandvars("$HOME"), ".cache/python")
        if 'XDG_CACHE_PATH' in os.environ:
            cache_path = os.path.join(os.path.expandvars("$XDG_CACHE_PATH"),
                    "python")

        try:
            os.makedirs(cache_path, exist_ok=True)
            histfile_name = "history"
        except OSError:
            cache_path = os.path.expandvars("$HOME")
            histfile_name = ".python_history"

        histfile = os.path.join(cache_path, histfile_name)

        try:
            readline.read_history_file(histfile)
            readline.set_history_length(1000)
        except FileNotFoundError:
            pass

        atexit.register(readline.write_history_file, histfile)

    sys.__interactivehook__ = newhook
