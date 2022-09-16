" 插件安装  #################################################################{{{
if empty(glob('$XDG_CONFIG_HOME/nvim/autoload/plug.vim'))
"    :exe '!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
"              \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    :exe 'iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |
        \ ni "$(@($env:XDG_CONFIG_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_CONFIG_HOME])/nvim/autoload/plug.vim" -Force'
  au VimEnter * source $MYVIMRC
"  au VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('$XDG_CONFIG_HOME\nvim\plugged')	" 插件本地保存地址
    " ====  界面显示设置    ============================================={{{
	" 界面布局 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	Plug 'mhinz/vim-startify'               " 开始界面及打开历史记录
    Plug 'yegappan/taglist'                 " 文件标记
    Plug 'scrooloose/nerdtree'	        	" 文件树
    "Plug 'ryanoasis/vim-devicons'           " 标记显示
    Plug 'Xuyuanp/nerdtree-git-plugin'      " nerdtree文件Git状态

    " 任务栏布局++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    " 方案1--使用airline相关插件--存在问题{{{
    " Plug 'vim-airline/vim-airline'	  " 任务栏标识显示
    " Plug 'vim-airline/vim-airline-themes'   " airline 主题
    "}}}
    " 方案2--lightline + minibuffer
    Plug 'itchyny/lightline.vim'		    " 任务栏标识显示
    Plug 'fholgado/minibufexpl.vim'         " buffer切换插件
	" 主题++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    Plug 'sickill/vim-monokai'
    Plug 'dunstontc/vim-vscode-theme'       " 使用：colorscheme dark_plus
    Plug 'termNinja/vim-vstudio-theme'      " 与VS相似的主题vstudioDark.vim
    "}}}
    
    " ====  编辑设置  ===================================================={{{
    Plug 'luochen1990/rainbow'              " 彩虹括号
    Plug 'jiangmiao/auto-pairs'             " 自动引号括号补全
    Plug 'airblade/vim-gitgutter'           " git状态显示插件,追踪文件修改
    "}}}
        
    " ====  代码逻辑  ===================================================={{{
    Plug 'tpope/vim-commentary'             " 代码注释
    Plug 'scrooloose/syntastic'             " 语法检查

    " 自动补全  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    " aosuming you're using vim-plug: https://github.com/junegunn/vim-plug
    "Plug 'ncm2/ncm2'
    "Plug 'roxma/nvim-yarp'
    " enable ncm2 for all buffers
    "autocmd BufEnter * call ncm2#enable_for_buffer()
    " IMPORTANT: :help Ncm2PopupOpen for more information
    "set completeopt=noinsert,menuone,noselect
    " NOTE: you need to install completion sources to get completions. Check
    " our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
    "Plug 'ncm2/ncm2-bufword'
    "Plug 'ncm2/ncm2-path'
    "}}}
    
call plug#end()
"}}}

" 插件设置  #############################################################{{{
" vim-startify	=============================================={{{
" 设置书签	----
let g:startify_bookmarks = [
        \ '$MYVIMRC',
        \ '$XDG_CONFIG_HOME/nvim/plugin.vim',
        \]
"过滤列表，支持正则表达式	----
let g:startify_skiplist += [
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
            \ '────────────────────────────────────────────────────────────────────────────────────────────────────────',
            \ '─██████──────────██████─██████████████─██████████████─██████──██████─██████████─██████──────────██████──',
            \ '─██░░██████████──██░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░██──██░░██─██░░░░░░██─██░░██████████████░░██──',
            \ '─██░░░░░░░░░░██──██░░██─██░░██████████─██░░██████░░██─██░░██──██░░██─████░░████─██░░░░░░░░░░░░░░░░░░██──',
            \ '─██░░██████░░██──██░░██─██░░██─────────██░░██──██░░██─██░░██──██░░██───██░░██───██░░██████░░██████░░██──',
            \ '─██░░██──██░░██──██░░██─██░░██████████─██░░██──██░░██─██░░██──██░░██───██░░██───██░░██──██░░██──██░░██──',
            \ '─██░░██──██░░██──██░░██─██░░░░░░░░░░██─██░░██──██░░██─██░░██──██░░██───██░░██───██░░██──██░░██──██░░██──',
            \ '─██░░██──██░░██──██░░██─██░░██████████─██░░██──██░░██─██░░██──██░░██───██░░██───██░░██──██████──██░░██──',
            \ '─██░░██──██░░██████░░██─██░░██─────────██░░██──██░░██─██░░░░██░░░░██───██░░██───██░░██──────────██░░██──',
            \ '─██░░██──██░░░░░░░░░░██─██░░██████████─██░░██████░░██─████░░░░░░████─████░░████─██░░██──────────██░░██──',
            \ '─██░░██──██████████░░██─██░░░░░░░░░░██─██░░░░░░░░░░██───████░░████───██░░░░░░██─██░░██──────────██░░██──',
            \ '─██████──────────██████─██████████████─██████████████─────██████─────██████████─██████──────────██████──',
            \ '────────────────────────────────────────────────────────────────────────────────────────────────────────',
            \]
let g:startify_custom_footer = [
            \'      ╔═╗─╔╗───────────────╔╗╔╗╔╦╗─╔╦═╗╔═╗',
            \'      ║║╚╗║║───────────────║║║║║║║─║╠╗╚╝╔╝',
            \'      ║╔╗╚╝╠══╦══╦╗╔╦╦╗╔╗──║║║║║║╚═╝║╚╗╔╝',
            \'      ║║╚╗║║║═╣╔╗║╚╝╠╣╚╝╠══╣╚╝╚╝║╔═╗║╔╝╚╗',
            \'      ║║─║║║║═╣╚╝╠╗╔╣║║║╠══╩╗╔╗╔╣║─║╠╝╔╗╚╗',
            \'      ╚╝─╚═╩══╩══╝╚╝╚╩╩╩╝───╚╝╚╝╚╝─╚╩═╝╚═╝',
            \]
"}}}
  
" yegappan/taglist  ======================================================{{{
let Tlist_Ctags_Cmd = 'E:\Soft\ctags58\ctags.exe'
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 0         "在左侧窗口中显示taglist窗口
"}}}

" scrooloose/nerdtree	========================================================{{{
" 修改树的显示图标	----
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeAutoCenter=1
let NERDTreeShowLineNumbers=1		" 显示行号
let NERDTreeShowHidden=1			" 是否显示隐藏文件
let NERDTreeWinPos='left'          " 显示在屏幕左边
let NERDTreeWinSize=26				" 设置宽度
let g:nerdtree_tabs_open_on_console_startup=1	" 在终端启动vim时，共享NERDTree
let NERDTreeIgnore=['\.pyc','\~$*','\.swp']	" 忽略显示特定格式的文件
let NERDTreeDirArrows=1             "Show Node model
let NERDTreeMinimalUI=1             "Delete help information at the top
" ????????
let g:NERDTreeGitStatusShowIgnored = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "M",
    \ "Staged"    : "S",
    \ "Untracked" : "U",
    \ "Renamed"   : "R",
    \ "Unmerged"  : "u",
    \ "Deleted"   : "D",
    \ "Dirty"     : "d",
    \ "Clean"     : "C",
    \ 'Ignored'   : "l",
    \ "Unknown"   : "?"
    \ }
"let g:NERDTreeGitStatusIndicatorMapCustom = {
    "\ "Modified"  : "✹",
    "\ "Staged"    : "✚",
    "\ "Untracked" : "✭",
    "\ "Renamed"   : "➜",
    "\ "Unmerged"  : "═",
    "\ "Deleted"   : "✖",
    "\ "Dirty"     : "✗",
    "\ "Clean"     : "✔︎",
    "\ 'Ignored'   : '☒',
    "\ "Unknown"   : "?"
    "\ }
"}}}

"vim-devicons   ================================================================{{{
"Can be enabled or disabled
let g:webdevicons_enable_nerdtree = 1

"whether or not to show the nerdtree brackets around flags
let g:webdevicons_conceal_nerdtree_brackets = 0

"adding to vim-airline's tabline
"let g:webdevicons_enable_airline_tabline = 1

"adding to vim-airline's statusline
"let g:webdevicons_enable_airline_statusline = 1
"}}}

"" air-line 相关(备用) ==============================================={{{
"let g:airline_powerline_fonts = 1   " 这个是安装字体后 必须设置此项" 
""let g:airline_theme='bubblegum'     " 主题
"let g:airline_theme='dark'     " 主题
"let g:laststatus = 2                " 设置永远显示状态栏
""let g:Powerline_symbols = 'fancy' 
"
""打开tabline功能,方便查看Buffer和切换，这个功能比较不错"
""我还省去了minibufexpl插件，因为我习惯在1个Tab下用多个buffer"
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1
"
""设置切换Buffer快捷键"
" nnoremap <C-Tab> :bn<CR>
" nnoremap <C-s-Tab> :bp<CR>
"
" " 关闭状态显示空白符号计数
" "let g:airline#extensions#whitespace#enabled = 0
" "let g:airline#extensions#whitespace#symbol = '!'
"
"" 在Gvim中我设置了英文用Hermit， 中文使用 YaHei Mono "
""if has('win32')
""  set guifont=Hermit:h13
""  set guifontwide=Microsoft_YaHei_Mono:h12
""endif
"" unicode symbols
""let g:airline_left_sep = '▶'  "Unicode：\u25b6
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = '❯'     " Unicode编码： \u276f
""let g:airline_right_sep = '◀' "Unicode：\u25c0
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = '❮' " Unicode： \u276e
""let g:airline_symbols.linenr = '¶'  "Unicode： %b6
""let g:airline_symbols.branch = '⎇' "Unicode： \u2387
"}}}

" fholgado/minibufexpl.vim =========================================={{{
"let g:miniBufExplMapWindowNavVim   = 1  " 利用<Ctrl-h,j,k,l>切换窗口
"let g:miniBufExplMapWindowNavArrows= 1  " 利用<Ctrl-方向键>切换窗口
"let g:miniBufExplMapCTabSwitchBufs = 1  " 利用Tab切换窗口
"let g:miniBufExplModSelTarget      = 1  " ???
"let g:miniBufExplBRSplit            = 0  " 在当前窗口的上方或左侧分割显示MiniBuffer窗口(只为1时:在下方或右侧显示)
"let g:miniBufExplorerAutoStart      = 1  " 自动加载

" MiniBufExpl Colors
"let g:did_minibufexplorer_syntax_inits = 1
"hi MBENormal               guifg=#808080 guibg=fg
"hi MBEChanged              guifg=#CD5907 guibg=fg
"hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
"hi MBEVisibleChanged       guifg=#F1266F guibg=fg
"hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
"hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg
"}}}

" luochen1990/rainbow" ========================================================{{{
let g:rainbow_active = 1
"}}}

" scrooloose/syntastic  ============================================{{{
set statusline+=%#warningmsg#                                                                                                                                                                                                                                                 
set statusline+=%{SyntasticStatuslineFlag()}                                                                                                                                                                                                                                  
set statusline+=%*                                                                                                                                                                                                                                                            
let g:syntastic_always_populate_loc_list = 1                                                                                                                                                                                                                                  
let g:syntastic_auto_loc_list = 1                                                                                                                                                                                                                                             
let g:syntastic_check_on_open = 1                                                                                                                                                                                                                                             
let g:syntastic_check_on_wq = 0                                                                                                                                                                                                                                               
"设置error和warning的标志                                                                                                                                                                                                                                                     
let g:syntastic_enable_signs = 1                                                                                                                                                                                                                                              
"let g:syntastic_error_symbol='X'                                                                                                                                                                                                                                              
"let g:syntastic_warning_symbol='>'                                                                                                                                                                                                                                            
"no-unused-args 忽略不使用的参数                                                                                                                                                                                                                                              
"no-redefined 忽略重定义                                                                                                                                                                                                                                                      
"no-max-line-length 忽略每行最长的检测                                                                                                                                                                                                                                        
"ignore 542 551 忽略if条件的body为空(如...elseif ret == nil then end，then和end中间没有语句)；忽略空语句(如;)，如果用了;则成对出现该语法检测warning                                                                                                                           
"有语法错误的一行左侧栏会有S&gt;标识，光标移动到改行，vim下发会给出提示。修改正确后保存，则该'S&gt;'会消失。                                                                                                                                                                  
"let g:syntastic_lua_checkers = ["/usr/bin/luac5.3.5", "luacheck"]                                                                                                                                                                                                             
"let g:syntastic_lua_luacheck_args = "--codes --no-max-comment-line-length --ignore 542 551"                                                                                                                                                                                   
                                                                                                                                                                                                                                                                              
"c                                                                                                                                                                                                                                                                            
"let g:syntastic_c_compiler =['gcc', 'make']                                                                                                                                                                                                                         
""let g:syntastic_c_compiler_options ='-Wpedantic -g'                                                                                                                                                                                                                          
"let g:syntastic_c_compiler_options ='-std=gnu99'                                                                                                                                                                                                                              
"let g:syntastic_c_include_dirs=['/usr/include/']                                                                                                                                                                                                                              
"let g:syntastic_c_config_file='.syntastic_c_config_file'                                                                                                                                                                                                                      
                                                                                                                                                                                                                                                                              
"cpp                                                                                                                                                                                                                                                                          
"let g:syntastic_cpp_include_dirs = ['/usr/include/']                                                                                                                                                                                                                          
"let g:syntastic_cpp_remove_include_errors = 1                                                                                                                                                                                                                                 
"let g:syntastic_cpp_check_header = 1                                                                                                                                                                                                                                          
"let g:syntastic_cpp_compiler = 'clang++'                                                                                                                                                                                                                                      
"let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'                                                                                                                                                                                                         

" autoformat 操作符两边加空格
"let g:formatdef_allman = '"astyle --style=allman --pad-oper"'
"let g:autoformat_autoindent = 0
"let g:autoformat_retad = 0
"let g:autoformat_remove_trailing_spaces = 0
" syntastic end }}} 

"}}}


" 平台控制 #####################################################################

let mapleader=","   "将前缀键定义为逗号(默认为'\')
" let mapleader = "\<space>"   "利用转义符“\”将前缀键设置为空格键
" fholgado/minibufexpl.vim  ====================================================
noremap <Leader>mm :MBEToggle<cr>           " 开关切换<switch>
noremap <Leader>mf :MBEFocus<cr>            " 聚焦<focus>
noremap <Leader>mk :MBEbp<cr>               " 切换上一个buffer到当前窗口
noremap <Leader>mj :MBEbn<cr>               " 切换下一个buffer到当前窗口

" scrooloose/nerdtree ==========================================================
noremap <Leader>nn :NERDTreeToggle<CR>      " 开关切换<switch>
noremap <Leader>nf :NERDTreeFocus<CR>       " 聚焦<foucus>

" yegappan/taglist =============================================================
noremap <Leader>tt :Tlist<CR>               " 开关切换<switch>
noremap <Leader>tf :TlistOpen<CR>           " 聚焦<foucus>

autocmd vimenter * NERDTree	| wincmd p	" 打开vim时，自动打开NERDTree|同时将光标移动到编辑区
" autocmd VimEnter * if argc() == 1 | NERDTree | wincmd p | else | NERDTree | endif
" 当NERDTree为剩下的唯一窗口时自动关闭
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 当NERDTree为剩下的唯一窗口时启动Startify
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | Startify | endif



