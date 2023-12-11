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
