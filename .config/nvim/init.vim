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
set clipboard=unnamedplus                 " use system clipboard
set cursorline " <-- I would use it if id look good
"set cc=80

highlight CursorLine cterm=NONE ctermbg=darkgray guibg=darkred 

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

set completeopt=menu,menuone,noselect

lua << EOF

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
snippet = {
  -- REQUIRED - you must specify a snippet engine
  expand = function(args)
    vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
  end,
},
mapping = {
  ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
  ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
  ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
  ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
  ['<C-e>'] = cmp.mapping({
    i = cmp.mapping.abort(),
    c = cmp.mapping.close(),
  }),
  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
},
sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  { name = 'vsnip' }, -- For vsnip users.
  -- { name = 'luasnip' }, -- For luasnip users.
  -- { name = 'ultisnips' }, -- For ultisnips users.
  -- { name = 'snippy' }, -- For snippy users.
}, {
  { name = 'buffer' },
})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
sources = {
  { name = 'buffer' }
}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
sources = cmp.config.sources({
  { name = 'path' }
}, {
  { name = 'cmdline' }
})
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.

require('myluamodule')

require("telescope").setup{
    defaults = {

        file_ignore_patterns = {"node_modules"},
            
        mappings = {
            n = {
                    ["<esc>"] = require('telescope.actions').close,
                    --["<C-h>"] = require("telescope.builtin").find_files({hidden=true})
                },
            i = {
                    ["<esc>"] = require('telescope.actions').close
                }
            }
    }
}

require'lspconfig'.rnix.setup{}

require'lspconfig'.bashls.setup{
    cmd = { "bash-language-server", "start" },
    cmd_env = { GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)" }
}

require'lspconfig'.hie.setup{}

require'lspconfig'.rls.setup{}
EOF

let g:LanguageClient_serverCommands = { 'sh': ['bash-language-server', 'start'] }

"Shortcuts/Mapping
nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap <SPACE> <Nop>
let mapleader = " "
nnoremap <leader>p :r!
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>


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

set background=dark
