syntax on
filetype plugin indent on

" set clipboard=unnamedplus to use the system clipboard ???

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'dense-analysis/ale'
Plug 'rust-lang/rust.vim'
call plug#end()

nnoremap # <Nop>
nnoremap ' <Nop>
nnoremap <SPACE> <Nop>

let mapleader = " "
nnoremap <leader>n :NERDTreeFocus<CR>

"set shell=zsh
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab
set relativenumber
set nu
set nowrap
set smartcase
set undodir=~/.vim/undodir
set undofile
set incsearch
set smartindent

" **** window managment ****
map ü <C-w>q
map Ü :on<CR>
map ä <C-w>s
map ö <C-w>v 
"map ' <C-w>=
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

colorscheme gruvbox
set background=dark

let b:ale_fixers = ['prettier', 'eslint']
let g:ale_fix_on_save = 1
