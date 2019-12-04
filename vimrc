"-------------------------------------------------------------------------------------------"
"VUNDLE"

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe' " Python autocomplete
Plugin 'tmhedberg/SimpylFold' " Folding python code
Plugin 'vim-syntastic/syntastic' " Checking syntax after save
" Plugin 'nvie/vim-flake8' " PEP 8 checking
Plugin 'fisadev/vim-isort' " Sorting python imports
Plugin 'scrooloose/nerdtree' " Proper file tree
" Plugin 'majutsushi/tagbar' " Seeing classes in files
Plugin 'kien/ctrlp.vim' " To search any files or tags
" Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plugin 'junegunn/fzf.vim.git'
Plugin 'jremmen/vim-ripgrep' " Grepping through repo
Plugin 'tpope/vim-fugitive' " To perform basic git commands without leaving vim
Plugin 'airblade/vim-gitgutter' " Control git from vim
Plugin 'itchyny/lightline.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin' " To see git status in nerdtree
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight' " To reflect filetype in nerdtree
Plugin 'tpope/vim-surround' " Handy tool for efficient change of brackets
Plugin 'vim-scripts/indentpython.vim'
" Requires installation e.g. with:
" curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.9.0/ripgrep_0.9.0_amd64.deb
" sudo dpkg -i ripgrep_0.9.0_amd64.deb

" Colorschemes
Plugin 'morhetz/gruvbox'
" Plugin 'git://github.com/altercation/vim-colors-solarized.git'
" Plugin 'jnurmine/Zenburn'
" Plugin 'tomasr/molokai'
" Plugin 'editorconfig/editorconfig-vim' " For specific syntax settings for a project

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on


"OTHER"
syntax on
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set cursorline    " highlight current line
set splitbelow
set splitright
set autowrite " Save on buffer switch

set number
set wildmenu
set scrolloff=3
set tabstop=4
set shiftwidth=4
set expandtab
set splitbelow
set showcmd
set tags=tags
set viewoptions=cursor,folds,slash,unix
set foldmethod=indent " Enable folding
set foldlevel=99
set ignorecase " Ignore case when searching
set encoding=utf-8
set hlsearch
set guioptions-=T " Remove toolbar in gvim
set guioptions-=m  "remove menu bar
set guioptions-=L
set mouse=a
set splitbelow
set splitright
set laststatus=2 " Make powerline appear even with one window

set shiftwidth=0
set textwidth=0
set colorcolumn=0
" For proper PEP8 indentation
autocmd BufNewFile,BufRead *.py :
    \ setlocal tabstop=4 |
    \ setlocal softtabstop=4 |
    \ setlocal shiftwidth=4 |
    \ setlocal textwidth=119 |
    \ setlocal colorcolumn=119 |
    \ setlocal expandtab |
    \ setlocal autoindent |
    \ setlocal fileformat=unix |
au BufNewFile,BufRead *.js,*.html,*.css :
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

" I don't know why this needs to be here
" let &path.="src/include,/usr/include/AL,"

" Shortcuts
nnoremap <CR> o<Esc>
nnoremap <S-CR> O<Esc>
" nnoremap <C-PageUp> :tabnext<CR>
map [5;5~ :tabprevious<CR>
" nnoremap <C-PageDown> <Esc>:tabprevious<CR>
map [6;5~ :tabnext<CR>
nnoremap <C-t> :tabnew <CR>
" List buffers and choose one
nnoremap gb :ls<CR>:b<Space>
" nnoremap <C-S-PageUp> :tabmove -1 <CR>
" map [5~ :tabmove -1<CR>
" nnoremap <C-S-PageDown> :tabmove +1 <CR>
" map [6~ :tabmove +1<CR>
nnoremap <C-b> :CtrlPBuffer<CR>
" To comment / uncomment
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
noremap <silent> <Leader>cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> <Leader>cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
" To run the file
nnoremap <Leader>pr  <Esc>:w<CR>:! python3 %:p<Enter>
nnoremap <Leader>lr  <Esc>:w<CR>:! lua5.3 %:p<Enter>
" This is for swapping text
vnoremap <C-X> <Esc>`.``gvP``P

" Automatically closing braces
inoremap {<CR> {<CR>}<Esc>ko<tab>
inoremap [<CR> [<CR>]<Esc>ko<tab>
inoremap (<CR> (<CR>)<Esc>ko<tab>

nnoremap <Leader><Space> :nohlsearch<CR>
nnoremap <Leader>s :update<CR>
nnoremap <Leader>fc :Commits<CR>
nnoremap <Leader>fb :BCommits<CR>
nnoremap <Leader>fs :Gstatus<CR>

map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" This is probably to start where left
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" To see docstrings for folded code
let g:SimpylFold_docstring_preview=1

" To mark extraneous whitespace red
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" To make YouCompleteMe window go away when done with it and shortcut for go
" to definition
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>gt  :tab split \| YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>d  :YcmCompleter GetDoc<CR>
let g:ycm_python_binary_path = 'python3.7'
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]

" Add virtualenv support for YouCompleteMe
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  exec(open(activate_this).read(), dict(__file__=activate_this))
EOF

" Make python code prettier
let python_highlight_all=1

" NerdTree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
map <C-n> :NERDTreeToggle<CR> " Map shortcut to start
map <leader>nf :NERDTreeFind<CR> " Map shortcut to find file

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" let g:nerdtree_tabs_open_on_console_startup=1

let NERDTreeSortOrder=['\/$', '\.py$', '\.ipynb$', '\.js', '\.json', '\.sh$', '\.sh\*$', '\.conf*$', '\.yml$', '\.md$', '\.ini$', '\.in$', '\.txt$', '*', '\.pyc$', '\.swp$', '\.bak$', '\~$']

let g:NERDTreeFileExtensionHighlightFullName = 1

" Customize colors
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'


let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['yml'] = s:yellow

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['py'] = s:blue 

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['json'] = s:orange 

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['js'] = s:darkOrange

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb


" Syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_jslint_checkers = ['jshint']
" let g:syntastic_python_checkers = ['pylint']
" let g:syntastic_python_pylint_post_args="--max-line-length=79"

" To open errors on CTRL+e
function! ToggleErrors()
    if empty(filter(tabpagebuflist(), 'getbufvar(v:val, "&buftype") is# "quickfix"'))
         " No location/quickfix list shown, open syntastic error location panel
         Errors
    else
         lclose
    endif
endfunction

nnoremap <C-W>e :<C-u>call ToggleErrors()<CR>

if !has('gui_running')
    set t_Co=256
endif

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'relativepath', 'modified' ] ],
      \   'right': [['lineinfo'],
      \             ['percent'],
      \             ['fileformat', 'fileencoding', 'filetype', 'charvaluehex']]
      \ },
      \ 'inactive': {
      \   'left': [['mode', 'paste'],
      \            ['relativepath', 'modified']],
      \   'right': []
      \ },
      \ 'component_function': {
      \    'gitbranch': 'LightlineFugitive'
      \ },
      \ }

function! LightlineFugitive() abort
  if &filetype ==# 'help'
    return ''
  endif
  if has_key(b:, 'lightline_fugitive') && reltimestr(reltime(b:lightline_fugitive_)) =~# '^\s*0\.[0-5]'
    return b:lightline_fugitive
  endif
  try
    if exists('*fugitive#head')
      let head = fugitive#head()
    else
      return ''
    endif
    let b:lightline_fugitive = head
    let b:lightline_fugitive_ = reltime()
    return b:lightline_fugitive
  catch
  endtry
  return ''
endfunction

let g:rg_command='rg -tpy --vimgrep'

" Keep colorscheme options at the end
colorscheme gruvbox

" Replace pdb to ipdb
ab pd import pdb; pdb.set_trace()
ab jj <Esc>:w<CR>

" Open Tagbar with F8
" nmap <leader>tt :TagbarToggle<CR>

" isort settings
let g:vim_isort_python_version = 'python3'


" Save / restore session
fu! SaveSess()
    execute 'mksession! ' . getcwd() . '/.session.vim'
endfunction

fu! RestoreSess()
if filereadable(getcwd() . '/.session.vim')
    execute 'so ' . getcwd() . '/.session.vim'
    " if bufexists(1)
    "     for l in range(1, bufnr('$'))
    "         if bufwinnr(l) == -1
    "             exec 'sbuffer ' . l
    "         endif
    "     endfor
    " endif
endif
endfunction

autocmd VimLeave * call SaveSess()
autocmd VimEnter * nested call RestoreSess()
