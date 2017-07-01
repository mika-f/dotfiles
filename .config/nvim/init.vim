if &compatible
  set nocompatible " Be iMproved
endif

let g:cache_home  = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let g:config_home = empty($XDG_CONFIG_HOME) ? expand('~/.config') : $XDG_CONFIG_HOME

augroup MyAutoCmd
  autocmd!
augroup END

" dein {{{
let s:dein_cache_dir = g:cache_home . '/dein'

if &runtimepath !~# '/dein.vim'
  let s:dein_repo_dir = s:dein_cache_dir . '/repos/github.com/Shougo/dein.vim'

  " Auto download
  if !isdirectory(s:dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
  endif

  execute 'set runtimepath^=' . s:dein_repo_dir
endif

if dein#load_state(s:dein_cache_dir)
  call dein#begin(s:dein_cache_dir)

  let s:toml_dir = g:config_home . '/dein'

  call dein#load_toml(s:toml_dir . '/plugins.toml')
  call dein#load_toml(s:toml_dir . '/plugins_lazy.toml')

  call dein#end()
  call dein#save_state()
endif

filetype plugin on
filetype indent on
syntax enable

if has('vim_starting') && dein#check_install()
  call dein#install()
endif

" }}}

" vim {{{
set number

" tab
set tabstop=2
set expandtab
set shiftwidth=2

" indent
set smartindent
set autoindent

set virtualedit=block
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start

set incsearch
set cursorline
set ruler
set showcmd
set noshowmode
set showmatch
set noswapfile
set showtabline=2
set autoread

" }}}

" indent {{{
autocmd FileType vim setlocal sw=2 sts=2 ts=2 et
" }}}

" keyboard {{{
nnoremap s <Nop>

" window
nnoremap sh :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap wp <C-w>W
nnoremap wn <C-w>n
nnoremap tt <C-w>w
nnoremap wr <C-w>h
nnoremap wd <C-w>j
nnoremap wu <C-w>k
nnoremap wl <c-w>l

nnoremap <silent><Esc><Esc> :<C-w>set nohlsearch!<CR>
" }}}

