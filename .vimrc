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
nnoremap # <Nop>
nnoremap ' <Nop>
nnoremap <SPACE> <Nop>

let mapleader = " "
nnoremap <leader>n :NERDTreeFind<CR>
nnoremap <leader>o :FZF<CR>
nnoremap <leader>p :r!

map <C-s> :w<CR>
map <C-q> :confirm q<CR>
map Ü :on<CR>
map ä <C-w>s
map ö <C-w>v 
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
""NERDTree
let NERDTreeMapToggleHidden='<C-h>'
""FZF
"let FZF_DEFAULT_OPTS='fd --hidden'

"ColorThemes
""Vim
colorscheme gruvbox
set background=dark
""Airline
let g:airline_theme='gruvbox'
""FZF
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }



let g:airline_powerline_fonts = 1
