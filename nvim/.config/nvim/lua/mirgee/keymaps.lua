-- Ctrl+; as Esc
local map_options = { noremap = true }

-- Quick-save
vim.api.nvim_set_keymap("n", "<leader>w", ":w<CR>", map_options)

-- Ctrl+h to stop searching
vim.api.nvim_set_keymap("v", "<C-h>", ":nohlsearch<CR>", map_options)
vim.api.nvim_set_keymap("n", "<C-h>", ":nohlsearch<CR>", map_options)

-- Open new file adjacent to current file
vim.api.nvim_set_keymap("n", "<leader>o", ':e <C-R>=expand("%:p:h") . "/" <CR>', map_options)

-- Open a new tab
vim.api.nvim_set_keymap("n", "<C-t>", ":tabnew <CR>", map_options)

-- Disable arrow keys
local no_operation = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<up>", "<nop>", no_operation)
vim.api.nvim_set_keymap("n", "<down>", "<nop>", no_operation)
vim.api.nvim_set_keymap("i", "<up>", "<nop>", no_operation)
vim.api.nvim_set_keymap("i", "<down>", "<nop>", no_operation)
vim.api.nvim_set_keymap("i", "<left>", "<nop>", no_operation)
vim.api.nvim_set_keymap("i", "<right>", "<nop>", no_operation)

-- Movement keys in insert mode
vim.api.nvim_set_keymap("i", "<C-h>", "<left>", map_options)
vim.api.nvim_set_keymap("i", "<C-j>", "<down>", map_options)
vim.api.nvim_set_keymap("i", "<C-k>", "<up>", map_options)
vim.api.nvim_set_keymap("i", "<C-l>", "<right>", map_options)
vim.api.nvim_set_keymap("i", "<C-e>", "<C-o><A>", map_options)
vim.api.nvim_set_keymap("i", "<C-b>", "<C-o><I>", map_options)

-- Buffer navigation with arrow keys
vim.api.nvim_set_keymap("n", "<left>", ":bp<CR>", map_options)
vim.api.nvim_set_keymap("n", "<right>", ":bn<CR>", map_options)

-- Toggle between buffers
vim.api.nvim_set_keymap("n", "<leader><leader>", "<c-^>", map_options)

-- Toggle hidden characters
vim.api.nvim_set_keymap("n", "<leader>,", ":set invlist<CR>", map_options)

-- Show stats
vim.api.nvim_set_keymap("n", "<leader>q", "g<c-g>", map_options)

-- Disable F1 help
vim.api.nvim_set_keymap("", "<F1>", "<Esc>", map_options)
vim.api.nvim_set_keymap("i", "<F1>", "<Esc>", map_options)

-- Terminal mappings
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", map_options)
vim.api.nvim_set_keymap("t", "<A-h>", "<C-\\><C-N><C-w>h", map_options)
vim.api.nvim_set_keymap("t", "<A-j>", "<C-\\><C-N><C-w>j", map_options)
vim.api.nvim_set_keymap("t", "<A-k>", "<C-\\><C-N><C-w>k", map_options)
vim.api.nvim_set_keymap("t", "<A-l>", "<C-\\><C-N><C-w>l", map_options)
vim.cmd([[
  tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
]])

-- Insert-mode mappings
vim.api.nvim_set_keymap("i", "<A-h>", "<C-\\><C-N><C-w>h", map_options)
vim.api.nvim_set_keymap("i", "<A-j>", "<C-\\><C-N><C-w>j", map_options)
vim.api.nvim_set_keymap("i", "<A-k>", "<C-\\><C-N><C-w>k", map_options)
vim.api.nvim_set_keymap("i", "<A-l>", "<C-\\><C-N><C-w>l", map_options)

-- Normal-mode mappings
vim.api.nvim_set_keymap("n", "<A-h>", "<C-w>h", map_options)
vim.api.nvim_set_keymap("n", "<A-j>", "<C-w>j", map_options)
vim.api.nvim_set_keymap("n", "<A-k>", "<C-w>k", map_options)
vim.api.nvim_set_keymap("n", "<A-l>", "<C-w>l", map_options)

-- Toggle background color
vim.api.nvim_set_keymap(
	"n",
	"<Leader>bg",
	':let &background = (&background == "dark" ? "light" : "dark")<CR>',
	map_options
)

-- Show hidden characters
vim.o.listchars = "nbsp:¬,extends:»,precedes:«,trail:•"

function InsertCleanSearchRegisterContent()
	local search_content = vim.fn.getreg("/")
	local clean_content = search_content:gsub("\\<", ""):gsub("\\>", "")
	vim.api.nvim_put({ clean_content }, "", false, true)
end

vim.api.nvim_set_keymap(
	"i",
	"<C-R><C-W>",
	"<C-O>:lua InsertCleanSearchRegisterContent()<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", '"<C-W>', ":lua InsertCleanSearchRegisterContent()<CR>", { noremap = true, silent = true })
