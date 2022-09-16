" 插件安装  #################################################################{{{
call plug#begin('$XDG_CONFIG_HOME\Vim\vimfiles\plugin')	" 插件本地保存地址
    " ====  界面显示设置    ============================================={{{
	" 界面布局 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++{{{
	Plug 'mhinz/vim-startify'               " 开始界面及打开历史记录
    Plug 'yegappan/taglist'                 " 文件标记
    Plug 'scrooloose/nerdtree'	        	" 文件树
    " Plug 'ryanoasis/vim-devicons'           " 标记显示set guifont=DroidSansMono_Nerd_Font:h11
    Plug 'Xuyuanp/nerdtree-git-plugin'      " nerdtree文件Git状态
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " 根据文件类型显示不同颜色
    "}}}
    
    " 任务栏布局++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++{{{
    " 方案1--使用airline相关插件--存在问题
    Plug 'vim-airline/vim-airline'          " 任务栏标识显示
    Plug 'vim-airline/vim-airline-themes'   " airline 主题
    " 方案2--lightline + minibuffer{{{
    "Plug 'itchyny/lightline.vim'		    " 任务栏标识显示
    "Plug 'fholgado/minibufexpl.vim'        " buffer切换插件
    "}}}}}}

    " 主题++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++{{{
	Plug 'morhetz/gruvbox'
    Plug 'sickill/vim-monokai'
    Plug 'dunstontc/vim-vscode-theme'       " 使用：colorscheme dark_plus
    Plug 'termNinja/vim-vstudio-theme'      " 与VS相似的主题vstudioDark.vim
    "}}}}}}
    
    " ====  编辑设置  ===================================================={{{
    Plug 'luochen1990/rainbow'              " 彩虹括号
    Plug 'jiangmiao/auto-pairs'             " 自动引号括号补全
    Plug 'airblade/vim-gitgutter'           " git状态显示插件,追踪文件修改
    "}}}
    
    " ====  代码逻辑    ======================================================
    Plug 'scrooloose/nerdcommenter'         " 代码注释
    Plug 'scrooloose/syntastic'             " 语法检查
    " Plug 'iamcco/markdown-preview.nvim'     " markdown预览
call plug#end()
" 插件安装END ##############################################################}}}

" 插件设置  #################################################################{{{
" rainbow	===============================================
let g:rainbow_active = 1			"打开彩虹插件

" mhinz/vim-startify	====================================================={{{
" 设置书签	----
let g:startify_bookmarks = [
            \ '$XDG_CONFIG_HOME\Vim\vim-init.vim',
            \ '$XDG_CONFIG_HOME\Vim\vim-plugin.vim',
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

" yegappan/taglist  ======================================================{{{
let Tlist_Ctags_Cmd = 'E:\Soft\ctags58\ctags.exe'
let Tlist_Show_One_File = 1        " 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1      " 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1     " 在右侧窗口中显示taglist窗口
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
let NERDTreeIgnore=['\.pyc','\~$*','\.swp']	" 忽略显示特定格式的文件
let NERDTreeDirArrows=1             "Show Node model
let NERDTreeMinimalUI=1             "Delete help information at the top
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
"}}}

" ryanoasis/vim-devicons   ============================================{{{
let g:webdevicons_enable_nerdtree = 1 "Can be enabled or disabled
"whether or not to show the nerdtree brackets around flags
let g:webdevicons_conceal_nerdtree_brackets = 0
"adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1
"adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1
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
let laststatus = 2                  " 一直显示状态栏
let g:airline_powerline_fonts = 1   
let g:Powerline_symbols = 'fancy' 
" let g:airline_theme="bubblegum" 
 let g:airline_theme="dark" 
 let g:airline#extensions#tabline#enabled = 1           " buffer显示
 let g:airline#extensions#tabline#buffer_nr_show = 1    " buffer显示
let g:airline#extensions#tabline#buf_label_first = 1    " 当前buffer设为第一个
" 关闭状态显示空白符号计数,这个对我用处不大"
"let g:airline#extensions#whitespace#enabled = 0
"let g:airline#extensions#whitespace#symbol = '!'
 "}}}

" scrooloose/nerdcommenter  =================================================={{{
let NERDSpaceDelims=1            " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1        " 多行注释时样子更好看
let g:NERDDefaultAlign = 'left'  " 将行注释符左对齐
 "}}}
 
 " scrooloose/syntastic  ============================================{{{
set statusline+=%#warningmsg#                                                                                                                                                                                                                                                 
set statusline+=%{SyntasticStatuslineFlag()}                                                                                                                                                                                                                                  
set statusline+=%*                                                                                                                                                                                                                                                            
"设置error和warning的标志                                                                                                                                                                                                                                                     
let g:syntastic_enable_signs = 1                                                                                                                                                                                                                                              
let g:syntastic_error_symbol='X'                                                                                                                                                                                                                                              
let g:syntastic_warning_symbol='>'                                                                                                                                                                                                                                            
"总是打开Location List（相当于QuickFix）窗口，如果你发现syntastic因为与其他插件
"   冲突而经常崩溃，将下面选项置0
let g:syntastic_always_populate_loc_list = 1
"自动打开Locaton List，默认值为2，表示发现错误时不自动打开，当修正以后没有再发
"   现错误时自动关闭，置1表示自动打开自动关闭，0表示关闭自动打开和自动关闭，3表示自动打开，但不自动关闭
let g:syntastic_auto_loc_list = 1
"修改Locaton List窗口高度
let g:syntastic_loc_list_height = 5
"打开文件时自动进行检查
let g:syntastic_check_on_open = 1
"自动跳转到发现的第一个错误或警告处
let g:syntastic_auto_jump = 1
"进行实时检查，如果觉得卡顿，将下面的选项置为1
let g:syntastic_check_on_wq = 0
"高亮错误
let g:syntastic_enable_highlighting=1
"让syntastic支持C++11
"" 使用clang
"let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
" 使用gcc
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_compiler = 'gcc'
let g:syntastic_cpp_compiler_options = '-std=c++11'

""设置pyflakes为默认的python语法检查工具
"let g:syntastic_python_checkers = ['pyflakes']
""修复syntastic使用:lnext和:lprev出现的跳转问题，同时修改键盘映射使用sn和sp进行跳转
"function! <SID>LocationPrevious()                       
  "try                                                   
    "lprev                                               
  "catch /^Vim\%((\a\+)\)\=:E553/                        
    "llast                                               
  "endtry                                                
"endfunction                                             
"function! <SID>LocationNext()                           
  "try                                                   
    "lnext                                               
  "catch /^Vim\%((\a\+)\)\=:E553/                        
    "lfirst                                              
  "endtry                                                
"endfunction                                             
"nnoremap <silent> <Plug>LocationPrevious    :<C-u>exe 'call <SID>LocationPrevious()'<CR>                                        
"nnoremap <silent> <Plug>LocationNext        :<C-u>exe 'call <SID>LocationNext()'<CR>
"nmap <silent> sp    <Plug>LocationPrevious              
"nmap <silent> sn    <Plug>LocationNext
""关闭syntastic语法检查, 鼠标复制代码时用到, 防止把错误标志给复制了
"nnoremap <silent> <Leader>ec :SyntasticToggleMode<CR>
"function! ToggleErrors()
    "let old_last_winnr = winnr('$')
    "lclose
    "if old_last_winnr == winnr('$')
        "" Nothing was closed, open syntastic error location panel
        "Errors
    "endif
"endfunction

" autoformat 操作符两边加空格
"let g:formatdef_allman = '"astyle --style=allman --pad-oper"'
"let g:autoformat_autoindent = 0
"let g:autoformat_retad = 0
"let g:autoformat_remove_trailing_spaces = 0
" syntastic end }}} 

 " 插件设置END  #################################################################}}}

" 平台控制 #####################################################################
" 映射  =====================================================================
let mapleader=","   "将前缀键定义为逗号(默认为'\')
" let mapleader = "\<space>"   "利用转义符“\”将前缀键设置为空格键
noremap <Leader>nn :NERDTreeToggle<CR>      " 开关切换<switch>
noremap <Leader>nf :NERDTreeFocus<CR>       " 聚焦<foucus>
noremap <Leader>tt :Tlist<CR>               " 开关切换<switch>
noremap <Leader>tf :TlistOpen<CR>           " 聚焦<foucus>

" 设置  ====================================================================
"autocmd vimenter * NERDTree	| wincmd p	" 打开vim时，自动打开NERDTree|同时将光标移动到编辑区
" autocmd VimEnter * if argc() == 1 | NERDTree | wincmd p | else | NERDTree | endif
" 当NERDTree为剩下的唯一窗口时自动关闭
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 当NERDTree为剩下的唯一窗口时启动Startify
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | Startify | endif



