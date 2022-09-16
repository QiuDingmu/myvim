" ====	编码设置	========================================================={{{
" 设置打开文件的编码格式  
set fileencoding=utf-8
set fileencodings=utf-8,gbk,gb2312,gb18030,big5,cp936,ucs-bom,latin,1euc-jp,euc-kr,latin1
" Vim 在与屏幕/键盘交互时使用的编码(取决于实际的终端的设定)        
let &termencoding=&encoding
set encoding=utf-8
set langmenu=zh_CN.UTF-8            " 设置中文帮助
language messages zh_cn.utf-8       " 设置中文messages
set helplang=cn                     " 设置中文帮助
"set ambiwidth=doubleset            " 设置为双字宽显示，否则无法完整显示如:☆
"}}}

" 插件设置	==========================================
source $XDG_CONFIG_HOME\Vim\vim-plugin.vim

" ====	界面显示设置	====================================================={{{
colorscheme monokai		            " 主题(插件主题)
" colorscheme vstudioDark	    	" 主题(插件主题)
" colorscheme darkblue		    	" 主题(系统主题)
set number				            " 设置显示行号
set rnu                             " 设置相对行号 
set lbr                             " 折行显示时不折断单词
set nowrap                          " 不自动换行
"set guifont=Consolas:h14		    " 字体
set guifont=Fira_Code_Medium:h12	" 字体(非Win10系统自带)
"set guifont=Ubuntu_Mono_derivative_Powerlin:h15	" 字体(非Win10系统自带)
"set lines=30 columns=100        " 启动时窗口大小设置
autocmd GUIEnter * simalt ~x   " 启动时窗口最大化
"set nowrap                     " 不自动换行
"set guioptions+=b              " 添加水平滚动条
"}}}
 
" ====	编辑设置	========================================================={{{
set nocompatible                 " 取消与vi的一致性
set scrolloff=9                  " 光标移动时与顶部与底部保持距离(行)
"文件路径  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++{{{
set browsedir=buffer
set autochdir   
set undodir      =$XDG_CONFIG_HOME\Vim\undodir 
set backupdir    =$XDG_CONFIG_HOME\Vim\undodir 
"set nobackup                    " 不生成备份文件~
"set noswapfile                  " 不生成交换文件.swp
"}}}
" 关于字符  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++{{{
set showmatch                    " 高亮显示匹配的括号
set matchtime    =2              " 高亮括号的闪烁时间
set shiftwidth   =4              " 自动缩进符
set tabstop      =4              " tab制表符
set softtabstop  =4              " 4个空格符视为tab符
set expandtab                    " tab符视为空格符
set smarttab                     " 使用退格键时辨别tab
set whichwrap+=b,s,[,],<,>,h,l   " 设置光标键跨行
noremap <leader><cr> :nohlsearch<cr>    " 取消搜索高亮
"}}}
" 代码折叠  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++{{{
set foldenable
set foldmethod   =marker         " 设置折叠方式-对文中标志折叠
"set foldmethod   =indent         " 设置折叠方式-更多的缩进表示更高级别的折叠
" 用空格键开关折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<cr>
"}}}
" 关于鼠标  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++{{{
"set mouse=nv                    " 使得鼠标在normal模式与version模式下可用
"}}}
" 编辑时窗口样式" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++{{{
filetype indent on               " 载入相关缩进格式实现自动缩进
filetype plugin indent on        " 为特定文件载入相关缩进文件
set colorcolumn=79               " 将该列高亮以标识编辑页面宽度
" 设置高亮条标识光标位置
au WinLeave * set nocursorline | set nocursorcolumn
au WinEnter * set cursorline   | set   cursorcolumn
" 关于buffer的操作  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++{{{
" 设置切换Buffer快捷键"
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
"}}}


"}}}


"}}}

" command模式下<C-R><C-W>插入光标处的word
" command模式下<C-R><C-A>插入光标处的WORD
" :verbose map <key>就可以查看按键<key>的映射。例如我们查看按键_+的映射：
" :help {key}^D 来找出是否一个键已经用于某些命令。 ({key} 用于指定你要寻找的键



" ====  自动插入文件头  ======================================================{{{
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.h,*.[ch],*.sh,*.java exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#########################################################################") 
        call append(line("."),   "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: QiuDingmu") 
        call append(line(".")+2, "\# mail: hongxianw@whu.edu.cn") 
        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+4, "\#########################################################################") 
        call append(line(".")+5, "\#!/bin/bash") 
        call append(line(".")+6, "") 
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."),   "    > File Name:      ".expand("%")) 
        call append(line(".")+1, "    > Author:         QiuDingmu") 
        call append(line(".")+2, "    > Mail:           hongxianw@whu.edu.cn ") 
        call append(line(".")+3, "    > Created Time:   ".strftime("%c")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        if expand("%") == 'main.cpp'
            call append(line(".")+7, "")
            call append(line(".")+8,  "int main(int argc, char** argv){")
            call append(line(".")+9,  "    std::cout << \"Hellow C++! \" << std::endl;")
            call append(line(".")+10, "    return 0;")
            call append(line(".")+11, "}")
        endif
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc 

"C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "! %<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! %<"
    "elseif &filetype == 'java' 
    "    exec "!javac %" 
    "    exec "!java %<"
    elseif &filetype == 'sh'
        :!%
    endif
endfunc


"}}}
