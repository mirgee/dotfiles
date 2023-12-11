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
" Plug 'kyazdani42/nvim-web-devicons'
Plug 'pwntester/octo.nvim'

" Colorschemes
Plug 'gruvbox-community/gruvbox', {'branch': 'master'}

call plug#end()

" Colorscheme options at the end
colorscheme gruvbox
syntax on

source ~/.config/nvim/scripts/lspconfig.vim
source ~/.config/nvim/scripts/lightline.vim
source ~/.config/nvim/scripts/modelines.vim
source ~/.config/nvim/scripts/fzf.vim
source ~/.config/nvim/scripts/tree.vim
source ~/.config/nvim/scripts/rust.vim

" =============================================================================
" # Editor settings
" =============================================================================
filetype plugin indent on
" Completion
" Better completion
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=4000
set autoindent
set noautowrite
set hidden
set noshowmode
set timeoutlen=1000 " http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
set encoding=utf-8
set scrolloff=2
set wrap
set nojoinspaces
" set printfont=:h10
" set printencoding=utf-8
" set printoptions=paper:letter
" Always draw sign column. Prevent buffer moving when adding/deleting sign.
set signcolumn=yes

" Sane splits
set splitright
set splitbelow

" Permanent undo
set undodir=~/.vimdid
set undofile

" Decent wildmenu
set wildmenu
set wildmode=list:longest
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor

" Use wide tabs
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Wrapping options
set formatoptions=tc " wrap text and comments using textwidth
set formatoptions+=r " continue comments when pressing ENTER in I mode
set formatoptions+=q " enable formatting of comments with gq
set formatoptions+=n " detect lists for formatting
set formatoptions+=b " auto-wrap in insert mode, and do not wrap old long lines

" Proper search
set noincsearch
set ignorecase
set nosmartcase
set gdefault

" Markdown formatter
let g:sneak#s_next = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_frontmatter = 1

" Rust formatter
let g:rustfmt_autosave = 1

" =============================================================================
" # GUI settings
" =============================================================================
set guioptions-=T " Remove toolbar
set vb t_vb= " No more beeps
set backspace=2 " Backspace over newlines
set ttyfast
" https://github.com/vim/vim/issues/1735#issuecomment-383353563
set lazyredraw
set synmaxcol=500
set laststatus=2
set relativenumber " Relative line numbers
set number " Also show current absolute line
set diffopt+=iwhite " No whitespace in vimdiff
" Make diffing better: https://vimways.org/2018/the-power-of-diff/
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic
set colorcolumn=0 " don't give me a colored column
set showcmd " Show (partial) command in status line.
set mouse=a " Enable mouse usage (all modes) in terminals
set shortmess+=c " don't give |ins-completion-menu| messages.
set background=light
set viewoptions=cursor,folds
set foldlevel=99
set foldmethod=indent " Enable folding
set nofoldenable
set termguicolors

" Show those damn hidden characters
" Verbose: set listchars=nbsp:¬,eol:¶,extends:»,precedes:«,trail:•
set listchars=nbsp:¬,extends:»,precedes:«,trail:•
"
" =============================================================================
" # Keyboard shortcuts
" =============================================================================
" Ctrl+; as Esc
nnoremap <C-;> <Esc>
inoremap <C-;> <Esc>
vnoremap <C-;> <Esc>
snoremap <C-;> <Esc>
xnoremap <C-;> <Esc>
cnoremap <C-;> <Esc>
onoremap <C-;> <Esc>
lnoremap <C-;> <Esc>
tnoremap <C-;> <Esc>

" Quick-save
nmap <leader>w :w<CR>

" Ctrl+h to stop searching
vnoremap <C-h> :nohlsearch<cr>
nnoremap <C-h> :nohlsearch<cr>

" Open new file adjacent to current file
nnoremap <leader>o :e <C-R>=expand("%:p:h") . "/" <CR>

nnoremap <C-t> :tabnew <CR>

" No arrow keys --- force yourself to use the home row
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>
inoremap <C-e> <C-o><A>
inoremap <C-b> <C-o><I>

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" <leader>, shows/hides hidden characters
nnoremap <leader>, :set invlist<cr>

" <leader>q shows stats
nnoremap <leader>q g<c-g>

" I can type :help on my own, thanks.
map <F1> <Esc>
imap <F1> <Esc>

map <Leader>bg :let &background = ( &background == "dark"? "light": "dark")<CR>

map <C-n> :NvimTreeToggle<CR>
map <leader>nf :NvimTreeFindFile<CR>

" =============================================================================
" # Autocommands
" =============================================================================

" Prevent accidental writes to buffers that shouldn't be edited
autocmd BufRead *.orig set readonly
autocmd BufRead *.pacnew set readonly

" Help filetype detection
autocmd BufRead *.md set filetype=markdown
autocmd BufRead *.lds set filetype=ld
autocmd BufRead *.trm set filetype=c
autocmd BufRead *.xlsx.axlsx set filetype=ruby

" Leave paste mode when leaving insert mode
autocmd InsertLeave * set nopaste

" Jump to last edit position on opening file
if has("autocmd")
  " https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
  au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Follow Rust code style rules
au Filetype rust source ~/.config/nvim/scripts/spacetab-rust.vim
au Filetype javascript source ~/.config/nvim/scripts/spacetab-js.vim
au Filetype typescript source ~/.config/nvim/scripts/spacetab-js.vim
au Filetype markdown source ~/.config/nvim/scripts/markdown.vim

" Temporary workaround, delete once https://github.com/elixir-editors/vim-elixir/issues/562 is fixed
au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eelixir
au BufRead,BufNewFile mix.lock set filetype=elixir

" Save / restore session
fu! SaveSess()
    execute 'mksession! ' . getcwd() . '/.session.vim'
endfunction

fu! RestoreSess()
if filereadable(getcwd() . '/.session.vim')
    execute 'so ' . getcwd() . '/.session.vim'
endif
endfunction

autocmd VimLeave * call SaveSess()
autocmd VimEnter * nested call RestoreSess()

" Script plugins
autocmd Filetype html,xml,xsl,php source ~/.config/nvim/scripts/closetag.vim

" Copilot
imap <silent><script><expr> <C-E> copilot#Accept("<End>")
let g:copilot_no_tab_map = v:true
let g:copilot_assume_mapped = v:true

let $CARGO_TARGET_DIR = '/tmp/rust-analyzer'

" Setup ChatGPT plugin
source ~/.config/nvim/scripts/chatgpt.vim

" Setup Octo
source ~/.config/nvim/scripts/octo.vim

" =============================================================================
" # Footer
" =============================================================================

" nvim
if has('nvim')
	runtime! plugin/python_setup.vim
endif
