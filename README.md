Environment Setup Files
=======================

This is my personal set of environment configuration files. I use this across
different Unix-like environments. For the most part it's all fairly simple, but
I do try to keep as many things as possible out of my `$HOME` and instead use
the [XDG Base Directory Specification] paths. Details of specific configurations
follow, including a few environment variables that need to be set for everything
to work well.

[XDG Base Directory Specification]: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html

## Usage

The `setup` script copies this repository's directory structure and creates
symbolic links for the config files in `$XDG_CONFIG_HOME`. Loose files (in the
root of the repository) are treated differently and are linked to from `$HOME`,
but with a leading period (i.e., as hidden files).

To set up everything:
```
./setup --all
```

To set up a single thing:
```
./setup thing
```

The `setup` script can also take a `--noconfirm` flag to do everything without
asking for confirmation

## profile

Defines and creates the [XDG Base Directory Specification] paths. Defines
several environment variables that force some applications to respect the XDG
spec. Mostly based on the [relevant ArchWiki page].

[relevant ArchWiki page]: https://wiki.archlinux.org/index.php/XDG_Base_Directory

In addition, it sources `$XDG_CONFIG_HOME/profile`, if it exists. This file is
supposed to hold local system- or machine-specific configs (and is not kept in
this repository).

## Dunst

Very close to the example config provided by dunst. Some cosmetic changes,
correct paths to third party software, and makes notifications appear in the
monitor where the mouse pointer is.

## Less

Use color codes (e.g., for git-diff) and mouse wheel.

## Git

Nothing special. Just setup name and email, editor, mandatory configs, and
aliases I'm used to.

## Python

Hacky startup script to ensure that Python3 keeps its history files in the XDG
cache location.

### Configuration

Depends on the `PYTHONSTARTUP` environment variable, which needs to be set to
`"$XDG_CONFIG_HOME/python/startup.py"`. This is currently set in `profile`.

## Tmux

Changes command prefix to avoid conflicts with vim, and sets up cosmetic and
simple usage preferences.

## Vim

Nothing out of the ordinary. Mostly shortcuts and a few simple utilities and
display preferences. Config files, backups, swap files, undo histories, etc.,
are kept in XDG spec paths.

I use the following plugins (which are kept here as git submodules):

- [gruvbox]: a color scheme
- [altr]: modern version of [a.vim], for alternating between related files
  (e.g., headers)
- [buftabline]: buffer list for vim's tabline
- [clangdestine]: define C and C++ indentation options based on clang-format
- [commentary]: minimal tool for commenting out lines or blocks of code
- [sleuth]: guesses the current file's indentation settings (tabs vs. spaces,
  etc.)
- [YCM-Generator]: automatically generates project configuration files for
  YouCompleteMe
- [YouCompleteMe]: code-completion engine

[gruvbox]: https://github.com/morhetz/gruvbox
[altr]: https://github.com/kana/vim-altr
[buftabline]: https://github.com/ap/vim-buftabline
[clangdestine]: https://github.com/lillanes/vim-clangdestine
[commentary]: https://github.com/tpope/vim-commentary
[sleuth]: https://github.com/tpope/vim-sleuth
[YCM-Generator]: https://github.com/rdnetto/YCM-Generator
[YouCompleteMe]: https://github.com/Valloric/YouCompleteMe
[a.vim]: https://www.vim.org/scripts/script.php?script_id=31

### Configuration

Depends on the `VIMINIT` environment variable, which should to be set to
`":source $XDG_CONFIG_HOME/vim/vimrc"`. Currently set in `profile`.

## Zsh

Vi-like bindings and shortcuts. Typical aliases. Useful completion. Command
corrections. Clean, simple prompt with current directory, mode indicator, error
indication, and timestamp printed after command is entered. Tmux is used
automatically when available.

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
`"$XDG_CONFIG_HOME/zsh"`. This is currently done in `profile`.

