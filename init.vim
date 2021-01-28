" ************************************************************************
" NEOVIM Config
"

" default buffer = system clipboard
set clipboard=unnamedplus

" colorscheme
colorscheme onedark "desert, golden, midnight, oceandeep, github

" I like 4 spaces for indenting
set shiftwidth=2

" I like 4 stops
set tabstop=2

" Spaces instead of tabs
set expandtab

" Always  set auto indenting on
set autoindent

" select when using the mouse
set selectmode=mouse

" show the cursor position all the time
set ruler       

" show (partial) commands
set showcmd

" Set ignorecase on
set ignorecase

" smart search (override 'ic' when pattern has uppers)
set scs

" Set status line
set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*

" Always display a status line at the bottom of the window
set laststatus=2

" split settings
set splitbelow
set splitright

syntax on
set hlsearch
set number


" ************************************************************************
" P L U G I N S
"
call plug#begin('~/.vim/plugged')
	Plug 'preservim/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'itchyny/lightline.vim'
	Plug 'prettier/vim-prettier', { 'do': 'npm install' }
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'tpope/vim-fugitive'
  Plug 'vimwiki/vimwiki'
  Plug 'tpope/vim-surround'
call plug#end()

let NERDTreeStatusline="%{matchstr(getline('.'), '\\s\\zs\\w\\(.*\\)')}"
let NERDTreeChDirMode=2

let g:vimwiki_list = [{'path': '~/Sync/workwiki', 'path_html':'~/Sync/workwiki/export/html/', 'syntax': 'markdown', 'ext': '.md', 'diary_header': 'Work Log' }, {'path': '~/Sync/wiki', 'path_html':'~/Sync/wiki/export/html/', 'syntax': 'markdown', 'ext': '.md', 'diary_header': 'Log' }, {'path': '~/Sync/evewiki', 'path_html':'~/Sync/evewiki/export/html/', 'syntax': 'markdown', 'ext': '.md', 'diary_header': 'Flight Log'}]

" ************************************************************************
" C O M M A N D S
"

"switch to directory of current file
command! CD cd %:p:h

" ************************************************************************
" K E Y   M A P P I N G S
"

let mapleader = ","
let maplocalleader = "\\"

" Disabling arrow keys so that I start using hjkl for navigation
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

" Making it easier to making editing easier
noremap <Leader>ev :vsplit $MYVIMRC<cr>:
noremap <Leader>sv :source $MYVIMRC<cr>

inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

" Mapping new keys to exit Inser-Mode and disabling escape
inoremap jk <esc>
inoremap <esc> <nop>

" Switching NERDTree on/off
map <Leader>t :NERDTreeToggle<cr>

" Map <c-s> to write current buffer.
map <c-s> :w<cr>
imap <c-s> <c-o><c-s>
imap <c-s> <esc><c-s>

" ************************************************************************
" A U T O C O M M A N D S
"

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin on

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal g`\"" |
	\ endif
