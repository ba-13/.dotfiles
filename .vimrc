" Don't try to be vi compatible
set nocompatible
syntax on

" Helps force plugins to load correctly when it is turned back on below
filetype off

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
set nowritebackup

" Visual Mode enhancement
set virtualedit+=onemore

" Whitespace
set wrap
" set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
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

" Save on focus lost
" au FocusLost * :wa

" Split screen
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>w <C-w>v<C-w>l<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set background=dark
colorscheme catppuccin

nmap <C-Z> :vsplit <bar> :wincmd l <bar> :FSRight<CR>

set clipboard=unnamed

