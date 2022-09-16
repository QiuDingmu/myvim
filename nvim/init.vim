" ====	编码设置	========================================================={{{
" Vim 在与屏幕/键盘交互时使用的编码(取决于实际的终端的设定)        
set encoding=utf-8
set langmenu=zh_CN.UTF-8
" 设置打开文件的编码格式  
set fileencodings=ucs-bom,utf-8,gbk,gb2312,cp936,gb18030,big5,euc-jp,euc-kr,latin1 
set fileencoding=utf-8

"let termencoding=utf-8 
let &termencoding=&encoding
" 设置中文帮助
set helplang=cn
" 设置为双字宽显示，否则无法完整显示如:☆
"set ambiwidth=doubleset
"let langmenu=zh_CN.utf-8  
language messages zh_cn.utf-8  
"}}}
 
source $XDG_CONFIG_HOME/nvim/plugin.vim
"引入自定义插件配置文件<plugin.vim>

" ====	界面显示设置	====================================================={{{
colorscheme monokai			    " 主题(插件主题)
" colorscheme vstudioDark		" 主题(插件主题)
" colorscheme darkblue			" 主题(系统主题)
set number				        " 设置显示行号
set rnu                         " 设置相对行号 
"set guifont=Ubuntu_Mono_derivative_Powerline:h14		" 字体
set guifont="Ubuntu Mono derivative Powerline:h14		" 字体
"set guifont=Consolas:h16		" 字体
set nowrap                      " 不自动换行
set mouse=nv                    " 使得鼠标在normal模式与version模式下可用
"set lines=30 columns=100       " 启动时窗口大小设置
"autocmd GUIEnter * simalt ~x   " 启动时窗口最大化
"set guioptions+=b              " 添加水平滚动条
set colorcolumn=81            " 将该列高亮以标识编辑页面宽度
" 设置高亮条标识光标位置
au WinLeave * set nocursorline | set nocursorcolumn
au WinEnter * set cursorline   | set   cursorcolumn
"}}}

" ====	编辑设置	========================================================={{{
" 关于文本输入      +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set showmatch                  " 高亮显示匹配的括号
set matchtime   =2             " 高亮括号的闪烁时间
set shiftwidth  =4             " 自动缩进符
set tabstop     =4             " tab制表符
set softtabstop =4             " 4个空格符视为tab符
set expandtab                  " tab符视为空格符
set smarttab                   " 使用退格键时辨别tab
set whichwrap+=<,>,h,l          " 设置光标键跨行
" 关于显示      +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set foldmethod  =marker        " 设置折叠方式-对文中标志折叠
"set foldmethod  = indent        " 设置折叠方式-更多的缩进表示更高级别的折叠
"set lbr                        " 折行显示时不折断单词
filetype indent on              " 载入相关缩进格式实现自动缩进
filetype plugin on              " ?
" 关于文件      ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
set autochdir                   " 自动切换当前目录为当前文件所在的目录
"set nobackup                   " 不生成备份文件~
"set noswapfile                 " 不生成交换文件.swp
"}}}

