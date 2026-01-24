" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
" Download plug-ins to the ~/.vim/plugged/ directory
"call vundle#begin('~/.vim/plugged')
" Let Vundle manage Vundle
"Plugin 'VundleVim/Vundle.vim'
"Plugin 'sheerun/vim-polyglot'

" Themes
"Plugin 'cocopon/iceberg.vim'
"Plugin 'arcticicestudio/nord-vim'
"Plugin 'Badacadabra/vim-archery'
"Plugin 'kristijanhusak/vim-hybrid-material'
"Plugin 'scheakur/vim-scheakur'
"Plugin 'lifepillar/vim-solarized8'

" Auto Pair Completion
"Plugin 'jiangmiao/auto-pairs'

" File Browsing
"Plugin 'preservim/nerdtree'
" For Tagging
"Plugin 'preservim/tagbar'
" For Searching
"Plugin 'dyng/ctrlsf.vim'
" Companion files compatibility
"Plugin 'derekwyatt/vim-fswitch'
" Pull function prototypes from .h
"Plugin 'derekwyatt/vim-protodef'
" Move lines now!
"Plugin 'matze/vim-move'
"call vundle#end()

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" Pick a leader key
let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number
"set relativenumber
set mouse=a
if !has('nvim')
    set termwinsize=12x0
endif

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" No swap files
set noswapfile
set nobackup

" Visual Mode enhancement
set virtualedit+=onemore

" Whitespace
set wrap
" set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround
inoremap jj <ESC>

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd
set wildmenu
set wildmode=list:longest
set cursorline
" set relativenumber
set undofile

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set gdefault
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

nnoremap <tab> %
vnoremap <tab> %

" Remap help key.
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Remap command start
nnoremap ; :

" Copy paste from vim
" requires gvim installed (clipboard support)
vnoremap <C-c> "*y :let @+=@*<CR>
map <C-v> "+P

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬

" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:

" Autocomplete brackets
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
"inoremap < <><left>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O
let g:AutoPairsShortcutToggle = '<C-P>'

" Tagbar
" Focus the panel when opening it
let g:tagbar_autofocus = 1
" Highlight the active tag
let g:tagbar_autoshowtag = 1
" Make panel vertical and place on the right
let g:tagbar_position = 'botright vertical'

" Save on focus lost
" au FocusLost * :wa

" Split screen
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>w <C-w>v<C-w>l<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"nnoremap <leader>n :NERDTreeFocus<CR>
"nnoremap <C-b> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>

set background=dark
"colorscheme hybrid_material

" NERDTree
let NERDTreeShowBookmarks = 1
let NERDTreeShowHidden = 1
let NERDTreeShowLineNumbers = 0
let NERDTreeMinimalMenu = 1
let NERDTreeWinPos = "left"
let NERDTreeWinSize = 31
let NERDTreeMinimalUI = 0 

" CtrlFS
" Use the ack tool as the backend
let g:ctrlsf_backend = 'ack'
" Auto close the results panel when opening a file
let g:ctrlsf_auto_close = { "normal":0, "compact":0 }
" Immediately switch focus to the search window
let g:ctrlsf_auto_focus = { "at":"start" }
" Don't open the preview window automatically
let g:ctrlsf_auto_preview = 0
" Use the smart case sensitivity search scheme
let g:ctrlsf_case_sensitive = 'smart'
" Normal mode, not compact mode
let g:ctrlsf_default_view = 'normal'
" Use absoulte search by default
let g:ctrlsf_regex_pattern = 0
" Position of the search window
let g:ctrlsf_position = 'right'
" Width or height of search window
let g:ctrlsf_winsize = '46'
" Search from the current working directory
let g:ctrlsf_default_root = 'cwd'

"nmap <F2> :NERDTreeToggle<CR>
"nmap <F8> :TagbarToggle<CR>

" (Ctrl+F) Open search prompt (Normal Mode)
nmap <C-F>f <Plug>CtrlSFPrompt
" (Ctrl-F + f) Open search prompt with selection (Visual Mode)
xmap <C-F>f <Plug>CtrlSFVwordPath
" (Ctrl-F + t) Toggle CtrlSF window (Normal Mode)
nnoremap <C-F>t :CtrlSFToggle<CR>

" FSwitch
"au! BufEnter *.cpp let b:fswitchdst = 'hpp,h'
"au! BufEnter *.h let b:fswitchdst = 'cpp,c'

nmap <C-Z> :vsplit <bar> :wincmd l <bar> :FSRight<CR>

set clipboard=unnamed
