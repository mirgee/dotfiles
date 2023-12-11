set shell=/bin/bash
let mapleader = "\<Space>"
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

" Colorscheme options at the end
colorscheme gruvbox

source ~/.config/nvim/scripts/lspconfig.vim
source ~/.config/nvim/scripts/lightline.vim
source ~/.config/nvim/scripts/modelines.vim
source ~/.config/nvim/scripts/fzf.vim
source ~/.config/nvim/scripts/tree.vim
source ~/.config/nvim/scripts/rust.vim

" Show those damn hidden characters
" Verbose: set listchars=nbsp:¬,eol:¶,extends:»,precedes:«,trail:•
set listchars=nbsp:¬,extends:»,precedes:«,trail:•

" Follow Rust code style rules
au Filetype rust source ~/.config/nvim/scripts/spacetab-rust.vim
au Filetype javascript source ~/.config/nvim/scripts/spacetab-js.vim
au Filetype typescript source ~/.config/nvim/scripts/spacetab-js.vim
au Filetype markdown source ~/.config/nvim/scripts/markdown.vim
" Script plugins
autocmd Filetype html,xml,xsl,php source ~/.config/nvim/scripts/closetag.vim

" =============================================================================
" # Footer
" =============================================================================

" Jump to last edit position on opening file
if has("autocmd")
  " https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
  au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Temporary workaround, delete once https://github.com/elixir-editors/vim-elixir/issues/562 is fixed
au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eelixir
au BufRead,BufNewFile mix.lock set filetype=elixir

" Setup ChatGPT plugin
source ~/.config/nvim/scripts/chatgpt.vim

" Setup Octo
source ~/.config/nvim/scripts/octo.vim
