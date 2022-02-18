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

-- Aesthetic
require'nvim-treesitter.configs'.setup { ensure_installed = "maintained", highlight = { enable = true } }
