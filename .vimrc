set nocompatible               " be iMproved
filetype off


if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'

" Auto Complete
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'violetyk/neocomplete-php.vim'        " PHP
NeoBundle 'marcus/rsense'                       " Ruby
NeoBundle 'supermomonga/neocomplete-rsense.vim' " Ruby

" Static code analysis
NeoBundle 'scrooloose/syntastic'

" Commentout
NeoBundle 'scrooloose/nerdcommenter'

" Ref Documents
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'                   " Ruby

" Jump to definition
NeoBundle 'szw/vim-tags'

" Open FileTree by :NERDTREE.
NeoBundle 'scrooloose/nerdtree'

" Ruby
NeoBundle 'vim-ruby/vim-ruby'                   " Ruby

" Ruby on Rails Commands
NeoBundle 'tpope/vim-rails'                     " Ruby

" if - end
NeoBundle 'tpope/vim-endwise'                   " Ruby

" Indent Guide
NeoBundle 'nathanaelkane/vim-indent-guides'

" Syntax Highlight - .log
NeoBundle 'vim-scripts/AnsiEsc.vim'

" Unite : see alto -> http://qiita.com/hide/items/77b9c1b0f29577d60397
NeoBundle 'Shougo/unite.vim'
NeoBundle 'basyura/unite-rails'                 " Ruby

" Syntax Highlight - SCSS
NeoBundle 'cakebaker/scss-syntax.vim'           " SCSS

" Syntax Highlight - HTML5
NeoBundle 'othree/html5.vim'                    " HTML5

" Syntax Highlight - CSS3
NeoBundle 'hail2u/vim-css3-syntax'              " CSS3

" Syntax Highlight - JavaScript
NeoBundle 'jelera/vim-javascript-syntax'        " JavaScript

" CSS Color
NeoBundle 'lilydjwg/colorizer'                  " CSS

" Syntax Highlight- TypeScript 
NeoBundle 'leafgarland/typescript-vim'          " TypeScript

" Auto Complete - TypeScript
NeoBundle 'clausreinke/typescript-tools.vim'    " TypeScript

" Beautiful status line
NeoBundle 'itchyny/lightline.vim'

" Color schemes
NeoBundle 'NLKNguyen/papercolor-theme'
NeoBundle 'lyxell/pride.vim'
NeoBundle 'idbrii/vim-sandydune'
NeoBundle 'tomasr/molokai'
NeoBundle 'altercation/vim-colors-solarized'

call neobundle#end()
filetype plugin on
filetype indent on

NeoBundleCheck

" -------------------------------
" Indents 
" -------------------------------
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
autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et


" --------------------------------
" neocomplete.vim
" --------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'
let g:neocomplete#sources#rsense#home_directory = '/usr/local/bin/rsense'

" --------------------------------
" neocomplete-php.vim
" --------------------------------
let g:neocomplete_php_locale = 'ja'


" -------------------------------
" Rsense
" -------------------------------
" let g:rsenseHome = '/usr/local/lib/rsense-0.3'
" let g:rsenseUseOmniFunc = 1


" --------------------------------
" syntastic-rubocop
" --------------------------------
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']


" --------------------------------
" nerdcommenter
" --------------------------------
let NERDSpaceDelims = 1
nmap cc <Plug>NERDCommenterToggle 
vmap cc <Plug>NERDCommenterToggle


" --------------------------------
" vim-indent-guides
" --------------------------------
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=244
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=248
let g:indent_guides_color_change_percent=30
let g:indent_guides_guide_size =1 


" --------------------------------
" scss-syntax
" --------------------------------
au BufRead,BufNewFile *.scss set filetype=sass


" --------------------------------
" lightline.vim
" --------------------------------
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [['mode', 'paste'],
      \           ['readonly', 'filename', 'modified']]
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly?"\ud83d\udd12":""}',
      \   'modified': '%{&modified?"+":&modifiable?"":"-"}'
      \ },
      \ }


" --------------------------------
" Basic
" --------------------------------

" enable: syntax highlight
syntax on

" enable: line number
set number

" enable: title
set title

" enable: tab to space
set tabstop=2
set expandtab
set shiftwidth=2

" enable: smartindent / autoindent
set smartindent
set autoindent

" 
set virtualedit=block
set whichwrap=b,s,[,],<,>

" enable: backspace
set backspace=indent,eol,start

" enable: ruler
set ruler

" enable: show command
set showcmd

" enable: show current mode
set showmode

" enable: do not create .swap
set noswapfile

" enable: 256 colors.
set t_Co=256

" enable: dark theme
set background=dark

" enable: auto reload
set autoread

" 
colorscheme PaperColor 

" --------------------------------
" Keyboard Mapping
" --------------------------------
" nnoremap NewKeyMap OldKeyMap
nnoremap s <Nop>
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap tt <C-w>w
