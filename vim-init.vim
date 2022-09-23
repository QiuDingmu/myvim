" ====	编码设置	========================================================={{{
" 设置打开文件的编码格式  
set fileencoding=utf-8
set fileencodings=utf-8,gbk,gb2312,gb18030,big5,cp936,ucs-bom,latin,1euc-jp,euc-kr,latin1
" Vim 在与屏幕/键盘交互时使用的编码(取决于实际的终端的设定)        
let &termencoding=&encoding
set encoding=utf-8
"set langmenu=zh_CN.UTF-8            " 设置中文帮助
"language messages zh_cn.utf-8       " 设置中文messages
"set helplang=cn                     " 设置中文帮助
set ambiwidth=double    " 设置为双字宽显示，否则无法完整显示如:☆(utf-8下可用)
"}}}

" ====	编辑设置	========================================================={{{
let mapleader="\\"              " 将前缀键定义为\(默认为'\')
" let mapleader = "\<space>"    "利用转义符“\”将前缀键设置为空格键
set nocompatible                 " 取消与vi的一致性
set scrolloff=9                  " 光标移动时与顶部与底部保持距离(行)
inoremap <C-q> <Esc>:w<CR>       " 退出insert模式并保存
"文件路径  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++{{{
" set hidden

set browsedir=buffer
set autochdir   
set undodir      =$HOME\vimfiles\undodir 
set backupdir    =$HOME\vimfiles\undodir 
"set nobackup                    " 不生成备份文件~
set noswapfile                  " 不生成交换文件.swp
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
nnoremap <silent><leader><cr> :nohlsearch<cr>    " 取消搜索高亮
"}}}
" 代码折叠  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++{{{
set foldenable
set foldmethod   =marker         " 设置折叠方式-对文中标志折叠
"set foldmethod   =indent         " 设置折叠方式-更多的缩进表示更高级别的折叠
" 用<CR>开关折叠
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



" set shortmess+=c    " 可以让补全显示的的信息少一点
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes



" 插件安装  #################################################################{{{
call plug#begin()	" 默认插件本地保存地址
    " ====  界面显示设置    ============================================={{{
	"" 界面布局 ++++++++++
	"Plug 'mhinz/vim-startify'               " 开始界面及打开历史记录
    Plug 'majutsushi/tagbar'
    Plug 'scrooloose/nerdtree'	        	" 文件树
    " Plug 'Xuyuanp/nerdtree-git-plugin'      " nerdtree文件Git状态
    " Plug 'ryanoasis/vim-devicons'           " 标记显示set guifont=DroidSansMono_Nerd_Font:h11
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " 根据文件类型显示不同颜色
    " 任务栏布局+++++++++
    " 方案1--lightline + minibuffer
    Plug 'itchyny/lightline.vim'		    " 任务栏标识显示
    Plug 'fholgado/minibufexpl.vim'        " buffer切换插件
    " 方案2--使用airline相关插件
    " Plug 'vim-airline/vim-airline'          " 任务栏标识显示
    " Plug 'vim-airline/vim-airline-themes'   " airline 主题
    "" 主题+++++++++++++
	"Plug 'morhetz/gruvbox'
    Plug 'sickill/vim-monokai'
    Plug 'termNinja/vim-vstudio-theme'      " 与VS相似的主题vstudioDark.vim
    "}}}
    
    "" ====  编辑设置  ===================================================={{{
    Plug 'luochen1990/rainbow'              " 彩虹括号
    Plug 'jiangmiao/auto-pairs'             " 自动引号括号补全
    Plug 'airblade/vim-gitgutter'           " git状态显示插件,追踪文件修改
    ""}}}
    "
    "" ====  代码逻辑    ======================================================"{{{
    Plug 'scrooloose/nerdcommenter'         " 代码注释
    ""Plug 'scrooloose/syntastic'             " 语法检查
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " 代码补全
"    Plug 'puremourning/vimspector'                  " 调试器
    " Plug 'WolfgangMehner/vim-plugins' " cvim
    " }}}
call plug#end()
" 插件安装END ##############################################################}}}

" 插件设置  #################################################################{{{
" rainbow	===============================================
let g:rainbow_active = 1			"打开彩虹插件

" mhinz/vim-startify	====================================================={{{
" 设置书签	----
let g:startify_bookmarks = [
            \ '$MYVIMRC',
            \ '$VIM\vim-plugin.vim',
            \]
"过滤列表，支持正则表达式	----
let g:startify_skiplist = [
        \ 'runtime/doc/.*\.txt$',
        \ 'bundle/.*/doc/.*\.txt$',
        \ 'plugged/.*/doc/.*\.txt$',
        \ '/.git/',
        \ 'fugitiveblame$',
        \ '^/tmp',
        \ 'plugin/*/doc/.*\.txt$',
        \ ]
let g:startify_files_number = 20	"起始页显示的列表长度
let g:startify_session_autoload = 1	"自动加载session
"自定义Header和Footer	----
let g:startify_custom_header = [
            \ '────────────────────────────────────────────────────',
            \ '──██████──██████─██████████─██████──────────██████──',
            \ '──██░░██──██░░██─██░░░░░░██─██░░██████████████░░██──',
            \ '──██░░██──██░░██─████░░████─██░░░░░░░░░░░░░░░░░░██──',
            \ '──██░░██──██░░██───██░░██───██░░██████░░██████░░██──',
            \ '──██░░██──██░░██───██░░██───██░░██──██░░██──██░░██──',
            \ '──██░░██──██░░██───██░░██───██░░██──██░░██──██░░██──',
            \ '──██░░██──██░░██───██░░██───██░░██──██████──██░░██──',
            \ '──██░░░░██░░░░██───██░░██───██░░██──────────██░░██──',
            \ '──████░░░░░░████─████░░████─██░░██──────────██░░██──',
            \ '────████░░████───██░░░░░░██─██░░██──────────██░░██──',
            \ '──────██████─────██████████─██████──────────██████──',
            \ '────────────────────────────────────────────────────',
            \]
let g:startify_custom_footer = [
            \'      ╔╗╔╗╔╦╗─╔╦═╗╔═╗',
            \'      ║║║║║║║─║╠╗╚╝╔╝',
            \'      ║║║║║║╚═╝║╚╗╔╝',
            \'      ║╚╝╚╝║╔═╗║╔╝╚╗',
            \'      ╚╗╔╗╔╣║─║╠╝╔╗╚╗',
            \'       ╚╝╚╝╚╝─╚╩═╝╚═╝',
            \]
"}}}

" majutsushi/tagbar ========================================================={{{
nnoremap <silent><Leader>tt :TagbarToggle<CR>                " 将开启tagbar的快捷键设置为
let g:tagbar_ctags_bin='E:\Soft\ctags58\ctags.exe'  " 设置ctags所在路径
let g:tagbar_width=26   " 设置tagbar的宽度
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()　" 在某些情况下自动打开tagbar
"}}}

" scrooloose/nerdtree	====================================================={{{
" 修改树的显示图标	----
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeAutoCenter=1
let NERDTreeShowLineNumbers=0		" 显示行号
let NERDTreeShowHidden=1			" 是否显示隐藏文件
let NERDTreeWinPos='left'          " 显示在屏幕左边
let NERDTreeWinSize=26				" 设置宽度
let g:nerdtree_tabs_open_on_console_startup=1	" 在终端启动vim时，共享NERDTree
let NERDTreeIgnore=['\.pyc','\~$','\.swp']	" 忽略显示特定格式的文件
let NERDTreeDirArrows=1             "Show Node model
let NERDTreeMinimalUI=1             "Delete help information at the top
"}}}

" Xuyuanp/nerdtree-git-plugin =============================================={{{
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0
let g:NERDTreeGitStatusShowIgnored = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
nnoremap <silent><Leader>nn :NERDTreeToggle<CR>      " 开关切换<switch>
nnoremap <silent><Leader>nf :NERDTreeFocus<CR>       " 聚焦<foucus>
"}}}

" ryanoasis/vim-devicons   ============================================{{{
" let g:webdevicons_enable_nerdtree = 1 "Can be enabled or disabled
" "whether or not to show the nerdtree brackets around flags
" let g:webdevicons_conceal_nerdtree_brackets = 1
" "adding to vim-airline's tabline
" let g:webdevicons_enable_airline_tabline = 1
" "adding to vim-airline's statusline
" let g:webdevicons_enable_airline_statusline = 1
"}}}

" vim-nerdtree-syntax-highlight settings ====================================={{{
"Highlight full name (not only icons). You need to add this if you don't have vim-devicons and want highlight.
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
"Highlight full name (not only icons). You need to add this if you don't have vim-devicons and want highlight.
let g:NERDTreeHighlightFolders = 1
"highlights the folder name
let g:NERDTreeHighlightFoldersFullName = 1

" "you can add these colors to your .vimrc to help customizing{{{
" let s:brown = "905532"
" let s:aqua =  "3AFFDB"
" let s:blue = "689FB6"
" let s:darkBlue = "44788E"
" let s:purple = "834F79"
" let s:lightPurple = "834F79"
" let s:red = "AE403F"
" let s:beige = "F5C06F"
" let s:yellow = "F09F17"
" let s:orange = "D4843E"
" let s:darkOrange = "F16529"
" let s:pink = "CB6F6F"
" let s:salmon = "EE6E73"
" let s:green = "8FAA54"
" let s:Turquoise = "40E0D0"
" let s:lightGreen = "31B53E"
" let s:white = "FFFFFF"
" let s:rspec_red = "FE405F"
" let s:git_orange = "F54D27"
" let s:gray = "808A87"
" let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
" let g:NERDTreeExtensionHighlightColor['o'] = s:gray " sets the color of o files to blue
" let g:NERDTreeExtensionHighlightColor['h'] = s:blue " sets the color of h files to blue
" let g:NERDTreeExtensionHighlightColor['c'] = s:green " sets the color of c files to blue
" let g:NERDTreeExtensionHighlightColor['cpp'] = s:green " sets the color of cpp files to blue
" let g:NERDTreeExtensionHighlightColor['c++'] = s:green " sets the color of c++ files to blue
"}}}
"}}}

" vim-airline/vim-airline ==================================================={{{
" let laststatus = 2                  " 一直显示状态栏
" let g:airline_powerline_fonts = 1   
" " let g:Powerline_symbols = 'fancy' 
" " " let g:airline_theme="bubblegum" 
" let g:airline_theme="dark" 
" let g:airline#extensions#tabline#enabled = 1           " buffer显示
" let g:airline#extensions#tabline#buffer_nr_show = 1    " buffer显示
" let g:airline#extensions#tabline#buf_label_first = 1    " 当前buffer设为第一个
" " 关闭状态显示空白符号计数,这个对我用处不大"
" "let g:airline#extensions#whitespace#enabled = 0
" "let g:airline#extensions#whitespace#symbol = '!'
 "}}}

" fholgado/minibufexpl.vim =================================================={{{
"let g:miniBufExplMapWindowNavVim   = 1  " 利用<Ctrl-h,j,k,l>切换窗口
"let g:miniBufExplMapWindowNavArrows= 1  " 利用<Ctrl-方向键>切换窗口
"let g:miniBufExplMapCTabSwitchBufs = 1  " 利用Tab切换窗口
"let g:miniBufExplModSelTarget      = 1  " ???
let g:miniBufExplBRSplit            = 0  " 在当前窗口的上方或左侧分割显示MiniBuffer窗口(只为1时:在下方或右侧显示)
let g:miniBufExplorerAutoStart      = 1  " 自动加载
"}}}

" scrooloose/nerdcommenter  =================================================={{{
let NERDSpaceDelims=1            " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1        " 多行注释时样子更好看
let g:NERDDefaultAlign = 'left'  " 将行注释符左对齐
 "}}}
 
 " scrooloose/syntastic  ============================================{{{
" set statusline+=%#warningmsg#                                                                                                                                                                                                                                                 
" set statusline+=%{SyntasticStatuslineFlag()}                                                                                                                                                                                                                                  
" set statusline+=%*                                                                                                                                                                                                                                                            
" "设置error和warning的标志                                                                                                                                                                                                                                                     
" let g:syntastic_enable_signs = 1                                                                                                                                                                                                                                              
" let g:syntastic_error_symbol='X'                                                                                                                                                                                                                                              
" let g:syntastic_warning_symbol='>'                                                                                                                                                                                                                                            
" "总是打开Location List（相当于QuickFix）窗口，如果你发现syntastic因为与其他插件
" "   冲突而经常崩溃，将下面选项置0
" let g:syntastic_always_populate_loc_list = 1
" "自动打开Locaton List，默认值为2，表示发现错误时不自动打开，当修正以后没有再发
" "   现错误时自动关闭，置1表示自动打开自动关闭，0表示关闭自动打开和自动关闭，3表示自动打开，但不自动关闭
" let g:syntastic_auto_loc_list = 1
" "修改Locaton List窗口高度
" let g:syntastic_loc_list_height = 5
" "打开文件时自动进行检查
" let g:syntastic_check_on_open = 1
" "自动跳转到发现的第一个错误或警告处
" let g:syntastic_auto_jump = 1
" "进行实时检查，如果觉得卡顿，将下面的选项置为1
" let g:syntastic_check_on_wq = 0
" "高亮错误
" let g:syntastic_enable_highlighting=1
" "让syntastic支持C++11
" "" 使用clang
" "let g:syntastic_cpp_compiler = 'clang++'
" "let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
" " 使用gcc
" let g:syntastic_cpp_checkers = ['gcc']
" let g:syntastic_cpp_compiler = 'gcc'
" let g:syntastic_cpp_compiler_options = '-std=c++11'

" ""设置pyflakes为默认的python语法检查工具
" "let g:syntastic_python_checkers = ['pyflakes']
" ""修复syntastic使用:lnext和:lprev出现的跳转问题，同时修改键盘映射使用sn和sp进行跳转
" "function! <SID>LocationPrevious()                       
"   "try                                                   
"     "lprev                                               
"   "catch /^Vim\%((\a\+)\)\=:E553/                        
"     "llast                                               
"   "endtry                                                
" "endfunction                                             
" "function! <SID>LocationNext()                           
"   "try                                                   
"     "lnext                                               
"   "catch /^Vim\%((\a\+)\)\=:E553/                        
"     "lfirst                                              
"   "endtry                                                
" "endfunction                                             
" "nnoremap <silent> <Plug>LocationPrevious    :<C-u>exe 'call <SID>LocationPrevious()'<CR>                                        
" "nnoremap <silent> <Plug>LocationNext        :<C-u>exe 'call <SID>LocationNext()'<CR>
" "nmap <silent> sp    <Plug>LocationPrevious              
" "nmap <silent> sn    <Plug>LocationNext
" ""关闭syntastic语法检查, 鼠标复制代码时用到, 防止把错误标志给复制了
" "nnoremap <silent> <Leader>ec :SyntasticToggleMode<CR>
" "function! ToggleErrors()
"     "let old_last_winnr = winnr('$')
"     "lclose
"     "if old_last_winnr == winnr('$')
"         "" Nothing was closed, open syntastic error location panel
"         "Errors
"     "endif
" "endfunction

" " autoformat 操作符两边加空格
" "let g:formatdef_allman = '"astyle --style=allman --pad-oper"'
" "let g:autoformat_autoindent = 0
" "let g:autoformat_retad = 0
" "let g:autoformat_remove_trailing_spaces = 0
" " syntastic end }}} 

" neoclide/coc.nvim =========================================================={{{
" coc-marketplace 使用 :CocList marketplace 查看可用的coc插件
 let g:coc_global_extensions =[
             \ 'coc-marketplace',
             \ 'coc-json',
             \ 'coc-vimlsp',
             \ 'coc-cmake',
             \ 'coc-clangd',
             \ ]
let g:coc_node_path = 'C:\Program Files\nodejs\node.exe'    " nodejs路径

" 使用Tab切换补全选项
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" 使用<cr>选择补全
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.使用<c-space>启动补全
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" 使用[g,]g,来选择上一个下一个代码报错
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.查看定义
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Show documentation in preview window.
" 显示光标处词的帮助文档
nnoremap <silent> <leader>h :call ShowDocumentation()<CR>
 " function! ShowDocumentation()
   " if CocAction('hasProvider', 'hover')
     " call CocActionAsync('doHover')
   " else
     " call feedkeys('K', 'in')
   " endif
 " endfunction
 function! ShowDocumentation()
   if (index(['vim', 'help'], &filetype) >= 0) 
     execute 'h '.expand('<cword>>')
   else
     call CocAction('doHover')
   endif
 endfunction

" 高亮相同单词
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.重命名
nmap <leader>rn <Plug>(coc-rename)

" " Formatting selected code.代码格式化
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
" 
" 
" " Applying codeAction to the selected region.
" " Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)
" 
" " Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)
" 
" " Run the Code Lens action on the current line.
" nmap <leader>cl  <Plug>(coc-codelens-action)
" 
" " Map function and class text objects
" " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)

"}}}

 " 插件设置END  #################################################################}}}


" 设置  ====================================================================
autocmd VimEnter * if argc() == 1 | NERDTree | wincmd p | else | NERDTree Vim | endif
" 当NERDTree为剩下的唯一窗口时自动关闭

" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | Startify | endif

" ====	界面显示设置	====================================================={{{
set number				            " 设置显示行号
set rnu                             " 设置相对行号 
set lbr                             " 折行显示时不折断单词
set nowrap                          " 不自动换行
set nowrap                     " 不自动换行
colorscheme monokai		            " 主题(插件主题)
" colorscheme vstudioDark	    	" 主题(插件主题)
" colorscheme darkblue		    	" 主题(系统主题)
" set guifont=Consolas:h12		    " 字体
" set guifont=Fira_Code_Medium:h12	" 字体(非Win10系统自带)
set guifont=FiraCode_Nerd_Font_Mono:h10	" 字体(非Win10系统自带)
"set lines=30 columns=100        " 启动时窗口大小设置
autocmd GUIEnter * simalt ~x   " 启动时窗口最大化
"set guioptions+=b              " 添加水平滚动条
"}}}
 

" command模式下<C-R><C-W>插入光标处的word
" command模式下<C-R><C-A>插入光标处的WORD
" :verbose map <key>就可以查看按键<key>的映射。例如我们查看按键_+的映射：
" :help {key}^D 来找出是否一个键已经用于某些命令。 ({key} 用于指定你要寻找的键



" ====  自动插入文件头  ======================================================{{{
"新建.c,.h,.sh,.java文件，自动插入文件头 
" autocmd BufNewFile *.cpp,*.h,*.[ch],*.sh,*.java exec ":call SetTitle()" 
" ""定义函数SetTitle，自动插入文件头 
" func SetTitle() 
"     "如果文件类型为.sh文件 
"     if &filetype == 'sh' 
"         call setline(1,"\#########################################################################") 
"         call append(line("."),   "\# File Name: ".expand("%")) 
"         call append(line(".")+1, "\# Author: QiuDingmu") 
"         call append(line(".")+2, "\# mail: hongxianw@whu.edu.cn") 
"         call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
"         call append(line(".")+4, "\#########################################################################") 
"         call append(line(".")+5, "\#!/bin/bash") 
"         call append(line(".")+6, "") 
"     else 
"         call setline(1, "/*************************************************************************") 
"         call append(line("."),   "    > File Name:      ".expand("%")) 
"         call append(line(".")+1, "    > Author:         QiuDingmu") 
"         call append(line(".")+2, "    > Mail:           hongxianw@whu.edu.cn ") 
"         call append(line(".")+3, "    > Created Time:   ".strftime("%c")) 
"         call append(line(".")+4, " ************************************************************************/") 
"         call append(line(".")+5, "")
"     endif
"     if &filetype == 'cpp'
"         call append(line(".")+6, "#include<iostream>")
"         if expand("%") == 'main.cpp'
"             call append(line(".")+7, "")
"             call append(line(".")+8,  "int main(int argc, char** argv){")
"             call append(line(".")+9,  "    std::cout << \"Hellow C++! \" << std::endl;")
"             call append(line(".")+10, "    return 0;")
"             call append(line(".")+11, "}")
"         endif
"     endif
"     "新建文件后，自动定位到文件末尾
"     autocmd BufNewFile * normal G
" endfunc 

" "C，C++ 按F5编译运行
" map <F5> :call CompileRunGcc()<CR>
" func! CompileRunGcc()
"     exec "w"
"     if &filetype == 'c'
"         exec "!g++ % -o %<"
"         exec "! %<"
"     elseif &filetype == 'cpp'
"         exec "!g++ % -o %<"
"         exec "! %<"
"     "elseif &filetype == 'java' 
"     "    exec "!javac %" 
"     "    exec "!java %<"
"     elseif &filetype == 'sh'
"         :!%
"     endif
" endfunc


"}}}
