scripte utf-8
call plug#begin('~/.config/nvim/plugged')
" 大YCM
Plug 'Valloric/YouCompleteMe' , { 'do': './install.py --clang-completer' }
" 快速缩进
" Plug 'junegunn/vim-easy-align'
" 文件检索
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
" markdown的LeTax支持
Plug 'iamcco/mathjax-support-for-mkdp'
" markdown高亮缩进和补全
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" 加强搜索功能
Plug 'haya14busa/incsearch.vim'
" incsearch扩展
Plug 'haya14busa/incsearch-easymotion.vim'
" Plug 'mhinz/vim-signify'
" Git管理
Plug 'airblade/vim-gitgutter'
" Vim中文help
Plug 'yianwillis/vimcdoc'
" 绘画模式
Plug 'vim-scripts/DrawIt'
" 加强状态栏
Plug 'vim-airline/vim-airline'
" 状态栏主题
Plug 'vim-airline/vim-airline-themes'
" 语法检查
Plug 'w0rp/ale'
" 文件检索
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" 扩展Leaderf的浏览
" Plug 'Yggdroot/LeaderF-marks'
" 打开内嵌终端
" Plug 'PangPangPangPangPang/vim-terminal'
" markdown浏览
Plug 'iamcco/markdown-preview.vim'
" 配色
Plug 'altercation/vim-colors-solarized'
" 目录结构
Plug 'scrooloose/nerdtree'
" Undo树
Plug 'mbbill/undotree'
" 高亮行尾空白
Plug 'bronson/vim-trailing-whitespace'
" 打开网页
Plug '~/.config/nvim/w-vim/open_url'
" FlyGrep
" Plug 'wsdjeg/FlyGrep.vim'
" GDB
" Plug 'sakhnik/nvim-gdb'
call plug#end()
