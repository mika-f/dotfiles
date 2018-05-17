filetype off

" -----------------------------
"  Dein
" -----------------------------
if &compatible
  set nocompatible " Be iMproved
endif

set runtimepath+=~/.vim/repos/github.com/Shougo/dein.vim
if !has('nvim')
  set pyxversion=3
endif

call dein#begin('~/.vim')
call dein#add('Shougo/dein.vim')

" Auto complete
call dein#add('Shougo/deoplete.nvim')
if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif

" deoplete languages
call dein#add('Shougo/neco-vim')
call dein#add('Shougo/neco-syntax')

" Comment
call dein#add('scrooloose/nerdcommenter')

" Emmet
call dein#add('mattn/emmet-vim')

" Indent
call dein#add('Yggdroot/indentLine')

" Powerline
if has('nvim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
else
  call dein#add('powerline/powerline', {'rtp': 'powerline/bindings/vim'})
endif

" Whitespace
call dein#add('bronson/vim-trailing-whitespace')

" Linter
call dein#add('w0rp/ale')

" Language Pack
call dein#add('sheerun/vim-polyglot')

" Theme
call dein#add('NLKNguyen/papercolor-theme')

call dein#end()


filetype plugin on
filetype indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

" ----------------------------
" deoplete
" ----------------------------
let g:deoplete#enable_at_startup = 1
set completeopt+=noinsert

" ----------------------------
" nerdcommenter
" ----------------------------
let NERDSpaceDelims = 1

nmap cc <Plug>NERDCommenterToggle
vmap cc <Plug>NERDCommenterToggle

" ----------------------------
"  Powerline
"-----------------------------
if !has('nvim')
  if !dein#check_install(['powerline'])
    let g:Powerline_symbols = 'fancy'
  endif
else
  let g:airline_theme = 'powerlineish'
endif


" ----------------------------
"  ALE
" ----------------------------
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_linters = {
\  'perl': ['perl', 'perlcritic']
\}

let g:ale_fixers = {
\  'perl': ['perltidy']
\}

" Perl
let g:ale_perl_perl_executable = 'perl'
let g:ale_perl_perl_options = '-c -Mwarnings -Ilib'
let g:ale_perl_perltidy_options = ''


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
autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et

" ----------------------------
"  File Type
" ----------------------------
au BufRead,BufNewFile,BufReadPre *.coffee    set filetype=coffee
au BufRead,BufNewFile,BufReadPre *.jpbuilder set filetype=ruby
au BufRead,BufNewFile,BufReadPre *.scss      set filetype=sass
au BufRead,BufNewFile,BufReadPre *.t         set filetype=perl
au BufRead,BufNewFile,BufReadPre *.psgi      set filetype=perl
au BufRead,BufNewFile,BufReadPre cpanfile    set filetype=perl

" ----------------------------
"  Basic
" ----------------------------
" Line number
set number

" for Multi-Byte Chars
" But set to 'double', Powerline collapses.
" set ambiwidth=double

" Tab to Space
set tabstop=2
set expandtab
set shiftwidth=2

" Encoding
set encoding=utf-8


" Indent
set smartindent
set autoindent

" Incremental search
set incsearch

" Highlight search result
set hlsearch

" Highlight curline
" set cursorline

" 回り込み
set virtualedit=block
set whichwrap=b,s,[,],<,>

" Backspace
set backspace=indent,eol,start

" Ruler
" set ruler

" Show cmmand
set showcmd

" Show mode
set noshowmode

" Show match braces
set showmatch

" trash .swap
set noswapfile

"
" set showtabline=2

" 256 colors
set t_Co=256

" Dark!
set background=dark

" Auto reload
set autoread

set laststatus=2
set synmaxcol=200

" Color Scheme
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
autocmd ColorScheme * highlight NonText ctermbg=none
colorscheme PaperColor

" ----------------------------
"  Keyboard mapping
" ----------------------------
nnoremap s <Nop>

" Split window (horizontal)
nnoremap sh :<C-u>sp<CR>

" Split window (vertical)
nnoremap sv :<C-u>vs<CR>

" Move window (Previous, Next)
nnoremap wp <C-w>W
nnoremap wn <C-w>w
nnoremap tt <C-w>w

" Move window (Left, Down, Up, Right)
nnoremap wr <C-w>h
nnoremap wd <C-w>j
nnoremap wu <C-w>k
nnoremap wl <C-w>l

" No highlight
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

