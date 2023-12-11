-- vim.cmd('source ~/.config/nvim/init-old.vim')

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

vim.g.mapleader = ' '

-- Editor settings
vim.cmd('filetype plugin indent on')
vim.cmd('colorscheme gruvbox')
vim.cmd('syntax on')
vim.cmd('set shell=/bin/bash')

-- Completion options
vim.o.completeopt = 'menuone,noinsert,noselect'

-- Other options
vim.o.updatetime = 4000
vim.o.autoindent = true
vim.o.autowrite = false
vim.o.hidden = true
vim.o.showmode = false
vim.o.timeoutlen = 1000
vim.o.encoding = 'utf-8'
vim.o.scrolloff = 2
vim.o.wrap = true
vim.o.joinspaces = false
vim.o.signcolumn = 'yes'

-- Splits behavior
vim.o.splitright = true
vim.o.splitbelow = true

-- Permanent undo
vim.o.undodir = vim.fn.expand('~/.vimdid')
vim.o.undofile = true

-- Wildmenu settings
vim.o.wildmenu = true
vim.o.wildmode = 'list:longest'
vim.o.wildignore = '.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor'

-- Tab settings
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.expandtab = true

-- Wrapping and formatting options
vim.o.formatoptions = 'tcqrnb'

-- Search settings
vim.o.incsearch = false
vim.o.ignorecase = true
vim.o.smartcase = false
vim.o.gdefault = true

-- Plugin-specific configurations
vim.g['sneak#s_next'] = 1
vim.g.vim_markdown_new_list_item_indent = 0
vim.g.vim_markdown_auto_insert_bullets = 0
vim.g.vim_markdown_frontmatter = 1
vim.g.rustfmt_autosave = 1

-- No more beeps
vim.o.vb = true
vim.o.t_vb = ''

-- Backspace behavior
vim.o.backspace = '2'

-- TTY fast for faster terminal redrawing
vim.o.ttyfast = true

-- Lazy redraw
vim.o.lazyredraw = true

-- Syntax column settings
vim.o.synmaxcol = 500

-- Status line
vim.o.laststatus = 2

-- Line number settings
vim.wo.relativenumber = true -- Relative line numbers
vim.wo.number = true -- Also show current absolute line

-- Diff options
vim.opt.diffopt:append('iwhite') -- No whitespace in vimdiff
vim.opt.diffopt:append('algorithm:patience')
vim.opt.diffopt:append('indent-heuristic')

-- Color column
vim.wo.colorcolumn = '0' -- Don't show a colored column

-- Show command in status line
vim.o.showcmd = true

-- Mouse support
vim.o.mouse = 'a' -- Enable mouse usage (all modes) in terminals

-- Short messages
vim.opt.shortmess:append('c') -- Don't show |ins-completion-menu| messages

-- Background color
vim.o.background = 'light'

-- View options
vim.o.viewoptions = 'cursor,folds'

-- Fold settings
vim.wo.foldlevel = 99
vim.wo.foldmethod = 'indent' -- Enable folding
vim.wo.foldenable = false

-- True color support
vim.o.termguicolors = true

-- Ctrl+; as Esc
local map_options = { noremap = true }
vim.api.nvim_set_keymap('n', '<C-;>', '<Esc>', map_options)
vim.api.nvim_set_keymap('i', '<C-;>', '<Esc>', map_options)
vim.api.nvim_set_keymap('v', '<C-;>', '<Esc>', map_options)
vim.api.nvim_set_keymap('s', '<C-;>', '<Esc>', map_options)
vim.api.nvim_set_keymap('x', '<C-;>', '<Esc>', map_options)
vim.api.nvim_set_keymap('c', '<C-;>', '<Esc>', map_options)
vim.api.nvim_set_keymap('o', '<C-;>', '<Esc>', map_options)
vim.api.nvim_set_keymap('l', '<C-;>', '<Esc>', map_options)
vim.api.nvim_set_keymap('t', '<C-;>', '<Esc>', map_options)

-- Quick-save
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', map_options)

-- Ctrl+h to stop searching
vim.api.nvim_set_keymap('v', '<C-h>', ':nohlsearch<CR>', map_options)
vim.api.nvim_set_keymap('n', '<C-h>', ':nohlsearch<CR>', map_options)

-- Open new file adjacent to current file
vim.api.nvim_set_keymap('n', '<leader>o', ':e <C-R>=expand("%:p:h") . "/" <CR>', map_options)

-- Open a new tab
vim.api.nvim_set_keymap('n', '<C-t>', ':tabnew <CR>', map_options)

-- Disable arrow keys
local no_operation = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<up>', '<nop>', no_operation)
vim.api.nvim_set_keymap('n', '<down>', '<nop>', no_operation)
vim.api.nvim_set_keymap('i', '<up>', '<nop>', no_operation)
vim.api.nvim_set_keymap('i', '<down>', '<nop>', no_operation)
vim.api.nvim_set_keymap('i', '<left>', '<nop>', no_operation)
vim.api.nvim_set_keymap('i', '<right>', '<nop>', no_operation)

-- Movement keys in insert mode
vim.api.nvim_set_keymap('i', '<C-h>', '<left>', map_options)
vim.api.nvim_set_keymap('i', '<C-j>', '<down>', map_options)
vim.api.nvim_set_keymap('i', '<C-k>', '<up>', map_options)
vim.api.nvim_set_keymap('i', '<C-l>', '<right>', map_options)
vim.api.nvim_set_keymap('i', '<C-e>', '<C-o><A>', map_options)
vim.api.nvim_set_keymap('i', '<C-b>', '<C-o><I>', map_options)

-- Buffer navigation with arrow keys
vim.api.nvim_set_keymap('n', '<left>', ':bp<CR>', map_options)
vim.api.nvim_set_keymap('n', '<right>', ':bn<CR>', map_options)

-- Toggle between buffers
vim.api.nvim_set_keymap('n', '<leader><leader>', '<c-^>', map_options)

-- Toggle hidden characters
vim.api.nvim_set_keymap('n', '<leader>,', ':set invlist<CR>', map_options)

-- Show stats
vim.api.nvim_set_keymap('n', '<leader>q', 'g<c-g>', map_options)

-- Disable F1 help
vim.api.nvim_set_keymap('', '<F1>', '<Esc>', map_options)
vim.api.nvim_set_keymap('i', '<F1>', '<Esc>', map_options)

-- Toggle background color
vim.api.nvim_set_keymap('n', '<Leader>bg', ':let &background = (&background == "dark" ? "light" : "dark")<CR>', map_options)

-- NvimTree mappings
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', map_options)
vim.api.nvim_set_keymap('n', '<leader>nf', ':NvimTreeFindFile<CR>', map_options)

-- Show hidden characters
vim.o.listchars = 'nbsp:¬,extends:»,precedes:«,trail:•'

-- Autocommands
local autocmd = vim.api.nvim_create_autocmd

-- Prevent accidental writes to buffers that shouldn't be edited
autocmd('BufRead', {
    pattern = {'*.orig', '*.pacnew'},
    command = 'set readonly'
})

-- Leave paste mode when leaving insert mode
autocmd('InsertLeave', {
    pattern = '*',
    command = 'set nopaste'
})

-- Save / restore session
local function SaveSess()
    vim.cmd('mksession! ' .. vim.fn.getcwd() .. '/.session.vim')
end

local function RestoreSess()
    local session_file = vim.fn.getcwd() .. '/.session.vim'
    if vim.fn.filereadable(session_file) == 1 then
        vim.cmd('source ' .. session_file)
    end
end

autocmd('VimLeave', {
    pattern = '*',
    callback = SaveSess
})

autocmd('VimEnter', {
    pattern = '*',
    nested = true,
    callback = RestoreSess
})

-- Copilot setup
vim.api.nvim_set_keymap('i', '<C-E>', 'copilot#Accept("<End>")', { silent = true, script = true, expr = true })
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

-- Environment variable
vim.env.CARGO_TARGET_DIR = '/tmp/rust-analyzer'

vim.cmd('runtime! plugin/python_setup.vim')

-- Jump to last edit position on opening file
-- https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
vim.cmd([[
  if has("autocmd")
    au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  endif
]])

-- Utility function to source a Lua file
local function source_lua_file(file)
    local ok, err = pcall(dofile, file)
    if not ok then
        print("Error loading " .. file .. ": " .. err)
    end
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "rust",
    callback = function()
        source_lua_file(vim.fn.expand("~/.config/nvim/lua/mirgee/spacetab-rust.lua"))
    end,
})

-- JavaScript and TypeScript code style rules
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"javascript", "typescript"},
    callback = function()
        source_lua_file(vim.fn.expand("~/.config/nvim/lua/mirgee/spacetab-js.lua"))
    end,
})

require('mirgee')
