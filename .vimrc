"" Plug plugins
" [PlugInstall] [PlugClean]
call plug#begin('~/.vim/plugged')

Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'

" Language specific
Plug 'hdima/python-syntax'
Plug 'hynek/vim-python-pep8-indent'
Plug 'rust-lang/rust.vim'
Plug 'elzr/vim-json'
Plug 'mitsuhiko/vim-jinja'

call plug#end()

set t_Co=256
syntax enable
set background=dark
colorscheme Tomorrow-Night-Bright
" For some reason, inactive line number is barely noticable for Tomorrow-Night-Bright
highlight LineNr ctermfg=102
highlight link jsonNumber javaScriptNumber
highlight link jsonBoolean javaScriptFunction
highlight link pythonOperator pythonExClass

let mapleader=','

set ruler
set number
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set cursorline
set wildmenu
set wildignore+=*.pyc
set showmatch
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase
set smartcase
set autoindent
set smartindent
set hidden
set laststatus=2
set backspace=2
set colorcolumn=80
set nostartofline       " Don't go to start of line when moving around, like switching buffers
set nobackup
set noswapfile
set scrolloff=3
set sessionoptions=buffers,curdir,help
set mouse=
set pastetoggle=<F2>

" Save with ,s
nnoremap <leader>s :update<CR>

nnoremap \[ :bprev<CR>
nnoremap \] :bnext<CR>
" Close buffer with ,c
nnoremap <leader>c :bp <BAR> bd #<CR>

" Easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

nnoremap <leader>n :NERDTreeToggle<CR>

nnoremap <silent><esc> :noh<CR>
nnoremap <esc>^[ <esc>^[

if $TERM_PROGRAM =~ "iTerm"
    " 0 for block, 1 for pipe, 2 for underline
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=2\x7"

    " The VimEnter line causes the random stuff on the command line on enter
    autocmd VimEnter * silent !echo -ne "\033]50;CursorShape=2\a"
    autocmd VimLeave * silent !echo -ne "\033]50;CursorShape=1\a"
else
    let &t_SI = "\<Esc>[5 q"
    let &t_EI = "\<Esc>[1 q"
endif

" Move lines around
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
vnoremap <leader>j :m '>+1<CR>gv=gv
vnoremap <leader>k :m '<-2<CR>gv=gv

" Reselect visual block after indent/outdent.
vnoremap < <gv
vnoremap > >gv

" Relative line numbers
set rnu
nnoremap <silent><leader>l :set rnu! rnu? <cr>
autocmd InsertEnter,FocusLost,WinLeave,CmdwinLeave * silent! :set norelativenumber
autocmd InsertLeave,FocusGained,WinEnter,BufEnter,CmdwinEnter * silent! :set relativenumber

" Fix escaping insert mode having a delay
autocmd InsertEnter * set timeoutlen=0
autocmd InsertLeave * set timeoutlen=1000

let g:airline_theme='raven'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_open_multiple_files = 'i'  " Open multiple files as buffers, not as splits

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

let python_highlight_all = 1

let NERDTreeIgnore=['^__pycache__$[[dir]]', '\.pyc$']
