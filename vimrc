" File: _vimrc             
" Version: 1
" Author: greemin
" Created: 19 Nov 2003 10:20:19 by Seth Mason
" Last-modified: 12 Feb 2021 08:41:35 PM

set encoding=UTF-8

" make vim silent
set visualbell

" Use Vim settings, rather then Vi settings (much better!).
set nocompatible

" Turn on the verboseness to see everything vim is doing.
"set verbose=9

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

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


" do not keep a backup files 
"set nobackup
"set nowritebackup

if has('gui_running') || has('nvim')
    set guifont=DroidSansMono\ Nerd\ Font\ 11
    "set textwidth=78
    " Set 52 lines for the display
    "set lines=52
    " 2 for the status line.
    set cmdheight=2
    " add columns for the Project plugin
    "set columns=110
    " enable use of mouse
    set mouse=a
    " default gvim buffer = system clipboard
    set clipboard=unnamedplus
    " for the TOhtml command
    let html_use_css=1
    " current line/column-highlighting only looks good in GUI-Vim
    "set cursorline
    "set cursorcolumn
endif

" keep 50 lines of command line history
set history=50  

" show the cursor position all the time
set ruler       

" show (partial) commands
set showcmd     

" do incremental searches (annoying but handy);
set incsearch 

" Show  tab characters. Visual Whitespace.
"set list
"set listchars=tab:>.

" Set ignorecase on
set ignorecase

" smart search (override 'ic' when pattern has uppers)
set scs

" Set 'g' substitute flag on
" set gdefault

" Set status line
set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*

" Always display a status line at the bottom of the window
set laststatus=2

" Set vim to use 'short messages'.
" set shortmess=a

" Insert two spaces after a period with every joining of lines.
" I like this as it makes reading texts easier (for me, at least).
set joinspaces

" showmatch: Show the matching bracket for the last ')'?
set showmatch

" allow tilde (~) to act as an operator -- ~w, etc.
set notildeop

" highlight strings inside C comments
let c_comment_strings=1

set noequalalways
set splitbelow
set splitright
" Commands for :Explore
let g:explVertical=1    " open vertical split winow
let g:explSplitRight=1  " Put new window to the right of the explorer
let g:explStartRight=0  " new windows go to right of explorer window


if has("gui") || has('nvim')
  " set the gui options to:
  "   g: grey inactive menu items
  "   m: display menu bar
  "   r: display scrollbar on right side of window
  "   b: display scrollbar at bottom of window
  "   t: enable tearoff menus on Win32
  "   T: enable toolbar on Win32
  set go=0
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running") || has('nvim')
  syntax on
  set hlsearch
  set number
endif

" for cygwin
"set shell=C:/cygwin/bin/bash
"set shellcmdflag=--login\ -c
"set shellxquote=\" 
set shell=/bin/bash


" ************************************************************************
" P L U G I N S
"

let NERDTreeStatusline="%{matchstr(getline('.'), '\\s\\zs\\w\\(.*\\)')}"
let NERDTreeChDirMode=2
let NERDTreeShowHidden=1

let g:vimwiki_list = [{'path': '~/Sync/wiki', 'path_html':'~/Sync/wiki/export/html/', 'syntax': 'markdown', 'ext': '.md', 'diary_header': 'Log' }, {'path': '~/Sync/workwiki', 'path_html':'~/Sync/workwiki/export/html/', 'syntax': 'markdown', 'ext': '.md', 'diary_header': 'Work Log' }, {'path': '~/Sync/evewiki', 'path_html':'~/Sync/evewiki/export/html/', 'syntax': 'markdown', 'ext': '.md', 'diary_header': 'Flight Log'}]

let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

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

inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

" Mapping new keys to exit Inser-Mode and disabling escape
inoremap jk <esc>
inoremap <esc> <nop>

" Making it easier to making editing easier
noremap <Leader>ev :vsplit $MYVIMRC<cr>
noremap <Leader>sv :source $MYVIMRC<cr>
noremap <Leader><tab> <Ctrl>-W

" Uppercase the current word
inoremap <Leader><c-u> <esc>bvwUi
nnoremap <Leader><c-u> bvwU<esc> 

" Make quotes arround the current word
nnoremap <Leader>" viw<esc>a"<esc>lel
nnoremap <Leader>' viw<esc>a'<esc>lel

"" Comment out line with "//"
nnoremap <Leader>/ 0i//<esc>j

" Switching NERDTree on/off
map <Leader>t :NERDTreeToggle<cr>

map <Leader>s :Sexplore<cr> 
map <Leader>e :Explore<cr>

" pressing < or > will let you indent/unident selected lines
vnoremap <Leader>< <gv
vnoremap <Leader>> >gv

" Don't use Ex mode, use Q for formatting
map Q gq

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" Make tab in v mode work like I think it should (keep highlighting):
vmap <tab> >gv
vmap <s-tab> <gv

" map ,L mz1G/Last modified:/e<Cr>CYDATETIME<Esc>`z
map ,L    :let @z=TimeStamp()<Cr>"zpa
map ,datetime :let @z=strftime("%d %b %Y %X")<Cr>"zpa
map ,date :let @z=strftime("%d %b %Y")<Cr>"zpa

" Map <c-s> to write current buffer.
map <c-s> :w<cr>
imap <c-s> <c-o><c-s>
imap <c-s> <esc><c-s>

" Buffer naviation
map <M-Left> :bprevious<CR>
map <M-Right> :bnext<CR>


" Select all.
map <c-a> ggVG

" Undo in insert mode.
imap <c-z> <c-o>u

" Load my color scheme 
if has("gui_running") || has('nvim')
    " GUI colors
    colorscheme onedark "desert, golden, midnight, oceandeep, github
else
    " CLI colors
    colorscheme golden "golden
endif

" ************************************************************************
" B E G I N  A U T O C O M M A N D S
"
if has("autocmd")

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

  " Normally don't automatically format 'text' as it is typed, only do this
  " with comments, at 79 characters.
  "au BufNewFile,BufEnter *.c,*.h,*.java,*.jsp set formatoptions-=t tw=79

  " add an autocommand to update an existing time stamp when writing the file 
  " It uses the functions above to replace the time stamp and restores cursor 
  " position afterwards (this is from the FAQ) 
  autocmd BufWritePre,FileWritePre *   ks|call UpdateTimeStamp()|'s

  if has("gui_running") || has('nvim')
    " Load session on cwd-change
    autocmd DirChanged * NERDTreeClose
    autocmd DirChanged * nested :call RestoreSess()
    autocmd DirChanged * NERDTree %:p:h 
    autocmd DirChanged * wincmd p

    " Open NERDTree on startup
    autocmd vimenter * NERDTree %:p:h 
    autocmd vimenter * wincmd p

    " Save vim session when leaving
    autocmd VimLeave * NERDTreeClose
    autocmd VimLeave * call SaveSess()
  endif

endif " has("autocmd")

" GUI ONLY type stuff.
if has("gui")
  :menu &MyVim.Current\ File.Convert\ Format.To\ Dos :set fileformat=dos<cr> :w<cr>
  :menu &MyVim.Current\ File.Convert\ Format.To\ Unix :set fileformat=unix<cr> :w<cr>
  :menu &MyVim.Current\ File.Remove\ Trailing\ Spaces\ and\ Tabs :%s/[	]*$//g<cr>
  :menu &MyVim.Current\ File.Remove\ Ctrl-M :%s/^M//g<cr>
  :menu &MyVim.Current\ File.Remove\ All\ Tabs :retab<cr>
  :menu &MyVim.Current\ File.To\ HTML :runtime! syntax/2html.vim<cr>
  " these don't work for some reason
  ":amenu &MyVim.Insert.Date<Tab>,date <Esc><Esc>:,date<Cr>
  ":amenu &MyVim.Insert.Date\ &Time<Tab>,datetime <Esc><Esc>:let @z=YDATETIME<Cr>"zpa
  :amenu &MyVim.Insert.Last\ &Modified<Tab>,L <Esc><Esc>:let @z=TimeStamp()<CR>"zpa
  :amenu &MyVim.-SEP1- <nul>
  :amenu &MyVim.&Global\ Settings.Toggle\ Display\ Unprintables<Tab>:set\ list!	:set list!<CR>
  :amenu &MyVim.-SEP2- <nul>
  :amenu &MyVim.&Project :Project<CR>

  " hide the mouse when characters are typed
  set mousehide
endif

" ************************************************************************
" A B B R E V I A T I O N S 
"
abbr #b /************************************************************************
abbr #e  ************************************************************************/

abbr hosts C:\WINNT\system32\drivers\etc\hosts

iabbrev ssig -- <cr>Karl-Martin Zimmermann<cr>E-Mail: karl@jotech.net<cr>
iabbrev ccopy Copyright 2017 Karl-Martin Zimmermann, some rights reserved.  

" abbreviation to manually enter a timestamp. Just type YTS in insert mode 
iab YTS <C-R>=TimeStamp()<CR>

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

" first add a function that returns a time stamp in the desired format 
if !exists("*TimeStamp")
    fun TimeStamp()
        return "Last-modified: " . strftime("%d %b %Y %X")
    endfun
endif

" searches the first ten lines for the timestamp and updates using the
" TimeStamp function
if !exists("*UpdateTimeStamp")
function! UpdateTimeStamp() 
   " Do the updation only if the current buffer is modified 
   if &modified == 1 
       " go to the first line
       exec "1" 
      " Search for Last modified: 
      let modified_line_no = search("Last-modified:") 
      if modified_line_no != 0 && modified_line_no < 10 
         " There is a match in first 10 lines 
         " Go to the : in modified: 
         exe "s/Last-modified: .*/" . TimeStamp()
     endif
 endif
 endfunction
endif

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

execute pathogen#infect()
call pathogen#helptags()
