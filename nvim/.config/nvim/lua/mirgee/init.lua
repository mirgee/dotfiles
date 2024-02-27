vim.g.mapleader = " "

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

  { "folke/neodev.nvim", opts = {} },

  { "gruvbox-community/gruvbox", branch = "master" },

  { import = "mirgee.plugins" },
})
