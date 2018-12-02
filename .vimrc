set nocompatible

set t_Co=256

set cursorline
set cursorcolumn
hi CursorLine   cterm=NONE ctermfg=NONE ctermbg=235
hi CursorColumn cterm=NONE ctermfg=NONE ctermbg=235
hi LineNr ctermfg=236 ctermbg=233

set colorcolumn=80
hi ColorColumn ctermbg=52

" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" If youG have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
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
"set statusline+=%{SyntasticStatuslineFlag()}
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

colorscheme gruvbox
set background=dark


