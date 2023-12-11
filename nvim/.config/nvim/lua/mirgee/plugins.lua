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
  { "editorconfig/editorconfig-vim" },
  { "justinmk/vim-sneak" },
  { "tpope/vim-surround" },
  { "itchyny/lightline.vim" },
  { "machakann/vim-highlightedyank" },
  { "andymass/vim-matchup" },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "nvim-tree/nvim-tree.lua" },
  { "tpope/vim-fugitive" },
  { "airblade/vim-gitgutter" },
  { "junegunn/fzf", build = './install --all', dir = '~/.fzf' },
  { "junegunn/fzf.vim" },
  { "neovim/nvim-lspconfig" },
  { "nvim-lua/lsp_extensions.nvim" },
  { "hrsh7th/cmp-nvim-lsp", branch = "main" },
  { "hrsh7th/cmp-buffer", branch = "main" },
  { "hrsh7th/cmp-path", branch = "main" },
  { "hrsh7th/nvim-cmp", branch = "main" },
  { "ray-x/lsp_signature.nvim" },
  { "simrat39/rust-tools.nvim" },
  { "hrsh7th/cmp-vsnip", branch = "main" },
  { "hrsh7th/vim-vsnip" },
  { "cespare/vim-toml", branch = "main" },
  { "stephpy/vim-yaml" },
  { "rust-lang/rust.vim" },
  { "rhysd/vim-clang-format" },
  { "fatih/vim-go" },
  { "plasticboy/vim-markdown" },
  { "hashivim/vim-terraform" },
  { "vim-python/python-syntax" },
  { "mhanberg/elixir.nvim", branch = "main" },
  { "elixir-editors/vim-elixir" },
  { "github/copilot.vim" },
  {
    "prettier/vim-prettier",
    build = 'yarn install --frozen-lockfile --production',
    ft = { 'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html' }
  },
  { "MunifTanjim/nui.nvim", branch = "main" },
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope.nvim" },
  { "jackMort/ChatGPT.nvim", branch = "main" },
  { "pwntester/octo.nvim" },
  { "gruvbox-community/gruvbox", branch = "master" },
})
