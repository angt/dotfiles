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

set nobackup
set nowb
set noswapfile

inoremap <S-Tab> <C-V><Tab>

hi Normal guifg=white guibg=black
hi SpecialKey ctermfg=4 guifg=#3465a4
hi NonText    ctermfg=4 guifg=#3465a4
hi ALEError   ctermbg=none cterm=underline

cmap w!! w !sudo tee % >/dev/null
map ° /TODO<ENTER>

syntax on
let c_no_curly_error=1

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 25
let g:is_posix = 1
let g:ctrlp_map = '<c-p>'
let g:ale_lint_on_text_changed = 'never'
let g:ale_c_clangtidy_checks = []

au FileType sh   setl sw=4 sts=4 ts=4 noet
au FileType lua  setl sw=2 sts=2 ts=2 et
au BufRead,BufNewFile *.*sh setfiletype sh

call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'rust-lang/rust.vim'
Plug 'chrisbra/unicode.vim'
call plug#end()
