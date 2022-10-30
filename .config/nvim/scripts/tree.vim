lua << END
-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = "x", action = "close_node" },
      },
    },
  },
  renderer = {
    group_empty = true,
    icons = {
       show = {
         file = true,
         folder = true,
         folder_arrow = true,
         git = true,
       }
    }
  },
  filters = {
    dotfiles = true,
  },
})
END
