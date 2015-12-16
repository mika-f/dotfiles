set nocompatible               " be iMproved
filetype off


if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'

" 補完機能
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'violetyk/neocomplete-php.vim'        " PHP
NeoBundle 'marcus/rsense'                       " Ruby
NeoBundle 'supermomonga/neocomplete-rsense.vim' " Ruby

" 静的解析
NeoBundle 'scrooloose/syntastic'

" コメントアウト/コメント を一発で
NeoBundle 'scrooloose/nerdcommenter'

" ドキュメント参照
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'                   " Ruby

" 定義元へジャンプ
NeoBundle 'szw/vim-tags'

" :NERDTREE コマンドで、ファイルツリーの表示 ～ Enterなどでオープン
NeoBundle 'scrooloose/nerdtree'

" Ruby on Rails 向けコマンドの追加
NeoBundle 'tpope/vim-rails'                     " Ruby

" Ruby において if などの end の自動入力
NeoBundle 'tpope/vim-endwise'                   " Ruby

" インデントを見やすく
NeoBundle 'nathanaelkane/vim-indent-guides'

" ログファイルのハイライト
NeoBundle 'vim-scripts/AnsiEsc.vim'

" Unite : see alto -> http://qiita.com/hide/items/77b9c1b0f29577d60397
NeoBundle 'Shougo/unite.vim'
NeoBundle 'basyura/unite-rails'                 " Ruby

" SCSS のシンタックスハイライト
NeoBundle 'cakebaker/scss-syntax.vim'           " SCSS

" HTML5 のシンタックスハイライト
NeoBundle 'othree/html5.vim'                    " HTML5

" CSS3 のシンタックスハイライト
NeoBundle 'hail2u/vim-css3-syntax'              " CSS3

" JavaScript のシンタックスハイライト
NeoBundle 'jelera/vim-javascript-syntax'        " JavaScript

" CSS で、カラーコードを見やすく
NeoBundle 'lilydjwg/colorizer'                  " CSS

" ステータスラインをいい感じにする
NeoBundle 'itchyny/lightline.vim'

" カラースキーム
" 一応幾つか
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
" インデント
" -------------------------------
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
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


" --------------------------------
" neocomplete-php.vim
" --------------------------------
let g:neocomplete_php_locale = 'ja'


" -------------------------------
" Rsens
" -------------------------------
let g:rsenseHome = '/usr/local/lib/rsense-0.3'
let g:rsenseUseOmniFunc = 1


" --------------------------------
" syntastic-rubocop
" --------------------------------
" syntastic_mode_mapをactiveにするとバッファ保存時にsyntasticが走る
" active_filetypesに、保存時にsyntasticを走らせるファイルタイプを指定する
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']


" --------------------------------
" nerdcommenter
" --------------------------------
let NERDSpaceDelims = 1
" c連打で楽しいことになる
nmap cc <Plug>NERDCommenterToggle 
vmap cc <Plug>NERDCommenterToggle


" --------------------------------
" vim-indent-guides
" --------------------------------
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=239
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=242
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

" シンタックスハイライト
syntax on

" 行番号表示
set number

" タイトル表示
set title

" タブをスペース2つに
set tabstop=2
set expandtab
set shiftwidth=2

" インデント
set smartindent
set autoindent

" 回り込み
set virtualedit=block
set whichwrap=b,s,[,],<,>

" バックスペース
set backspace=indent,eol,start

" ルーラー
set ruler

" コマンド表示
set showcmd

" 現在のモードを表示
set showmode

" .swap を作らない
set noswapfile

" 256色で
set t_Co=256

" ダークモード
set background=dark

" カラースキーム
colorscheme PaperColor 

" --------------------------------
" Keyboard Mapping
" --------------------------------
" nnoremap NewKeyMap OldKeyMap
nnoremap s <Nop>
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sw <C-w>w
