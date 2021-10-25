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
Plug 'tpope/vim-fugitive'
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
nnoremap n nzzzv
nnoremap N Nzzzv

let mapleader = " "
nnoremap <leader>p :r!
nnoremap <leader>n :NERDTreeFind<CR>
nnoremap <leader>o :FZF<CR>

map <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>
map <C-q> :confirm q<CR>
imap <C-q> <Esc>:confirm q<CR>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

inoremap . .<C-g>u
inoremap ? ?<C-g>u
inoremap ! !<C-g>u
inoremap / /<C-g>u
inoremap [ [<C-g>u
inoremap ] ]<C-g>u
inoremap ( (<C-g>u
inoremap ) )<C-g>u

vnoremap > >gv
vnoremap < <gv
nnoremap < <<
nnoremap > >>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap J :m .+1<CR>== 
nnoremap K :m .-2<CR>== 

""NERDTree
let NERDTreeMapToggleHidden='<C-h>'
""FZF
let FZF_DEFAULT_COMMAND='fd -p -IH -t f -E node_modules -E .git'

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

