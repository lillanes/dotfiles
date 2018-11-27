Environment Setup Files
=======================

This is my personal set of environment configuration files. I use this across
different Unix-like environments. For the most part it's all fairly simple, but
I do try to keep as many things as possible out of my `$HOME` and instead use
the [XDG Base Directory Specification] paths. Details of specific configurations
follow, including a few environment variables that need to be set for everything
to work well.

[XDG Base Directory Specification]: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html

## Git

Nothing special. Just setup name and email, and aliases I'm used to.

## Python

Hacky startup script to ensure that Python3 keeps its history files in the XDG
cache location.

### Configuration

Depends on the `PYTHONSTARTUP` environment variable, which needs to be set to
`"$XDG_CONFIG_HOME/python/startup.py"`.

## Vim

Nothing out of the ordinary. Mostly shortcuts and a few simple utilities and
display preferences. Config files, backups, swap files, undo histories, etc.,
are kept in XDG spec paths.

I use the following plugins (which are kept here as git submodules):

- [gruvbox]: a color scheme
- [altr]: modern version of [a.vim], for alternating between related files
  (e.g., headers)
- [buftabline]: buffer list for vim's tabline
- [commentary]: minimal tool for commenting out lines or blocks of code
- [sleuth]: guesses the current file's indentation settings (tabs vs. spaces,
  etc.)
- [vimwiki]: maintain a personal wiki for keeping notes
- [YCM-Generator]: automatically generates project configuration files for
  YouCompleteMe
- [YouCompleteMe]: code-completion engine

[gruvbox]: https://github.com/morhetz/gruvbox
[altr]: https://github.com/kana/vim-altr
[buftabline]: https://github.com/ap/vim-buftabline
[commentary]: https://github.com/tpope/vim-commentary
[sleuth]: https://github.com/tpope/vim-sleuth
[vimwiki]: https://github.com/vimwiki/vimwiki
[YCM-Generator]: https://github.com/rdnetto/YCM-Generator
[YouCompleteMe]: https://github.com/Valloric/YouCompleteMe
[a.vim]: https://www.vim.org/scripts/script.php?script_id=31

### Configuration

Depends on the `VIMINIT` environment variable, which should to be set to
`":source $XDG_CONFIG_HOME/vim/vimrc"`.

## Zsh

Vi-like bindings and shortcuts. Typical aliases. Useful completion. Command
corrections. Clean, simple prompt.

Cached files and configuration files (mostly) follow the XDG spec (`.zshrc` and
others still need to have the dot in the name, so I work around that with
symlinks).

I also use a couple of plugins (to imitate the best parts of the [fish shell]):

- [zsh-autosuggestions]: display best guess for current command
- [zsh-syntax-highlighting]: syntax highlighting of current command

[zsh-autosuggestions]: https://github.com/zsh-users/zsh-autosuggestions
[zsh-syntax-highlighting]: https://github.com/zsh-users/zsh-syntax-highlighting
[fish shell]: https://fishshell.com

### Configuration

Requires that the environment variable `ZDOTDIR` be set to
`"$XDG_CONFIG_HOME/zsh"`. In addition, the `$XDG_CACHE_HOME/zsh` directory needs
to exist.

### To-do

Zsh should create the cache directory if it doesn't exist.
