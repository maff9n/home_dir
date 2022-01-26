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

