source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

"Windows插件安装需要设置
let &shellslash=0

"设置文件的代码形式 utf8
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936
 
"vim的菜单乱码解决
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
 
"vim提示信息乱码的解决
language messages zh_CN.utf-8

" 启动的时候不显示那个援助索马里儿童的提示
set shortmess=atI 

" 不让vim发出讨厌的滴滴声
set noerrorbells

filetype on
filetype plugin indent on
"colorscheme evening	"配色方案
colorscheme desert
set helplang=cn		"设置中文帮助
set history=500		"保留历史记录
"set guifont=Monaco:h10	"设置字体为Monaco，大小10
set guifont=Courier_New:h10 ":cANSI   " 设置字体  
set tabstop=4		"设置tab的跳数

" 统一缩进为4
set smartindent  
set tabstop=4  
set shiftwidth=4  
set expandtab  
set softtabstop=4

"行内替换
set gdefault

" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l

" 高亮显示普通txt文件（需要txt.vim脚本）
au BufRead,BufNewFile *  setfiletype txt

set expandtab
set backspace=2 	"设置退格键可用set nu! 		"设置显示行号
set wrap 		"设置自动换行
"set nowrap 		"设置不自动换行
set linebreak 		"整词换行，与自动换行搭配使用
"set list 		"显示制表符
set autochdir 		"自动设置当前目录为正在编辑的目录
set hidden 		"自动隐藏没有保存的缓冲区，切换buffer时不给出保存当前buffer的提示
set scrolloff=5 	"在光标接近底端或顶端时，自动下滚或上滚
set showtabline=2 	"设置显是显示标签栏
set autoread 		"设置当文件在外部被修改，自动更新该文件
set mouse=a 		"设置在任何模式下鼠标都可用
"禁止生成临时文件
set noundofile
set nobackup
set noswapfile

"Toggle Menu and Toolbar 	"隐藏菜单栏和工具栏
"set go=				"不要图形按钮
"set guioptions-=T           " 隐藏工具栏
"set guioptions-=m           " 隐藏菜单栏

"Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T
map <silent> <F11> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>
imap <silent> <F11> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>

" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key

 
"===========================
"查找/替换相关的设置
"===========================
set hlsearch "高亮显示查找结果
set incsearch "增量查找
 
"===========================
"状态栏的设置
"===========================
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%] "显示文件名：总行数，总的字符数
set ruler "在编辑过程中，在右下角显示光标位置的状态行
set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限 
 
"===========================
"代码设置
"===========================
set nu        "显示行号
syntax enable "打开语法高亮
syntax on "打开语法高亮
set showmatch "设置匹配模式，相当于括号匹配
set smartindent "智能对齐
set shiftwidth=4 "换行时，交错使用4个空格
set autoindent "设置自动对齐
set ai! "设置自动缩进
"set cursorcolumn "启用光标列
set cursorline	"启用光标行
set guicursor+=a:blinkon0 "设置光标不闪烁
set fdm=indent "
set nofoldenable "禁止折叠
highlight Comment ctermfg=green guifg=green "注释改成绿色 
set ruler           " 显示标尺  
set showcmd         " 输入的命令显示出来，看的清楚些  
set noswapfile "不生成.swp文件

" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0


" 为C程序提供自动缩进
"自动补全
"":inoremap ( ()<ESC>i
"":inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {<CR>}<ESC>O
":inoremap } <c-r>=ClosePair('}')<CR>
"":inoremap [ []<ESC>i
"":inoremap ] <c-r>=ClosePair(']')<CR>
"":inoremap " ""<ESC>i
"":inoremap ' ''<ESC>i
""function! ClosePair(char)
""	if getline('.')[col('.') - 1] == a:char
""		return "\<Right>"
""	else
""		return a:char
""	endif
""endfunction
filetype plugin indent on 

"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu

" 括号自动补全
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {<CR>}<ESC>kA<CR>
" inoremap < <><ESC>i
"


"插件管理
"set rtp+=$VIM\vimfiles\bundle\Vundle.vim\
"call vundle#begin('~/some/path/here')
set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
call vundle#begin()
"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"my bundle plugin

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'minibufexplorerpp'
"Plugin 'taglist.vim'          "使用插件Tagbar代替
Plugin 'quickfixstatus.vim'   
Plugin 'grep.vim'             "搜索字符串
Plugin 'a.vim'                ".c,.h文件切换
Plugin 'bling/vim-airline'    "美化状态栏
Plugin 'majutsushi/tagbar'
Plugin 'Valloric/YouCompleteMe'
Plugin 'txt.vim'

call vundle#end()
filetype plugin indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree.vim 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"插件快捷键设置
"autocmd vimenter * NERDTree
map <F2> :NERDTreeToggle<CR>
imap <F2> :NERDTreeToggle<CR>
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=25
let g:NERDTreeShowLineNumbers=1
let g:neocomplcache_enable_at_startup = 1
"nerdtree end


"NERD_commenter设定注释
map <F9> <leader>cc
map <F10> <leader>cu

nnoremap <silent> <F3> :Grep<CR>
imap <silent> <F3> :Grep<CR>
set laststatus=2  "状态栏设置

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"窗口操作的快捷键
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap wv     <C-w>v        "垂直分割当前窗口
nmap wc     <C-w>c        "关闭当前窗口
nmap ws     <C-w>s        "水平分割当前窗口

nmap    w=  :resize +3<CR>
nmap    w-  :resize -3<CR>
nmap    w,  :vertical resize -3<CR>
nmap    w.  :vertical resize +3<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags的设定  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map <F7> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
"imap <F7> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
"map <F7> :!ctags -R <CR><CR>
map <F7> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q<CR><CR>
imap <F7> <ESC>:!ctags -R <CR><CR>
set tags=tags;
set autochdir


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"默认打开Taglist 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let Tlist_WinWidth=25
"let Tlist_Show_One_File=1   "不同时显示多个文件的tag，只显示当前文件的
"let Tlist_Exit_OnlyWindow=1
"let Tlist_Sort_Type = "name"    " 按照名称排序  
"let Tlist_Use_Right_Window = 1  " 在右侧显示窗口  
"let Tlist_Compart_Format = 1    " 压缩方式  
"let Tlist_Exist_OnlyWindow = 1  " 如果只有一个buffer，kill窗口也kill掉buffer  
"let Tlist_File_Fold_Auto_Close = 0  " 不要关闭其他文件的tags  
"let Tlist_Enable_Fold_Column = 0    " 不要显示折叠树  
"let Tlist_Show_One_File=1            "不同时显示多个文件的tag，只显示当前文件
"nmap <silent> <F6> :Tlist<CR>  "映射快捷键F6，开启/关闭窗口

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"a.vim,头文件和源文件之间相互切换
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F12> :A<CR>
imap <silent> <F12> :A<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"minibufexplorerpp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:miniBufExplMapWindowNavVim = 1   "按下Ctrl+h/j/k/l，可以切换到当前窗口的上下左右窗口
let g:miniBufExplMapWindowNavArrows = 1  "按下Ctrl+箭头，可以切换到当前窗口的上下左右窗口
let g:miniBufExplMapCTabSwitchBufs = 1   "启用以下两个功能：Ctrl+tab移到下一个窗口
let g:miniBufExplModSelTarget = 1  "不要在不可编辑内容的窗口（如TagList窗口）中打开选中的buffer
"map <F9> :MBEbp<CR>
"map <F10> :MBEbn<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Tagbar.vim,头文件和源文件之间相互切换
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nmap <Leader>tb :TagbarToggle<CR>        "快捷键设置
let g:tagbar_ctags_bin='ctags'            "ctags程序的路径
let g:tagbar_width=30                   "窗口宽度的设置
map <F4> :Tagbar<CR>
imap <F4> :Tagbar<CR>
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()     "如果是c语言的程序的话，tagbar自动开启

"if has(‘gui_running’) && has(“win32″)
"    map <F11> :call libcallnr(“gvimfullscreen.dll”, “ToggleFullScreen”, 0)<CR>
"endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"OmniComplete 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set completeopt=menu,menuone  
"let OmniCpp_MayCompleteDot=1    "  打开  . 操作符
"let OmniCpp_MayCompleteArrow=1  "打开 -> 操作符
"let OmniCpp_MayCompleteScope=1  "打开 :: 操作符
"let OmniCpp_NamespaceSearch=1   "打开命名空间
"let OmniCpp_GlobalScopeSearch=1  
"let OmniCpp_DefaultNamespace=["std"]  
"let OmniCpp_ShowPrototypeInAbbr=1  "打开显示函数原型
"let OmniCpp_SelectFirstItem = 2 "自动弹出时自动跳至第一个
"set tags=tags;

" YouCompleteMe 功能  
let g:ycm_complete_in_comments=1    " 补全功能在注释中同样有效 
let g:ycm_confirm_extra_conf=0   " 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示   
let g:ycm_collect_identifiers_from_tags_files=1  " 开启 YCM 基于标签引擎  
" 引入 C++ 标准库tags，这个没有也没关系，只要.ycm_extra_conf.py文件中指定了正确的标准库路径  
"set tags+=/data/misc/software/misc./vim/stdcpp.tags  


inoremap <leader>; <C-x><C-o>  " YCM 集成 OmniCppComplete 补全引擎，设置其快捷键  
set completeopt-=preview   " 补全内容不以分割子窗口形式出现，只显示补全列表  
let g:ycm_min_num_of_chars_for_completion=1   " 从第一个键入字符就开始罗列匹配项  
let g:ycm_cache_omnifunc=0   " 禁止缓存匹配项，每次都重新生成匹配项             
let g:ycm_seed_identifiers_with_syntax=1   " 语法关键字补全   
let g:ycm_key_invoke_completion = '<M-;>'   " 修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + ;  

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处
