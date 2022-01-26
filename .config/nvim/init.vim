set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab                             " use the given number of spaces to insert a <Tab>
set relativenumber
set number
set nowrap
set smartcase
set undofile                              " automatically saves undo history to an undo file when writing a buffer to a file
set undodir=~/.config/nvim/undo_history   " undo history dir
set incsearch                             " higlights all strings you search
set mousehide                             " Hides mouse while typing
set hlsearch
set indentkeys                            " ident after certain char
set cursorline
set completeopt=menu,menuone,noselect
"set background=dark  <-- scheint komplett überflüssig
"set clipboard=unnamedplus                 " use system clipboard
"set cc=80

"#
"# Plugins
"#

call plug#begin()
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
call plug#end()

"#
"# Lua customizations
"#

lua << EOF
require('mod_cmp')
require("mod_lsp")
require('mod_telescope')
EOF

"#
"# Shortcuts
"#
let mapleader = " "
nnoremap <leader>p :r!
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
"
nnoremap n nzzzv    " <- centers cursors while searching through files
nnoremap N Nzzzv    " <- centers cursors while searching through files
"
map <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>
map <C-q> :confirm q<CR>
imap <C-q> <Esc>:confirm q<CR>
"
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
"
inoremap . .<C-g>u    " <- create points in the history when those chars are used
inoremap ? ?<C-g>u
inoremap ! !<C-g>u
inoremap / /<C-g>u
inoremap [ [<C-g>u
inoremap ] ]<C-g>u
inoremap ( (<C-g>u
inoremap ) )<C-g>u
"
vnoremap > >gv
vnoremap < <gv
nnoremap < <<
nnoremap > >>
"
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap J :m .+1<CR>== 
nnoremap K :m .-2<CR>== 
"
nnoremap <SPACE> <Nop>    " <- prevents Space executed inline in case leader follows no command

"#
"# Design
"#

highlight CursorLine cterm=NONE ctermbg=234 guibg=darkred 

