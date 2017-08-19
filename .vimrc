filetype off

" -----------------------------
"  Dein
" -----------------------------
if &compatible
  set nocompatible " Be iMproved
endif

set runtimepath+=~/.vim/repos/github.com/Shougo/dein.vim

call dein#begin('~/.vim')
call dein#add('Shougo/dein.vim')

" Default
if has('lua')
  " Code completion
  call dein#add('Shougo/neocomplete.vim')

  " Code Snippets
  " call dein#add('Shougo/neosnippet')
  " call dein#add('Shougo/neosnippet-snippets')
endif

" Comment
call dein#add('scrooloose/nerdcommenter')

" Emmet
call dein#add('mattn/emmet-vim')

" Indent
call dein#add('Yggdroot/indentLine')

" Powerline
call dein#add('powerline/powerline', {'rtp': 'powerline/bindings/vim'})

" Whitespace
call dein#add('bronson/vim-trailing-whitespace')

" Auto Insert `end`, `#endif` and others.
call dein#add('tpope/vim-endwise')

" Language Pack
call dein#add('sheerun/vim-polyglot')

" Theme
call dein#add('NLKNguyen/papercolor-theme')

" Optional


call dein#end()


filetype plugin on
filetype indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

" ----------------------------
"  neocomplete.vim, neosnippet
" ----------------------------
" if !dein#check_install(['neocomplete.vim', 'neosnippet'])
if !dein#check_install('neocomplete.vim')
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1
  " let g:neocomplete#min_keyword_length = 3
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#auto_completion_start_length = 1

  " imap <C-k> <Plug>(neosnippet_expand_or_jump)
  " smap <C-k> <Plug>(neosnippet_expand_or_jump)
  " xmap <C-k> <Plug>(neosnippet_expand_target)

  " inoremap <expr><CR>  pumvisible() ? neocomplete#close_popup() : "<CR>"
  " inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"
  " imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#expandable_or_jumpable() ? "\<Plug>(neisnippet_expand_or_jump)" : "\<TAB>"
  " smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
  " if !exists('g:neocomplete#force_omni_input_patterns')
    " let g:neocomplete#force_omni_input_patterns = {}
  " endif
  " let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif
endif

" ----------------------------
" nerdcommenter
" ----------------------------
let NERDSpaceDelims = 1

nmap cc <Plug>NERDCommenterToggle
vmap cc <Plug>NERDCommenterToggle

" ----------------------------
"  Powerline
"-----------------------------
if !dein#check_install(['powerline'])
  let g:Powerline_symbols = 'fancy'
endif

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
" Line number
set number

" for Multi-Byte Chars
" But set to 'double', Powerline collapses.
" set ambiwidth=double

" Tab to Space
set tabstop=2
set expandtab
set shiftwidth=2

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

