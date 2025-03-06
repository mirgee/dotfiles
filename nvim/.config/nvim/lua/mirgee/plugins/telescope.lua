return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    defaults = {
      -- Default configuration for telescope goes here:
      -- config_key = value,
      layout_strategy = "vertical",
      layout_config = {
        vertical = { width = 0.9 },
        preview_height = 0.3,
      },
      mappings = {
        i = {
          -- map actions.which_key to <C-h> (default: <C-/>)
          -- actions.which_key shows the mappings for your picker,
          -- e.g. git_{create, delete, ...}_branch for the git_branches picker

          ["<C-Down>"] = require("telescope.actions").cycle_history_next,
          ["<C-Up>"] = require("telescope.actions").cycle_history_prev,
        },
      },
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
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
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)

    local utils = require("telescope.utils")
    local builtin = require("telescope.builtin")


    vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
    vim.keymap.set("n", "<leader>gc", builtin.git_commits, {})
    vim.keymap.set("n", "<leader>gb", builtin.git_branches, {})
    vim.keymap.set("n", "<leader>gs", builtin.git_status, {})

    vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fh", function()
      builtin.find_files({
        hidden = true,
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

    vim.keymap.set("n", "<leader>wg", function ()
      builtin.live_grep({
        hidden = true
      })
    end, {})
    vim.keymap.set("n", "<leader>w/", builtin.current_buffer_fuzzy_find, {})
    vim.keymap.set("n", "<leader>wt", builtin.help_tags, {})
    vim.keymap.set("n", "<leader>wh", builtin.search_history, {})
    vim.keymap.set("n", "<leader>R", builtin.resume, {})

    vim.keymap.set("n", "<leader>ly", builtin.lsp_dynamic_workspace_symbols, {})
    vim.keymap.set("n", "<leader>ld", builtin.diagnostics, {})
  end,
}
