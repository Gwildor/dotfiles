"" Plug plugins
" [PlugInstall] [PlugClean]
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'bling/vim-airline'

Plug 'ctrlpvim/ctrlp.vim'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer' }

call plug#end()

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
set shiftwidth=4
set expandtab
set cursorline
set wildmenu
set showmatch
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase
set smartcase
set autoindent
set smartindent
set hidden
set laststatus=2

let g:airline_theme='raven'
let g:airline#extensions#tabline#enabled = 1
nnoremap <C-[> :bprev<CR>
nnoremap <C-]> :bnext<CR>

autocmd BufNewFile,BufRead *.json set ft=javascript   " JS highlighting is good enough for now for JSON

if $TERM_PROGRAM =~ "iTerm"
    " 0 for block, 1 for pipe, 2 for underline
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=2\x7"
    autocmd VimEnter * silent !echo -ne "\033]50;CursorShape=2\a"
    autocmd VimLeave * silent !echo -ne "\033]50;CursorShape=1\a"
else
    let &t_SI = "\<Esc>[5 q"
    let &t_EI = "\<Esc>[1 q"
endif

" Move lines around
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
inoremap <leader>j <Esc>:m .+1<CR>==gi
inoremap <leader>k <Esc>:m .-2<CR>==gi
vnoremap <leader>j :m '>+1<CR>gv=gv
vnoremap <leader>k :m '<-2<CR>gv=gv

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
