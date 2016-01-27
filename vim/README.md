vim_config
==========

Files for my ~/.vim directory

Pre-requisities:

* Install vim: `brew install vim --with-lua` on Mac OS X

Setup:

    git clone git@github.com:clarenceb/vim_config.git ~/.vim 
    ln -s ~/.vim/vimrc ~/.vimrc
    cd ~/.vim
    git submodule init
    git submodule update

VIM plugins used:

* https://github.com/scrooloose/nerdtree
* https://github.com/kien/ctrlp.vim
* https://github.com/rking/ag.vim
** With runtime dependencies on https://github.com/ggreer/the_silver_searcher

    brew install the_silver_searcher

* https://github.com/vim-ruby/vim-ruby
* https://github.com/godlygeek/tabular
* https://github.com/Shougo/neocomplete.vim
* https://github.com/majutsushi/tagbar
** With runtime dependency on exuberant-ctags: http://ctags.sourceforge.net/

    brew install ctags

* https://github.com/fatih/vim-go

These are added as git submodules.

Example for adding new vim plugins:

    cd ~/.vim
    git submodule add https://github.com/tpope/vim-rails.git bundle/rails

Commit and push changes.


Colorscheme:

* https://github.com/fatih/molokai

Add `molokai.vim` to ~/.vim/colors

And this to your .vimrc: `colorscheme molokai`

TODO:
* Install Powerline: https://github.com/Lokaltog/powerline

Happy editing with vim.

