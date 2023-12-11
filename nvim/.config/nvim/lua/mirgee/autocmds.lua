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
        source_lua_file(vim.fn.expand("~/.config/nvim/lua/mirgee/spacetabs/spacetab-rust.lua"))
    end,
})

-- JavaScript and TypeScript code style rules
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"javascript", "typescript"},
    callback = function()
        source_lua_file(vim.fn.expand("~/.config/nvim/lua/mirgee/spacetabs/spacetab-js.lua"))
    end,
})
