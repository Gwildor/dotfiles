set t_Co=256
syntax enable
set background=dark
colorscheme gruvbox

let mapleader=','
nmap <space> :
set autowrite
au FocusLost * :wa

set ruler
set number
set tabstop=4
set softtabstop=4
set expandtab
set cursorline
set wildmenu
set showmatch
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase
set smartcase

autocmd BufNewFile,BufRead *.json set ft=javascript   " JS highlighting is good enough for now for JSON

if &term == 'xterm-256color' || &term == 'screen-256color'
    let &t_SI = "\<Esc>[5 q"
    let &t_EI = "\<Esc>[1 q"
endif

if $TERM_PROGRAM =~ "iTerm"
    " 0 for block, 1 for pipe
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    autocmd VimEnter * silent !echo -ne "\033]50;CursorShape=0\a"
    autocmd VimLeave * silent !echo -ne "\033]50;CursorShape=1\a"
endif

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
