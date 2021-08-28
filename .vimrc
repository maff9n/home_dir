syntax on

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'francoiscabrol/ranger.vim'
call plug#end()

set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab
set nu
set nowrap
set smartcase
set undodir=~/.vim/undodir
set undofile
set incsearch
set smartindent

" **** window managment ****
map ö <C-w>x  
map ü :execute RangerCurrentDirectory
map ä <C-w>s
map # <C-w>v 
" ** sycle through windows **


map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

