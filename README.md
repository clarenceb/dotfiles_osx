Mac OS X Dotfiles
------------------

Dotfiles managed by RCM:

* Tmux
* Atom (editor)
* Vim + plugins

Getting started:
================

* `brew install git rcm`
* `git clone git@github.com:clarenceb/dotfiles_osx.git ~/.dotfiles`  
* `ln -s ~/.dotfiles/rcrc ~/.rcrc`
* `rcup`
* `lsrc`

Vim plugins:
============

Add new plugins via git submodules:

```sh
git submodule add https://github.com/lukerandall/haskellmode-vim.git vim/bundle/haskellmode-vim
```

