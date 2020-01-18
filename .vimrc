set nocompatible

let mapleader=" "

set t_Co=256

set cursorline
set cursorcolumn
hi CursorLine   cterm=NONE ctermfg=NONE ctermbg=235
hi CursorColumn cterm=NONE ctermfg=NONE ctermbg=235
hi LineNr ctermfg=236 ctermbg=233

set colorcolumn=80
hi ColorColumn ctermbg=52

" Save your backups to a less annoying place than the current directory.
" If you have .nvim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.nvim/backup or . if all else fails.
if isdirectory($HOME . '/.nvim/backup') == 0
  :silent !mkdir -p ~/.nvim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.nvim/backup/
set backupdir^=./.nvim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" If youG have .nvim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.nvim/swap, ~/tmp or .
if isdirectory($HOME . '/.nvim/swap') == 0
  :silent !mkdir -p ~/.nvim/swap >/dev/null 2>&1
endif
set directory=./.nvim-swap//
set directory+=~/.nvim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.nvim/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .nvim-undo first, then ~/.nvim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.nvim/undo') == 0
    :silent !mkdir -p ~/.nvim/undo > /dev/null 2>&1
  endif
  set undodir=./.nvim-undo//
  set undodir+=~/.nvim/undo//
  set undofile
endif

" Yay! Syntax!
syntax on

set showmode
set so=7
set ruler
set laststatus=2
set showcmd
set number
set showmatch
set hid
set nohidden

set noerrorbells
set novisualbell

set statusline=
set statusline+=%#warningmsg#
set statusline+=%*
set statusline+=%F

"--- search options ------------
set incsearch       " show 'best match so far' as you type
set hlsearch        " hilight the items found by the search
set ignorecase      " ignores case of letters on searches
set smartcase       " Override the 'ignorecase' option if the search pattern contains upper case characters

"--- check timestamps on disk, and reload on file change
set autoread
au CursorHold * checktime
au CursorMoved * checktime
au WinEnter * checktime
au BufWinEnter * checktime

"--- utf8 ---
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

set exrc
set secure

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab 

setlocal wrap linebreak nolist
set virtualedit=
setlocal display+=lastline
noremap  <buffer> <silent> <Up>   gk
noremap  <buffer> <silent> <Down> gj
noremap  <buffer> <silent> <Home> g<Home>
noremap  <buffer> <silent> <End>  g<End>
inoremap <buffer> <silent> <Up>   <C-o>gk
inoremap <buffer> <silent> <Down> <C-o>gj
inoremap <buffer> <silent> <Home> <C-o>g<Home>
inoremap <buffer> <silent> <End>  <C-o>g<End>
set whichwrap+=<,>,[,]

set mousefocus
set mouse=a

"autocmd vimenter * NERDTree
"map <C-n> :NERDTreeToggle<CR>

"--- vim to jump to last position when reopening
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" VUNDLE SETUP :

filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'Nopik/vim-nerdtree-direnter'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on  " allows auto-indenting depending on file type

let g:gitgutter_enabled = 1
autocmd BufWritePost * GitGutter

colorscheme gruvbox
set background=dark

" NERDTree ------------------------------------------------------------------{{{

map <C-s> :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeMapOpenInTab='<ENTER>'
let g:nerdtree_tabs_autofind=1

"}}}

