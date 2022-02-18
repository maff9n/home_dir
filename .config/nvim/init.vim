set encoding=UTF-8
set tabstop=4 
set scrolloff=777                         " keeps the cursor in the middle of the screen when it is not at the beginning or end of the file
set autoread
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
"set background=dark  <-- scheint komplett überflüssig
"set clipboard=unnamedplus                 " use system clipboard
"set cc=80

"#
"# Plugins
"#

call plug#begin()
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
call plug#end()

"#
"# Lua customizations
"#

nnoremap gd <Nop>

lua require("mod_lsp")
lua require("mod_telescope")

"#
"# Shortcuts
"#

let mapleader = " "
nnoremap <leader>ff <cmd>Telescope find_files cwd=~<cr>
nnoremap <leader>p :r!

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

