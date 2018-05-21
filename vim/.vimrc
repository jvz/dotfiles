" vim: set ts=2 sts=2 sw=2:
" general settings

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-characterize'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'tpope/vim-vinegar'
Plug 'majutsushi/tagbar'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

call plug#end()

syntax on
filetype plugin indent on

" tabs
set ts=8  " how big are literal tabs
set sts=4 " how many spaces make up fake tabs
set sw=4  " how many spaces to (auto)indent
set et    " expand typed tabs into spaces
set sta   " smart tabs; insert or delete proper amount of spaces

set display=uhex " show hex for unprintable characters

set ccv=1 " auto convert weird file encodings

set nowrap " don't wrap long lines
set nolbr  " don't break long lines either

set ru " show ruler

set nocp " disable vi compatibility
"set cpo=aABceFs " default compatibility options

set bs=indent,eol,start " fix backspace

"set autoindent
set smartindent

set t_Co=16
" Mac Terminal.app doesn't seem to support that

" fsync is slow m'kay
set nofsync

" when using sh highlighting, we are most likely using bash...
let g:is_bash = 1

" change working directory to netrw's working directory
let g:netrw_keepdir = 0

" automatic file backups
set backup
set backupdir=~/.backups

" search stuff
set ignorecase
set smartcase " nullifies ignorecase when there are capital letters in search

" show line numbers
set nu

" background type: light or dark
set bg=dark
colorscheme slate
" TODO: use a different color scheme for gui

" highlight current row and column
"set cuc
set cul

set title " set title changing

set cm=blowfish " use blowfish for encryption

set tenc=utf-8 " terminal uses utf-8 for encoding

" keep cursor position when yanking text
vnoremap y myy`y
vnoremap Y myY`y

" auto use nerdtree
"autocmd vimenter * NERDTree
"autocmd vimenter * if !argc() | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" add gradle syntax highlighting
au BufNewFile,BufRead *.groovy  setf groovy
au BufNewFile,BufRead *.gradle  setf groovy

" enable folds
set foldmethod=marker

" elm files should use 2 space indents
au FileType elm setlocal sw=2
au FileType yaml setlocal sw=2
au FileType ocaml setlocal sw=2

" text files should autowrap
au FileType text setlocal tw=80


" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif
