set nocompatible
set esckeys
set ttyfast

set clipboard=unnamedplus

set title
set number
set ruler
set hidden

set background=dark
set incsearch

set nohlsearch

set ignorecase
set smartcase

set lazyredraw
set showmatch

set backspace=indent,eol,start
set nowrap
set linebreak

set encoding=utf8

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=8
set expandtab

set wildmode=longest,list,full
set wildmenu

set listchars=tab:»·,trail:·
set list

inoremap <S-Tab> <C-V><Tab>

hi Normal guifg=white guibg=black
hi SpecialKey ctermfg=4 guifg=#3465a4
hi NonText    ctermfg=4 guifg=#3465a4

cmap w!! w !sudo tee % >/dev/null

syntax on
let c_no_curly_error=1

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
call plug#end()
