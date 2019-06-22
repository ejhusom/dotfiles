# Configuration files

This repository contains configuration files for various programs. Feel free to use it (or parts of it), or just get some ideas.

## Installation

1. Clone repository in home folder:
```
$ git clone https://github.com/ejhusom/dotfiles ~/dotfiles
```
2. Create necessary symlinks:
```
$ ln -s ~/dotfiles/vimrc ~/.vimrc
$ ln -s ~/dotfiles/bashrc ~/.bashrc
$ ln -s ~/dotfiles/ ~/.vim
```

3. To use bash scripts, add bin to PATH by adding the following to `~/.profile`
   (for Linux):
```
# set PATH so it includes bin from dotfiles
if [ -d "$HOME/dotfiles/bin" ] ; then
    PATH="$HOME/dotfiles/bin:$PATH"
fi
```

