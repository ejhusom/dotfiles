# Configs, scripts and snippets

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

Other info:
- The `bashrc` is already set up to include `dotfiles/bin` in `PATH`. 
- The `vimrc` is set up to use the `snippets` folder for auto-completion when
  editing files with Vim.
