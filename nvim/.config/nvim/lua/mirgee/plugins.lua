local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "rust-lang/rust.vim" },
  { "simrat39/rust-tools.nvim" },

  { "tpope/vim-fugitive" },
  { "tpope/vim-surround" },
  { "lewis6991/gitsigns.nvim" },

  { "zbirenbaum/copilot.lua" },

  { "numToStr/Comment.nvim" },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  { "gruvbox-community/gruvbox", branch = "master" },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
      },
    },
  },

  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
    keys = { -- load the plugin only when using it's keybinding:
      { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "hrsh7th/nvim-cmp",
    branch = "main",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp", branch = "main" },
      { "hrsh7th/cmp-nvim-lua", branch = "main" },
      { "hrsh7th/cmp-buffer", branch = "main" },
      { "hrsh7th/cmp-path", branch = "main" },
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
      { "saadparwaiz1/cmp_luasnip" },
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
      },
      { "rafamadriz/friendly-snippets" },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim" },
      { "ray-x/lsp_signature.nvim" },
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
        callback = function(event)
          local telescope = require("telescope.builtin")
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
          map("gd", telescope.lsp_definitions, "[G]oto [D]efinition")
          map("gi", telescope.lsp_implementations, "[G]oto [I]mplementation")
          map("gr", telescope.lsp_references, "[G]oto [R]eferences")
          map("K", vim.lsp.buf.hover, "Hover Documentation")
          map("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
          map("<leader>D", telescope.lsp_type_definitions, "Type [D]efinition")
          map("<leader>r", vim.lsp.buf.rename, "[R]e[n]ame")
          map("<leader>a", function()
            vim.lsp.buf.code_action({ context = { only = { "quickfix", "refactor", "source" } } })
          end, "[C]ode [A]ction")
          map("<space>e", vim.diagnostic.open_float, "Open float")
          -- map("<space>g", vim.diagnostic.set+loclist, "Set loclist")
          map("[d", vim.diagnostic.goto_prev, "Goto next diagnostic")
          map("]d", vim.diagnostic.goto_next, "Goto previous diagnostic")
          map("<space>f", vim.lsp.buf.format, "Format")
        end,
      })
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = {
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { { "prettierd", "prettier" } },
      },
    },
  },

  { "ThePrimeagen/harpoon" },
})
