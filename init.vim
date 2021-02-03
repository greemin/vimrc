" ************************************************************************
" N E O V I M   C O N F I G
"

set encoding=UTF-8

set guifont=DroidSansMono\ Nerd\ Font\ 11

" default buffer = system clipboard
set clipboard=unnamedplus

" colorscheme
colorscheme onedark "desert, golden, midnight, oceandeep, github

" I like 4 spaces for indenting
set shiftwidth=4

" I like 4 stops
set tabstop=4

" Spaces instead of tabs
set expandtab

" Always  set auto indenting on
set autoindent

" select when using the mouse
set selectmode=mouse

" keep 50 lines of command line history
set history=50  

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

" no auto window equalizing
set noequalalways

" showmatch: Show the matching bracket for the last ')'?
set showmatch

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
  Plug 'preservim/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons'
  Plug 'itchyny/lightline.vim'
  Plug 'prettier/vim-prettier', { 'do': 'npm install' }
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'tpope/vim-fugitive'
  Plug 'vimwiki/vimwiki'
  Plug 'tpope/vim-surround'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'townk/vim-autoclose'
call plug#end()

let NERDTreeStatusline="%{matchstr(getline('.'), '\\s\\zs\\w\\(.*\\)')}"
let NERDTreeChDirMode=2

let g:vimwiki_list = [{'path': '~/Sync/workwiki', 'path_html':'~/Sync/workwiki/export/html/', 'syntax': 'markdown', 'ext': '.md', 'diary_header': 'Work Log' }, {'path': '~/Sync/wiki', 'path_html':'~/Sync/wiki/export/html/', 'syntax': 'markdown', 'ext': '.md', 'diary_header': 'Log' }, {'path': '~/Sync/evewiki', 'path_html':'~/Sync/evewiki/export/html/', 'syntax': 'markdown', 'ext': '.md', 'diary_header': 'Flight Log'}]

let g:prettier#autoformat_config_present = 1
let g:prettier#autoformat_require_pragma = 0

let g:lightline = { 'colorscheme': 'onedark' }


" ************************************************************************
" C O M M A N D S
"

"switch to directory of current file
"command! CD cd %:p:h


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
noremap <Leader>ev :vsplit $MYVIMRC<cr>
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
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin on

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal g`\"" |
	\ endif

autocmd DirChanged * NERDTreeClose
autocmd DirChanged * nested :call RestoreSess()
autocmd DirChanged * NERDTree
autocmd DirChanged * wincmd p

" Open NERDTree on startup
autocmd vimenter * NERDTree %:p:h 
autocmd vimenter * wincmd p

" Save vim session when leaving
autocmd VimLeave * NERDTreeClose
autocmd VimLeave * call SaveSess()

" ************************************************************************
" A B B R E V I A T I O N S 
"

" Date/Time stamps
" %a - Day of the week
" %b - Month
" %d - Day of the month
" %Y - Year
" %H - Hour
" %M - Minute
" %S - Seconds
" %Z - Time Zone
iab YDATETIME <c-r>=strftime(": %a %b %d, %Y %H:%M:%S %Z")<cr>
iab YDATE <c-r>=strftime("%d.%m.%Y")<cr>


" ************************************************************************
"  F U N C T I O N S
"

fu! SaveSess()
  if filereadable(getcwd() . '/.session.vim')
    execute 'mksession! ' . getcwd() . '/.session.vim'
  endif
endfunction

fu! RestoreSess()
if filereadable(getcwd() . '/.session.vim')
    execute 'so ' . getcwd() . '/.session.vim'
    if bufexists(1)
        for l in range(1, bufnr('$'))
            if bufwinnr(l) == -1
                exec 'sbuffer ' . l
            endif
        endfor
    endif
endif
endfunction
