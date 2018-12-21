" set POSIX shell
if &shell =~# 'fish$'
    set shell=bash
endif

set backspace=indent,eol,start

" <leader>
let mapleader=";"

" Vundle setting
"set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

"---------------- start of Vundle plugins ------------------
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
Plugin 'dag/vim-fish'
Plugin 'airblade/vim-gitgutter'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'itchyny/lightline.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
"Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-surround'
Plugin 'w0rp/ale'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rhysd/vim-llvm'
Plugin 'jiangmiao/auto-pairs'
Plugin 'luochen1990/rainbow'
Plugin 'PangPangPangPangPang/vim-terminal'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
"---------------- end of Vundle plugins -----------------------

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to 
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" auto pair
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'

" terminal 
let g:vs_terminal_custom_pos = 'bottom'
let g:vs_terminal_custom_command = '/usr/bin/fish'
nnoremap <F9> :VSTerminalToggle<CR>

" YCM
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
"nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
"let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']
" 自动补全配置  
set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)  
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口  
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

"上下左右键的行为 会显示其他信息  
"inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"  
"inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"  
"inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"  
"inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"  
  
"youcompleteme  默认tab  s-tab 和自动补全冲突  
"let g:ycm_key_list_select_completion=['<c-n>']  
"let g:ycm_key_list_select_completion = ['<Down>']  
"let g:ycm_key_list_previous_completion=['<c-p>']  
"let g:ycm_key_list_previous_completion = ['<Up>']  
let g:ycm_confirm_extra_conf = 0 "关闭加载.ycm_extra_conf.py提示  
  
let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎  
let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项  
let g:ycm_cache_omnifunc=0  " 禁止缓存匹配项,每次都重新生成匹配项  
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全 
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
"nnoremap <leader>lo :lopen<CR> "open locationlist  
"nnoremap <leader>lc :lclose<CR>    "close locationlist  
inoremap <leader><leader> <C-x><C-o>  
"在注释输入中也能补全  
let g:ycm_complete_in_comments = 1  
"在字符串输入中也能补全  
let g:ycm_complete_in_strings = 1  
"注释和字符串中的文字也会被收入补全  
let g:ycm_collect_identifiers_from_comments_and_strings = 0  
let g:clang_user_options='|| exit 0'  
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处

" lightlines
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ }

" rainbow
let g:rainbow_active = 1

" nerd tree
map <F3> :NERDTreeToggle<CR>

"color scheme
colorscheme desert

" ale
let g:ale_sign_column_always = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
"let g:ale_set_quickfix = 1
"let g:ale_open_list = 1"打开quitfix对话框

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

let g:ale_sign_error = ">>"
let g:ale_sign_warning = "--"
map <F7> :ALEToggle<CR>

" update .vimrc dynamically
autocmd BufWritePost $MYVIMRC source $MYVIMRC
set nu          " line number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
syntax enable

" search setting
set incsearch
set ignorecase
set wildmenu

" short cuts
" line begin/end
nmap LB 0
nmap LE $
" copy to system clipboard
vnoremap <Leader>y "+y
" paste from clipboard
nmap <Leader>p "+p
" close split window
"nmap <Leader>q :q<CR>
" save current window
"nmap <Leader>w :w<CR>
" save all and quit
"nmap <Leader>WQ :wa<CR>:q<CR>
" quit without saving
"nmap <Leader>Q :qa!<CR>
" go to next window
nnoremap nw <C-W><C-W>
" go to right window
nnoremap <Leader>lw <C-W>l
" go to left window
nnoremap <Leader>hw <C-W>h
" go to window above
nnoremap <Leader>kw <C-W>k
" go to window below
nnoremap <Leader>jw <C-W>j
" 定义快捷键在结对符之间跳转
nmap <Leader>M %

" save when forgetting to sudo vim
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

"" cscope
"if filereadable("cscope.out")
"    cs add cscope.out
"endif
"
"if has("cscope")
"    set cscopetag   " 使支持用 Ctrl+]  和 Ctrl+t 快捷键在代码间跳来跳去
"    " check cscope for definition of a symbol before checking ctags:
"    " set to 1 if you want the reverse search order.
"    set csto=1
"
"    " add any cscope database in current directory
"    if filereadable("cscope.out")
"        cs add cscope.out
"    " else add the database pointed to by environment variable
"    elseif $CSCOPE_DB !=""
"        cs add $CSCOPE_DB
"    endif
"
"    " show msg when any other cscope db added
"    set cscopeverbose
"
"    nmap <C-/>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-/>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-/>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-/>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-/>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-/>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"    nmap <C-/>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"    nmap <C-/>d :cs find d <C-R>=expand("<cword>")<CR><CR>
"endif
"
"" 按F8按钮，在窗口的左侧出现taglist的窗口,像vc的左侧的workpace
"nnoremap <silent> <F8> :TlistToggle<CR><CR>
"" :Tlist              调用TagList
"let Tlist_Show_One_File=0                    " 只显示当前文件的tags
"let Tlist_Exit_OnlyWindow=1                  " 如果Taglist窗口是最后一个窗口则退出Vim
"let Tlist_Use_Right_Window=1                 " 在右侧窗口中显示
"let Tlist_File_Fold_Auto_Close=1             " 自动折叠
"
