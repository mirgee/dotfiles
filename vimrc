"-------------------------------------------------------------------------------------------"
"VUNDLE"

set nocompatible
syntax on
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
" set foldmethod=manual
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

filetype off                

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
" https://github.com/Valloric/YouCompleteMe#ubuntu-linux-x64
Plugin 'Valloric/YouCompleteMe' " Python autocomplete
Plugin 'vim-syntastic/syntastic' " Checking syntax after save
" Plugin 'nvie/vim-flake8' " PEP 8 checking

" Nerdtree
Plugin 'scrooloose/nerdtree' " Proper file tree
" Plugin 'jistr/vim-nerdtree-tabs' " Use nerdtree with tabs
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'kien/ctrlp.vim' " To search any files or tags
Plugin 'tpope/vim-fugitive' " To perform basic git commands without leaving vim
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'} " To display virtualenv, git branch, edited files, etc.
Plugin 'tpope/vim-surround' " Simple parenthizing
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'editorconfig/editorconfig-vim' " Some automated formatting
Plugin 'fisadev/vim-isort' " Sorting imports
Plugin 'majutsushi/tagbar' " Display class definitions etc.
Plugin 'airblade/vim-gitgutter' " See which lines have been modified in repo
" Requires installation e.g. with:
" curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.9.0/ripgrep_0.9.0_amd64.deb
" sudo dpkg -i ripgrep_0.9.0_amd64.deb
Plugin 'jremmen/vim-ripgrep' " Search in project

" Colorschemes
Plugin 'git://github.com/altercation/vim-colors-solarized.git'
Plugin 'jnurmine/Zenburn'
Plugin 'tomasr/molokai'

call vundle#end()
filetype plugin indent on

"--------------------------------------------------------------------------------------------"
"LATEX SUITE"

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'
let g:Tex_GotoError = 0
let g:Tex_IgnoredWarnings =
    \"Underfull"."\n".
    \"Marginpar on page"."\n"
let g:Tex_IgnoreLevel = 2
let g:Tex_FoldedEnvironments = 'align,figure,table,dfn,thm'


"--------------------------------------------------------------------------------------------"
"MAPPINGS"

" I don't know why this needs to be here
let &path.="src/include,/usr/include/AL,"

" Smooth scrolling
noremap <silent> <c-b> :call smooth_scroll#up(&scroll, 20, 2)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll, 20, 2)<CR>

" Shortcuts
nnoremap <CR> o<Esc>
nnoremap <S-CR> O<Esc>
" nnoremap <C-PageUp> :tabnext<CR>
map [5;5~ :tabprevious<CR>
" nnoremap <C-PageDown> <Esc>:tabprevious<CR>
map [6;5~ :tabnext<CR>
nnoremap <C-t> :tabnew <CR>
" nnoremap <C-S-PageUp> :tabmove -1 <CR>
" map [5~ :tabmove -1<CR>
" nnoremap <C-S-PageDown> :tabmove +1 <CR>
" map [6~ :tabmove +1<CR>
noremap <silent> <Leader>cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> <Leader>cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
nnoremap <Leader>pr  <Esc>:w<CR>:! python %:p<Enter>
" This is for swapping text
vnoremap <C-X> <Esc>`.``gvP``P

" This is probably to start where left
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

"--------------------------------------------------------------------------------------------"
"PLUGIN SETTINGS"

" To see docstrings for folded code
let g:SimpylFold_docstring_preview=1

" For proper PEP8 indentation
au BufNewFile,BufRead *.py :
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set colorcolumn=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
au BufNewFile,BufRead *.js,*.html,*.css :
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

" To mark extraneous whitespace red
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" To make YouCompleteMe window go away when done with it and shortcut for go
" to definition
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>gg  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>gt  :tab split \| YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>dd  :YcmCompleter GetDoc<CR>
let g:ycm_python_binary_path = 'python'
let g:ycm_autoclose_preview_window_after_completion = 1
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

" Make powerline appear even with one window
set laststatus=2

" NerdTree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
map <C-n> :NERDTreeToggle<CR> " Map shortcut to start
map <F3> :NERDTreeFind<CR> " Map shortcut to find file

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" let g:nerdtree_tabs_open_on_console_startup=1

let NERDTreeSortOrder=['\/$', '\.py$', '\.ipynb$', '\.sh$', '\.sh\*$', '\.conf*$', '\.yml$', '\.md$', '\.ini$', '\.in$', '\.txt$', '*', '\.pyc$', '\.swp$', '\.bak$', '\~$']

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
let g:NERDTreeExtensionHighlightColor['py'] = s:blue 

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

" Make vim and system clipboard the same
set clipboard+=unnamed

" Keep colorscheme options at the end
if has('gui_running')
  " set background=dark
  " colorscheme solarized
  colorscheme molokai
else
  colorscheme molokai
endif
" call togglebg#map("<F5>") " Switch backrounds with F5

" Replace pdb to ipdb
ab ip import ipdb; ipdb.set_trace()
ab jj <Esc>:w<CR>

" Open Tagbar with F8
nmap <F8> :TagbarToggle<CR>

" isort settings
let g:vim_isort_python_version = 'python3'
