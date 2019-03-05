filetype off

" -----------------------------
"  Dein
" -----------------------------
if &compatible
  set nocompatible " Be iMproved
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#add('Shougo/dein.vim')

  " Generate tmux theme from Vim
  " call dein#add('edkolev/tmuxline.vim')

  if has('neovim') || has('python3')
    " Auto complete
    call dein#add('Shougo/deoplete.nvim')

    " Deoplate languages
    call dein#add('Shougo/neco-vim')
    call dein#add('Shougo/neco-syntax')
  endif

  " NeoVim like Vim
  if !has('neovim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')

    if has('pythonx')
      set pyxversion=3
    end
  endif

  " Comment
  call dein#add('scrooloose/nerdcommenter')

  " Emmet
  call dein#add('mattn/emmet-vim')

  " Indent
  call dein#add('Yggdroot/indentLine')

  " Airline
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  " Whitespace
  call dein#add('bronson/vim-trailing-whitespace')

  " Linter
  call dein#add('w0rp/ale')

  " Language Pack
  call dein#add('sheerun/vim-polyglot')

  " Git
  call dein#add('airblade/vim-gitgutter')

  " Theme
  call dein#add('NLKNguyen/papercolor-theme')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
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
"  Airline
"-----------------------------
let g:airline_theme = 'powerlineish'
let g:airline#extensions#tabline#enabled = 1

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
let g:ale_perl_perl_options = '-c -Mwarnings -Ilib -I.'
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
autocmd FileType typescript setlocal sw=2 sts=2 ts=2 et
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
au BufRead,BufNewFile,BufReadPre *.mm        set filetype=objcpp

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
if has('nvim')
  set cursorline
endif

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
"  Cursor
" ----------------------------
if has('nvim')
  let &t_EI .= "\e[6 q"
endif

" ----------------------------
"  Keyboard mapping
" ----------------------------
nnoremap s <Nop>


" Split window (horizontal)
nnoremap sh :<C-u>sp<CR>

" Split window (vertical)
nnoremap sv :<C-u>vs<CR>

" Move window (Previous, Next)
nnoremap pw <C-w>W
nnoremap nw <C-w>w
" nnoremap tt <C-w>w

" Move window (Left, Down, Up, Right)
nnoremap rw <C-w>h
nnoremap dw <C-w>j
nnoremap uw <C-w>k
nnoremap lw <C-w>l



" New tab
nnoremap st :<C-u>tabnew<CR>

" Move tab (Previous, Next)
nnoremap nt gt
nnoremap pt gT

" No highlight
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

