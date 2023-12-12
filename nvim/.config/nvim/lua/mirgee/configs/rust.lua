-- Disable autosave on RustFmt
vim.g.rustfmt_autosave = 0

-- Emit files for RustFmt
vim.g.rustfmt_emit_files = 1

-- Do not fail silently for RustFmt
vim.g.rustfmt_fail_silently = 0

-- Set the Rust clipboard command
vim.g.rust_clip_command = 'xclip -selection clipboard'

-- Environment variable
vim.env.CARGO_TARGET_DIR = '/tmp/rust-analyzer'

vim.g.rustfmt_autosave = 1
