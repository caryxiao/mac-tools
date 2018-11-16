set nocompatible
syntax enable
" --- START 配置插件
"  设置插件的安装目录
filetype off

" 设置运行时的路径
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 加载插件和默认的配置文件
let VIMIDE_DIR=expand("<sfile>:p:h")
let RC_BUNDLES=expand(VIMIDE_DIR.'/.vimrc.bundles')
let RC_LOCAL=expand(VIMIDE_DIR.'/.vimrc.local')

if filereadable(RC_BUNDLES)
	exec 'source '.RC_BUNDLES
endif

if filereadable(RC_LOCAL)
	exec 'source '.RC_LOCAL
endif	

filetype plugin indent on

" --- END 配置插件

set backspace=indent,eol,start
set smartindent
set ruler
set number
set showcmd
set tabstop=4
set expandtab
set shiftwidth=4
set foldcolumn=2

set incsearch
set showmatch
set foldmethod=marker

set history=10000
" 把所有数字当成十进制
set nrformats=

" TAB命令自动补全设置
" '' 只用第一个匹配补全。
" full 用下一个完整的匹配补全。在最后一次匹配之后，使用原来的字符串，然后又是第一个匹配。
" longest 用最长的公共子串补全。如果结果没有变长，使用下一个部分。
" longest:full 类似于 longest，但如果 wildmenu 打开的话，使用之。
" list 如果有多于一个补全，列出所有的匹配。
" list:full 如果有多于一个补全，列出所有的匹配并先用第一个补全。
" list:longest 如果有多于一个补全，列出所有的匹配并先用最长的子串补全。
set wildmenu
set wildmode=full

" 自动备份
if has('vms')
	set nobackup
else 
	set backup
endif

autocmd BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/*,/usr/local/etc/nginx/* set filetype=nginx | syntax on

let editorconfig=expand('/data/tools/src/vim/.editorconfig')
if filereadable(editorconfig)
	let g:editorconfig_Beautifier=editorconfig
endif

" 备份文件位置
if !filereadable(expand('~/backup/vim/'))
    silent execute ":!mkdir -p ~/backup/vim"
endif
set backupdir=~/backup/vim
set backupext=.bak

" Visual Mode 快捷键
map vi' <Esc>?'<CR>lv/'<CR>h
map vi" <Esc>?"<CR>lv/"<CR>h
map va' <Esc>?'<CR>v/'<CR>
map va" <Esc>?"<CR>v/"<CR>
map vix <Esc>?><CR>lv/<<CR>h
map vi= <ESC>?\s\+\S\+\s*=\s*\S\+<CR>lv/=<CR>/\S<CR>/[\s<>\n]<CR>h
map vi/ <Esc>?\/<CR>l<Esc>v/\/<CR>h
map vt) <ESC>v/)<CR>h
map vt' <ESC>v/'<CR>h
map vt" <ESC>v/"<CR>h
map vt; <ESC>v/;<CR>h
map vt, <ESC>v/,<CR>h
map vt} <ESC>v/}<CR>h

" 补全规则
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType c setlocal omnifunc=ccomplete#Complete
autocmd FileType vim set omnifunc=syntaxcomplete#Complete

" html 默认折叠为2级
autocmd BufRead,BufNewFile FileType html setlocal foldlevel=2

" 去除 PHP 尖括号「<:>」的默认匹配与自动补全
autocmd FileType php set matchpairs-=<:>

" 使 php 和 js 的单词带 $ 符号，从而修复 Debug 问题
autocmd FileType php,javascript setlocal iskeyword+=$
autocmd FileType php setlocal iskeyword-=-

" 保存前自动压缩末尾空格
autocmd BufWritePre *.pl :%s/\s\+$//e

" 文件编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
scriptencoding utf-8

" set background=dark
set errorformat=%m\ in\ %f\ on\ line\ %l

" 配色Vim为256
set t_Co=256
set bg=dark
colorscheme default

