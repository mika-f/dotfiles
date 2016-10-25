set nocompatible " be iMproved
filetype off

filetype plugin on
filetype indent on

" ----------------------------
"  Indent
" ----------------------------
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
autocmd FileType typescript setlocal sw=4 sts=4 ts=4 et
autocmd FileType sh         setlocal sw=2 sts=2 ts=2 et
autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et

" ----------------------------
"  File Type
" ----------------------------
au BufRead,BufNewFile,BufReadPre *.coffee    set filetype=coffee
au BufRead,BufNewFile,BufReadPre *.jpbuilder set filetype=ruby
au BufRead,BufNewFile,BufReadPre *.scss      set filetype=sass

" ----------------------------
"  Basic
" ----------------------------
syntax on

" 行番号
set number

" Tab to Space
set tabstop=2
set expandtab
set shiftwidth=2

" Indent
set smartindent
set autoindent

" 回り込み
set virtualedit=block
set whichwrap=b,s,[,],<,>

" Backspace
set backspace=indent,eol,start

" Ruler
set ruler

" Command
set showcmd

" Show mode
set showmode

" trash .swap
set noswapfile

" 256 colors
set t_Co=256

" Dark!
set background=dark

" Auto reload
set autoread

" Color Scheme
colorscheme PaperColor

" ----------------------------
"  Keyboard mapping
" ----------------------------
nnoremap s <Nop>
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap tt <C-w>w

