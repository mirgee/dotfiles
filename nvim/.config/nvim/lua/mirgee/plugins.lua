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
  -- { "machakann/vim-highlightedyank" },
  -- { "editorconfig/editorconfig-vim" },
  -- { "junegunn/fzf", build = './install --all', dir = '~/.fzf' },
  -- { "junegunn/fzf.vim" },
  -- { "justinmk/vim-sneak" },
  -- { "andymass/vim-matchup" },

  -- { "rhysd/vim-clang-format" },
  -- { "mhanberg/elixir.nvim", branch = "main" },
  -- { "elixir-editors/vim-elixir" },
  -- { "vim-python/python-syntax" },
  -- { "fatih/vim-go" },
  -- { "plasticboy/vim-markdown" },
  -- { "cespare/vim-toml", branch = "main" },
  { "hashivim/vim-terraform" },
  { "rust-lang/rust.vim" },
  { "simrat39/rust-tools.nvim" },
  {
    "prettier/vim-prettier",
    build = 'yarn install --frozen-lockfile --production',
    ft = { 'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html' }
  },

  { "tpope/vim-fugitive" },
  { "tpope/vim-surround" },
  { "lewis6991/gitsigns.nvim" },
  { "github/copilot.vim" },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  { "gruvbox-community/gruvbox", branch = "master" },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- { "nvim-lua/lsp_extensions.nvim" },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/cmp-nvim-lsp", branch = "main" },
  { "hrsh7th/cmp-buffer", branch = "main" },
  { "hrsh7th/cmp-path", branch = "main" },
  { "hrsh7th/nvim-cmp", branch = "main" },
  { "hrsh7th/cmp-vsnip", branch = "main" },
  { "hrsh7th/vim-vsnip" },
  { "ray-x/lsp_signature.nvim" },
})
