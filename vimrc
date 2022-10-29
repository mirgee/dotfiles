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
Plugin 'vim-syntastic/syntastic' " Checking syntax after save
Plugin 'scrooloose/nerdtree' " Proper file tree
Plugin 'kien/ctrlp.vim' " To search any files or tags
Plugin 'jremmen/vim-ripgrep' " Grepping through repo
Plugin 'tpope/vim-fugitive' " To perform basic git commands without leaving vim
Plugin 'airblade/vim-gitgutter' " Control git from vim
Plugin 'itchyny/lightline.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin' " To see git status in nerdtree
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight' " To reflect filetype in nerdtree
Plugin 'tpope/vim-surround' " Handy tool for efficient change of brackets
Plugin 'hashivim/vim-terraform'

" Colorschemes
Plugin 'morhetz/gruvbox'

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
set expandtab
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
set laststatus=2 " Make powerline appear even with one window
set shiftwidth=0
set textwidth=0
set colorcolumn=0
set noincsearch

" Allows dragging
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

" For proper PEP8 indentation
au BufNewFile,BufRead *.js,*.jsx,*.html,*.css,*.ts :
    \ setlocal tabstop=2 |
    \ setlocal softtabstop=2 |
    \ setlocal shiftwidth=2 |
    \ setlocal expandtab |
    \ setlocal autoindent |
set backspace=indent,eol,start
set background=light

" Shortcuts
nnoremap <C-t> :tabnew <CR>
nnoremap <C-b> :CtrlPBuffer<CR>
nnoremap <Leader><Space> :nohlsearch<CR>

map <Leader>bg :let &background = ( &background == "dark"? "light": "dark")<CR>

" Automatically save folds
" autocmd CmdwinEnter * nnoremap <CR> <CR>
" autocmd BufReadPost quickfix nnoremap <CR> <CR>
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview

" To mark extraneous whitespace red
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h, *.js,  match BadWhitespace /\s\+$/

" To make YouCompleteMe window go away when done with it and shortcut for go
" to definition
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>gt  :tab split \| YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>D  :YcmCompleter GetDoc<CR>
nmap <leader>d <plug>(YCMHover)

let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:ycm_show_diagnostics_ui = 1 "default 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1
let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_collect_identifiers_from_tags_files = 0 "default 0
let g:ycm_python_binary_path = 'python3.7'
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_goto_buffer_command = 'same-buffer'
let g:ycm_auto_hover = ''
" let g:ycm_min_num_of_chars_for_completion = 4
" let g:ycm_min_num_identifier_candidate_chars = 4

" Add virtualenv support for YouCompleteMe
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  exec(open(activate_this).read(), dict(__file__=activate_this))
EOF

" NerdTree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
map <C-n> :NERDTreeToggle<CR> " Map shortcut to start
map <leader>nf :NERDTreeFind<CR> " Map shortcut to find file

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
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


" let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
" let g:NERDTreeExtensionHighlightColor['yml'] = s:beige

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
let g:syntastic_javascript_checkers = ['standard', 'eslint']
let g:syntastic_typescript_checkers = ['eslint', 'tsserver', 'prettier']
" let g:syntastic_python_checkers = ['pylint']
" let g:syntastic_python_pylint_post_args="--max-line-length=79"

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

" Keep colorscheme options at the end
colorscheme gruvbox

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

if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature  
  set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
  endif  
