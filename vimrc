"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Required Vundle setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'VundleVim/Vundle.vim'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle plugins to install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'rking/ag.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'scrooloose/nerdtree'
Bundle 'godlygeek/tabular'
Bundle 'fatih/vim-go'
Bundle 'majutsushi/tagbar'
Bundle 'Shougo/neocomplete.vim'
Bundle 'mileszs/ack.vim'
Bundle 'rbgrouleff/bclose.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'godlygeek/csapprox'
Bundle 'scrooloose/syntastic'
Bundle 'bling/vim-airline'
Bundle 'edkolev/tmuxline.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'eagletmt/neco-ghc'
Bundle 'junegunn/goyo.vim'
Bundle 'vim-scripts/mru.vim'
Bundle 'amix/vim-zenroom2'
Bundle 'tpope/vim-endwise'
Bundle 'lambdatoast/elm.vim'

" Conclude Vundle setup (plugins must appear above thgis line).
call vundle#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable filetype plugins
filetype on           " Enable filetype detection
filetype plugin on    " Enable filetype-specific indenting
filetype indent on    " Enable filetype-specific plugins

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't make noises!
set noerrorbells

"Always show current position
set ruler

" Line numbering
set number


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Set the colour scheme
colorscheme molokai

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""" Plugin: nerdtree

" Keymappings
map <C-\> :NERDTreeFind<CR>
map <F2> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

"""""""""" Plugin: syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"""""""""" Plugin: ag.vim
let g:agprg="ag --column"

""""""""""" Plugin: vim-go
""""""""""" See: https://github.com/fatih/vim-go

" disable download of binaries
let g:go_disable_autoinstall = 1
" format with goimports instead of gofmt
let g:go_fmt_command = "goimports"
" enable auto fmt on save
let g:go_fmt_autosave = 1

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" Show a list of interfaces which is implemented by the type under your cursor
au FileType go nmap <Leader>s <Plug>(go-implements)

au FileType go nmap <Leader>r <Plug>(go-run)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap <Leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)

"""""""""" Plugin: vim-airline
set laststatus=2  " Show bar without needing a split

"""""""""" Plugin: neocomplete
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1

"""""""""" Plugin: tagbar
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : '~/.vim-go/gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

