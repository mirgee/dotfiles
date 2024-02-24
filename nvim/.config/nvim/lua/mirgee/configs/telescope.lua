require("telescope").setup({
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker

        ["<C-Down>"] = require("telescope.actions").cycle_history_next,
        ["<C-Up>"] = require("telescope.actions").cycle_history_prev,
      },
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
})

local utils = require("telescope.utils")
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
vim.keymap.set("n", "<leader>gc", builtin.git_commits, {})
vim.keymap.set("n", "<leader>gb", builtin.git_branches, {})
vim.keymap.set("n", "<leader>gs", builtin.git_status, {})

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fh", function()
  builtin.find_files({
    hidden = true
  })
end, {})
vim.keymap.set("n", "<leader>fr", function()
  builtin.find_files({
    cwd = utils.buffer_dir(),
  })
end, {})
vim.keymap.set("n", "<leader>fo", function()
  builtin.oldfiles({
    only_cwd = true,
  })
end, {})
vim.keymap.set("n", "<leader>fO", builtin.oldfiles, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})

vim.api.nvim_set_keymap("n", "<leader>fe", ":Telescope file_browser<CR>", { noremap = true })
vim.api.nvim_set_keymap(
  "n",
  "<space>fE",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true }
)

vim.keymap.set("n", "<leader>wg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>wt", builtin.help_tags, {})
vim.keymap.set("n", "<leader>wh", builtin.search_history, {})
vim.keymap.set("n", "<leader>R", builtin.resume, {})

vim.keymap.set("n", "<leader>ly", builtin.lsp_dynamic_workspace_symbols, {})
vim.keymap.set("n", "<leader>ld", builtin.lsp_definitions, {})
vim.keymap.set("n", "<leader>lr", builtin.lsp_references, {})
vim.keymap.set("n", "<leader>li", builtin.lsp_implementations, {})
