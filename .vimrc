" Configuration file for vim
" 设置主题
colorschem Bgreen
syntax enable
"colorscheme solarized
set encoding=utf-8
set modelines=0" CVE-2007-2438
set nocompatible " 关闭 vi 兼容模式
filetype off " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
if filereadable(expand("~/.vimrc.bundles"))
source ~/.vimrc.bundles
endif
Plugin 'VundleVim/Vundle.vim'

call vundle#end()

syntax on " 自动语法高亮
" 用浅色高亮当前行
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul
"colorscheme codeschool" 设定配色方案
"set number " 显示行号
set cursorline " 突出显示当前行
"set cursorcolumn        "突出显示当前列"
set ruler " 打开状态栏标尺
set shiftwidth=4" 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4" 使得按退格键时可以一次删掉 4 个空格
set tabstop=4 " 设定 tab 长度为 4
set nobackup " 覆盖文件时不备份
set nowb
set noswapfile
set noundofile
set  autochdir " 自动切换当前目录为当前文件所在的目录
filetype plugin indent on
" 分为三部分命令：file on, file plugin on, file indent on.分别表示自动识别文件类型，用文件类型脚本，使用缩进定义文件。
set backupcopy=yes " 设置备份时的行为为覆盖
set ignorecase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set nowrapscan " 禁止在搜索到文件两端时重新搜索
set incsearch " 输入搜索内容时就显示搜索结果
set hlsearch " 搜索时高亮显示被找到的文本
set noerrorbells " 关闭错误信息响铃
set novisualbell " 关闭使用可视响铃代替呼叫
set t_vb= " 置空错误铃声的终端代码
set showmatch " 插入括号时，短暂地跳转到匹配的对应括号
set matchtime=2 " 短暂跳转到匹配括号的时间
set magic " 设置魔术
set nowrap    "设置不折行"
set fileformat=unix    "设置以unix的格式保存文件"
set cindent        "设置C样式的缩进格式"
set hidden " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set guioptions-=T " 隐藏工具栏
set guioptions-=m " 隐藏菜单栏
" 隐藏滚动条"    
"set guioptions-=r 
"set guioptions-=L
"set guioptions-=b
"隐藏顶部标签栏"
"set showtabline=0
set smartindent" 开启新行时使用智能自动缩进
set autoindent" 自动对齐
set backspace=indent,eol,start
" 不设定在插入状态无法用退格键和 Delete 键删除回车符
set cmdheight=1" 设定命令行的行数为 1
set laststatus=2" 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\%<%F[%1*%M%*%n%R%H]%=\%y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\
" 设置在状态行显示的信息
set foldenable " 开始折叠
set foldmethod=syntax " 设置语法折叠
set foldcolumn=0 " 设置折叠区域的宽度
setlocal foldlevel=1 " 设置折叠层数为
set foldclose=all " 设置为自动关闭折叠 
 nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
set confirm" 在处理未保存或只读文件的时候，弹出确认
set noexpandtab" 不要用空格代替制表符
set history=50 " 历史纪录数
set gdefault " 行内替换
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,utf-16,big5,euc-jp,latin1 " 编码设置
"set guifont=Menlo:h16:cANSI " 设置字体
"set langmenu=zn_CN.UTF-8
set helplang=cn " 语言设置
set showcmd " 在状态行显示目前所执行的命令，未完成的指令片段亦会显示出来
set scrolloff=3 " 光标移动到buffer的顶部和底部时保持3行距离
set autowrite " 在切换buffer时自动保存当前文件
set fenc=utf-8      "文件编码"
set wildmenu " 增强模式中的命令行自动完成操作
set linespace=2 " 字符间插入的像素行数目
set whichwrap=b,s,<,>,[,]" 开启Normal或Visual模式下Backspace键，空格键，左方向键，右方向键，Insert或replace模式下左方向键，右方向键跳行的功能。
set autoread


set tags=tags
set autochdir
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
"设置ctags路径
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'

"启动vim后自动打开taglist窗口
let Tlist_Auto_Open = 0

"不同时显示多个文件的tag，仅显示一个
let Tlist_Show_One_File = 1

"taglist为最后一个窗口时，退出vim
let Tlist_Exit_OnlyWindow = 1

"taglist窗口显示在右侧，缺省为左侧
let Tlist_Use_Right_Window =1

"设置taglist窗口大小
"let Tlist_WinHeight = 100
let Tlist_WinWidth = 40

"设置taglist打开关闭的快捷键F8
noremap <F8> :TlistToggle<CR>

"更新ctags标签文件快捷键设置
noremap <F6> :!ctags -R<CR>


" C++ part
set exrc
set secure
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
    autocmd BufRead,BufNewFile *.hpp,*.cpp set filetype=cpp.doxygen
augroup END

set makeprg=make\ -C\ -j64
nnoremap <F3> :make!<cr>


"let g:solarized_termcolors=256
"let g:solarized_termtrans = 1
"let g:solarized_degrade = 1
"let g:solarized_bold = 1
"let g:solarized_underline = 1
"let g:solarized_italic = 1
"let g:solarized_contrast = "high"
""let g:solarized_contrast = "normal"
"let g:solarized_visibility= "normal"
