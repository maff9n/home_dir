"Vim Inbuild Settings
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
syntax on
filetype plugin indent on


"Plugin Managment
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
Plug 'preservim/nerdtree'
Plug 'rust-lang/rust.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
set rtp+=~/.local/bin/fzf


"Shortcuts/Mapping
""Vim
nnoremap # <Nop>
nnoremap ' <Nop>
nnoremap <SPACE> <Nop>
let mapleader = " "
nnoremap <leader>n :NERDTreeFind<CR>
nnoremap <leader>o :FZF<CR>
map ü <C-w>q
map Ü :on<CR>
map ä <C-w>s
map ö <C-w>v 
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
""NERDTree
let NERDTreeMapToggleHidden='<C-h>'


"ColorThemes
""Vim
colorscheme gruvbox
set background=dark
""Airline
let g:airline_theme='gruvbox'





