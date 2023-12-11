" =============================================================================
" # PLUGINS
" =============================================================================
" Load vundle
set nocompatible
filetype off
call plug#begin()

" Load plugins
" VIM enhancements
Plug 'editorconfig/editorconfig-vim'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'

" Tree
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Fuzzy finder
" Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Semantic language support
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'hrsh7th/cmp-nvim-lsp', {'branch': 'main'}
Plug 'hrsh7th/cmp-buffer', {'branch': 'main'}
Plug 'hrsh7th/cmp-path', {'branch': 'main'}
Plug 'hrsh7th/nvim-cmp', {'branch': 'main'}
Plug 'ray-x/lsp_signature.nvim'

" Rust tools
Plug 'simrat39/rust-tools.nvim'

" nvim-cmp _requires_ snippets
Plug 'hrsh7th/cmp-vsnip', {'branch': 'main'}
Plug 'hrsh7th/vim-vsnip'

" Syntactic language support
Plug 'cespare/vim-toml', {'branch': 'main'}
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format'
Plug 'fatih/vim-go'
Plug 'plasticboy/vim-markdown'
Plug 'hashivim/vim-terraform'
Plug 'vim-python/python-syntax'
Plug 'mhanberg/elixir.nvim', {'branch': 'main'}
Plug 'elixir-editors/vim-elixir'

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

" AI support
Plug 'MunifTanjim/nui.nvim', {'branch': 'main'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'jackMort/ChatGPT.nvim', {'branch': 'main'}

" Github integration
Plug 'pwntester/octo.nvim'

" Colorschemes
Plug 'gruvbox-community/gruvbox', {'branch': 'master'}

call plug#end()

" Follow Rust code style rules
au Filetype rust source ~/.config/nvim/scripts/spacetab-rust.lua
au Filetype javascript,typescript source ~/.config/nvim/scripts/spacetab-js.lua
