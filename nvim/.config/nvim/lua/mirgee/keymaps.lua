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
