call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'preservim/nerdcommenter'
  Plug 'morhetz/gruvbox'
call plug#end()

"""""""""""
" nerdtree
"""""""""""
map <C-n> :NERDTreeToggle<CR>


"""""""""""""""""
" General
" 一般
"""""""""""""""""
" 默认编码
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

" VI的键盘模式
set nocompatible

" history记录行数
" how many lines of history has to remember
set history=1000

" enable filetype dectection and ft specific plugin/indent
filetype plugin indent on

" enable syntax hightlight and completion
syntax on

"""""""""""""""""
" Vim UI
"""""""""""""""""
" color scheme
colorscheme gruvbox
"set background=dark
set background=light
" 启用256色
set t_Co=256

" 开启True-Color
if has("termguicolors")
    " enable true color
    set termguicolors
endif

" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
set cursorcolumn
" 设置行宽，一行显示字符数量
set textwidth=120
" 高亮显示匹配的括号
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2

set showmode
set showcmd

set hlsearch
set incsearch
" 搜索时忽略大小写
set ignorecase
"""""""""""""""""
" 
"""""""""""""""""
set expandtab
" 自动格式化
set formatoptions=tcrqn

set autoindent
set tabstop=2

set softtabstop=2
set shiftwidth=2

set nowrap
set smarttab

""""""""""""
" commenter
""""""""""""
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
