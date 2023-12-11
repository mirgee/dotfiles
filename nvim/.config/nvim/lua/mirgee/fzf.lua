-- Set grepprg based on available executables
if vim.fn.executable('ag') then
  vim.o.grepprg = 'ag --nogroup --nocolor'
elseif vim.fn.executable('rg') then
  vim.o.grepprg = 'rg --no-heading --vimgrep'
  vim.o.grepformat = '%f:%l:%c:%m'
end

-- Open hotkeys
vim.api.nvim_set_keymap('n', '<C-p>', ':Files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-b>', ':Buffers<CR>', { noremap = true })

-- <leader>s for Rg search
vim.api.nvim_set_keymap('n', '<leader>s', ':Rg', { noremap = true })

-- Set FZF layout
vim.g.fzf_layout = { down = '~20%' }

-- Define the Rg command using FZF
function Rg(...)
  local args = { ... }
  local rg_command = 'rg --column --line-number --no-heading --color=always ' .. vim.fn.shellescape(table.concat(args, ' '))
  local preview_layout = vim.fn.argc() > 0 and 'up:60%' or 'right:50%:hidden'
  local preview_command = vim.fn.argc() > 0 and '?' or ''
  vim.fn['fzf#vim#grep'](rg_command, 1, vim.fn.argc() > 0 and vim.fn['fzf#vim#with_preview'](preview_layout) or vim.fn['fzf#vim#with_preview'](preview_layout, preview_command))
end
vim.cmd('command! -bang -nargs=* Rg call v:lua.Rg(<q-args>)')

-- Define the list_cmd function
function list_cmd()
  local base = vim.fn.fnamemodify(vim.fn.expand('%'), ':h:.:S')
  return base == '.' and 'fd --type file --follow' or string.format('fd --type file --follow | proximity-sort %s', vim.fn.shellescape(vim.fn.expand('%')))
end

-- Define the Files command using FZF
vim.cmd('command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, {"source": v:lua.list_cmd(), "options": "--tiebreak=index"}, <bang>0)')
