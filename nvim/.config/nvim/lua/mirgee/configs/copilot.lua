-- Copilot setup
vim.api.nvim_set_keymap('i', '<C-E>', 'copilot#Accept("<End>")', { silent = true, script = true, expr = true })
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_enabled = false
