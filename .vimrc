set nocompatible
set esckeys
set ttyfast

set clipboard=unnamed

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

set scrolloff=16

inoremap <S-Tab> <C-V><Tab>

hi Normal guifg=white guibg=black
hi SpecialKey ctermfg=4 guifg=#3465a4
hi NonText    ctermfg=4 guifg=#3465a4

cmap w!! w !sudo tee % >/dev/null

syntax on
let c_no_curly_error=1
let g:is_posix = 1

let g:ctrlp_map = '<c-p>'

au FileType sh   setl sw=4 sts=4 ts=4 noet
au FileType lua  setl sw=2 sts=2 ts=2 et

let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_open = 1
let g:syntastic_enable_perl_checker = 1
let g:syntastic_go_checkers = ['go', 'gofmt', 'golint' , 'govet']
let g:syntastic_lua_checkers = ["luac", "luacheck"]
let g:syntastic_lua_luacheck_args = "--no-unused-args"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_pony_checkers = ['currycomb']

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'vim-syntastic/syntastic'
Plug 'rust-lang/rust.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'dleonard0/pony-vim-syntax'
Plug 'killerswan/pony-currycomb.vim'
call plug#end()
