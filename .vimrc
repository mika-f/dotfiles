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
NeoBundle 'basyura/unite-rails.vim'             " Ruby

" SCSS のシンタックスハイライト
NeoBundle 'cakebaker/scss-syntax.vim'           " SCSS


call neobundle#end()
filetype plugin indent on
filetype indent on

NeoBundleCheck

" -------------------------------
" Rsens
" -------------------------------
let g:rsenseHome = '/usr/local/lib/rsense-0.3'
let g:rsenseUseOmniFunc = 1

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

" --------------------------------
" rubocop
" --------------------------------
" syntastic_mode_mapをactiveにするとバッファ保存時にsyntasticが走る
" active_filetypesに、保存時にsyntasticを走らせるファイルタイプを指定する
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

" --------------------------------
" scss-syntax
" --------------------------------
au BufRead,BufNewFile *.scss set filetype=sass

" シンタックスハイライト
syntax on

" 行番号表示
set number

" タイトル表示
set title

" タブをスペース4つに
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

let g:indent_guides_enable_on_vim_startup = 1

colorscheme elflord
