Mac OS X Dotfiles
------------------

Dotfiles managed by RCM:

* Tmux
* Atom (editor)
* Vim + plugins

Getting started:
================

* `brew tap thoughtbot/formulae`
* `brew install rcm`
* `git clone git@github.com:clarenceb/dotfiles_osx.git ~/.dotfiles`  
* `ln -s ~/.dotfiles/rcrc ~/.rcrc`
* `rcup`
* `lsrc`

Vim plugins:
============

Vundle is used to manage plugins.

See: https://github.com/VundleVim/Vundle.vim#quick-start

Starting from scratch:

```sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Launch `vim` and run `:PluginInstall`
or from command line: `vim +PluginInstall +qall`

To list plugins, launch `vim` and run `:PluginList`
