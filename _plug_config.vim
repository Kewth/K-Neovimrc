
" YCM {{{
set runtimepath+=~/.config/nvim/plugged/YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
let g:syntastic_ignore_files=['.*\.py$']
let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
" let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion = ['<C-n>']  " 映射按键, 没有这个会拦截掉tab 导致其他插件的tab不能用.
let g:ycm_key_list_previous_completion = ['<C-p>']
let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
let g:ycm_show_diagnostics_ui = 0                           " 禁用语法检查
" let g:ycm_show_diagnostics_ui = 1    " 仅对C-family有效
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" |           " 回车即选中当前项
nnoremap <C-j> <Cmd>YcmCompleter GoToDefinitionElseDeclaration<CR>|     " 跳转到定义处
let g:ycm_min_num_of_chars_for_completion=1                 " 从第1个键入字符就开始罗列匹配项
" let g:ycm_global_ycm_extra_conf = '/home/kewth/.config/nvim/plugged/YouCompleteMe/.ycm_extra_conf.py' " 配置全局路径
let g:ycm_global_ycm_extra_conf = g:k_nv_home . '/plugged/YouCompleteMe/.ycm_extra_conf.py' " 配置全局路径
let g:ycm_auto_trigger = 1
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
nnoremap <leader>gl <Cmd>YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf <Cmd>YcmCompleter GoToDefinition<CR>
nnoremap <F4> <Cmd>YcmDiags<CR>
" inoremap <c-o> <c-x><c-o>
let g:ycm_semantic_triggers = {
\     'c' : ['->', '  ', '.', ' ', '(', '[', '&'],
\     'cpp,objcpp' : ['->', '.', ' ', '(', '[', '&', '::'],
\     'perl' : ['->', '::', ' '],
\     'php' : ['->', '::', '.'],
\     'cs,java,javascript,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],
\     'ruby' : ['.', '::'],
\     'lua' : ['.', ':'],
\     'Vim' : ['.'],
\ }
"上下左右键的行为 会显示其他信息
" inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
" inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
" inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
" inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
" }}}
" vim-airline {{{
set laststatus=2  "永远显示状态栏
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1 " TAb line
let g:airline_theme='jellybeans'
" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif
" let g:airline_left_alt_sep = '»'
" let g:airline_left_sep = '' " '▶'
" " let g:airline_left_sep = '▷'
" let g:airline_right_alt_sep = '«'
" let g:airline_right_sep = '' " '◀'
" let g:airline_symbols.crypt = '🔒'
" " let g:airline_symbols.linenr = '☰'
" " let g:airline_symbols.linenr = '␊'
" " let g:airline_symbols.linenr = '␤'
" " let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.linenr = '༒ '
" " let g:airline_symbols.linenr = '☯'
" let g:airline_symbols.maxlinenr = '──㏑'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.readonly = '⎇Read'
" " let g:airline_symbols.paste = 'ρ'
" " let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.spell = 'Ꞩ'
" let g:airline_symbols.notexists = 'Ɇ'
" let g:airline_symbols.whitespace = 'Ξ>'
" let g:airline_symbols.space = ' ' " '\ua0'  
let g:airline_exclude_filename = []  
let g:Powerline_symbols='fancy'  
let Powerline_symbols='fancy'  
let g:bufferline_echo=0  
set t_Co=256  
set helplang=cn
" 更换主题  
function! Airline_Change_Theme()
	if g:airline_theme ==? 'light'
		AirlineTheme solarized
	elseif g:airline_theme ==? 'solarized'
		AirlineTheme dark
	elseif g:airline_theme ==? 'dark'
		AirlineTheme solarized_flood
	elseif g:airline_theme ==? 'solarized_flood'
		AirlineTheme angr
	elseif g:airline_theme ==? 'angr'
		AirlineTheme atomic
	elseif g:airline_theme ==? 'atomic'
		AirlineTheme biogoo
	elseif g:airline_theme ==? 'biogoo'
		AirlineTheme badcat
	elseif g:airline_theme ==? 'badcat'
		AirlineTheme badwolf
	elseif g:airline_theme ==? 'badwolf'
		AirlineTheme jellybeans
	elseif g:airline_theme ==? 'jellybeans'
		AirlineTheme light
	endif
endfunction
function Airline_Change_Theme_Timer(timer)
	:call Airline_Change_Theme()
endfunction
nnoremap <silent> <Leader>ai <Cmd>call Airline_Change_Theme()<CR>
" 自动更换主题
" exe 'autocmd CursorHold * : call Airline_Change_Theme()' 
" exe 'autocmd BufWritePost * : call Airline_Change_Theme()' 
" let timer = timer_start(3000 , 'Airline_Change_Theme_Timer' , {'repeat': -1})
" let g:airline#extensions#keymap#enabled = 1
" }}}
" Taglist {{{
" let Tlist_Show_One_File=1    "只显示当前文件的tags
let Tlist_WinWidth=30        "设置taglist宽度
let Tlist_Exit_OnlyWindow=1  "tagList窗口是最后一个窗口，则退出Vim
let Tlist_Use_Left_Window=1 "在Vim窗口左侧显示taglist窗口
nmap <Leader>ta <Cmd>Tlist<CR>
" }}}
"MarkdownPreview {{{
" nnoremap <Leader>md <Cmd>MarkdownPreview<CR>
" nnoremap <Leader>MD <Cmd>MarkdownPreviewStop<CR>
nmap <Leader>md <Plug>MarkdownPreview
nmap <Leader>MD <Plug>MarkdownPreviewStop
" 允许使用 newcommand 之类的全局设置
let g:mkdp_preview_options = {
			\ 'katex': {'globalGroup': v:true}
			\ }
" }}}
" Vim-Markdown {{{
" 代码块高亮
let g:vim_markdown_fenced_languages = [
			\ 'c++=cpp' ,
			\ 'vim=vim' ,
			\ 'bash=sh' ,
			\ 'python=py' ,
			\ 'py=python' ,
			\ 'python3=py3' ,
			\ ]
" 高亮Latex
let g:vim_markdown_math = 1
" 取消自动折叠
let g:vim_markdown_folding_disabled = 1
" 高亮jekyll
let g:vim_markdown_frontmatter = 1
" 按ge跳转链接时自动保存
let g:vim_markdown_autowrite = 1
" }}}
" ale {{{
"自定义error和warning图标
let g:ale_sign_error = '✗!'
let g:ale_sign_warning = '⚠ '
"在vim自带的状态栏中整合ale
" let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
" let g:ale_statusline_format = ['  %d', '⚡ %d', '✔ OK']
" ✓
let g:ale_enabled = 1
"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查,etc.
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python': ['pylint'],
\   'markdown' : ['mdl'],
\   'HTML' : ['tidy'],
\   'Bash' : ['shellcheck'],
\   'Vim' : ['vint'],
\   'tex' : ['chktex'],
\ }
let g:ale_cpp_clang_options = '-std=c++17 -Weverything ' .
\ '-Wno-unused-macros ' .
\ '-Wno-c++98-compat-pedantic ' .
\ '-Wno-comma ' .
\ '-Wno-shadow-field-in-constructor ' .
\ '-Wno-missing-prototypes ' .
\ '-Wno-global-constructors ' .
\ '-Wno-missing-variable-declarations ' .
\ '-Wno-exit-time-destructors ' .
\ '-Wno-unknown-pragmas ' .
\ '-Wno-old-style-cast '
" let g:ale_cpp_clang_options = '-std=c++14 -Werror' .
" \ '-Wall -Weffc++ -pedantic -ansi' .
" \ '-pedantic-errors -Wextra -Waggregate-return -Wcast-align ' .
" \ '-Wcast-qual -Wconversion ' .
" \ '-Wdisabled-optimization ' .
" \ '-Wfloat-equal -Wformat=2 ' .
" \ '-Wformat-nonliteral -Wformat-security  ' .
" \ '-Wformat-y2k ' .
" \ '-Wimplicit  -Wimport  -Winit-self  -Winline ' .
" \ '-Winvalid-pch   ' .
" \ '-Wlong-long' .
" \ '-Wmissing-field-initializers -Wmissing-format-attribute   ' .
" \ '-Wmissing-include-dirs -Wmissing-noreturn ' .
" \ '-Wpacked  -Wpadded -Wpointer-arith ' .
" \ '-Wredundant-decls ' .
" \ '-Wshadow -Wstack-protector ' .
" \ '-Wstrict-aliasing=2 -Wswitch-default ' .
" \ '-Wswitch-enum ' .
" \ '-Wunreachable-code -Wunused ' .
" \ '-Wunused-parameter ' .
" \ '-Wvariadic-macros ' .
" \ '-Wwrite-string' .
" \ '-Wunused-function' .
" \ '-Wctor-dtor-privacy -Wlogical-op -Wmissing-declarations -Wold-style-cast -Woverloaded-virtual -Wsign-conversion -Wsign-promo -Wstrict-null-sentinel -Wstrict-overflow=5 -Wundef ' " Clang 配置
let g:ale_cpp_cc_options = g:ale_cpp_clang_options " 为了某次更新后的兼容
let g:ale_javascript_eslint_use_global = 1
" 使用 pylint3 而不是 pylint
" let g:ale_python_pylint_executable = 'pylint3'
" 打开或关闭
nnoremap <Leader>ale <Cmd>ALEEnable<CR>
nnoremap <Leader>ALE <Cmd>ALEDisable<CR>
" 跳转
nnoremap <Leader>aa <Cmd>ALENext<CR>
nnoremap <Leader>AA <Cmd>ALEPrevious<CR>
" }}}
" LeaderF {{{
" nmap <Leader>fi <Cmd>LeaderfFile<CR>
nnoremap <Leader>fu <Cmd>LeaderfFunction<CR>
nnoremap <Leader>bt <Cmd>LeaderfBufTag<CR>
nnoremap <Leader>bu <Cmd>LeaderfBuffer<CR>
nnoremap <Leader>co <Cmd>LeaderfColorscheme<CR>
nnoremap <Leader>fm <Cmd>LeaderfMru<CR>
nnoremap <Leader>li <Cmd>LeaderfLine<CR>
let g:Lf_CommandMap = {
			\ '<F5>': ['<C-l>'],
			\ '<C-J>': ['<C-N>'],
			\ '<C-K>': ['<C-P>'],
			\ }
let g:Lf_ShortcutF = '<Leader>fi'
let g:Lf_NumberOfHighlight = 200
let g:Lf_MruMaxFiles = 200 " 最大标记数量
let g:Lf_StlColorscheme = 'powerline' " 颜色主题
" let g:Lf_StlSeparator = { 'left': '►', 'right': '◄', 'font': '' } " 标记字符
" let g:Lf_StlSeparator = { 'left': '⮀', 'right': '⮂' } " 标记字符
let g:Lf_StlSeparator = { 'left': '', 'right': ''} " 标记字符
let g:Lf_PreviewCode = 1 " 预览tag
let g:Lf_PreviewResult = {
			\ 'File': 0,
			\ 'Buffer': 0,
			\ 'Mru': 0,
			\ 'Tag': 1,
			\ 'BufTag': 1,
			\ 'Function': 1,
			\ 'Line': 1,
			\ 'Colorscheme': 1
			\}
let g:Lf_ExternalCommand = 'find "%s" -maxdepth 3 -type f 2> /dev/null'           " On MacOSX/Linux
" }}}
" incsearch {{{
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)
" function! s:config_easyfuzzymotion(...) abort
"   return extend(copy({
"   \   'converters': [incsearch#config#fuzzy#converter()],
"   \   'modules': [incsearch#config#easymotion#module()],
"   \   'keymap': {"\<CR>": '<Over>(easymotion)'},
"   \   'is_expr': 0,
"   \   'is_stay': 1
"   \ }), get(a:, 1, {}))
" endfunction
" noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
" function! s:noregexp(pattern) abort
"   return '\V' . escape(a:pattern, '\')
" endfunction
" function! s:config() abort
"   return {'converters': [function('s:noregexp')]}
" endfunction
" noremap <silent><expr> z/ incsearch#go(<SID>config())
" }}}
" DrawIt {{{
let g:jsq_for_drawit = 3
function! D_another()
	let g:jsq_for_drawit += 1
	if g:jsq_for_drawit == 4
		let g:jsq_for_drawit = 1
	endif
	if g:jsq_for_drawit == 1
		DIdbl
	elseif g:jsq_for_drawit == 2
		DInrml
	elseif g:jsq_for_drawit == 3
		DIsngl
	endif
endfunction

function! D_open ()
	DIstart
	let g:jsq_for_drawit = 3
	nmap h <Left>
	nmap j <Down>
	nmap k <Up>
	nmap l <Right>
	nmap i <Home>
	nmap p <PageUp>
	nmap n <End>
	nmap o <PageDown>
	nnoremap <Leader>dr <Cmd>call D_another()<CR>
	nnoremap <Esc> <Cmd>call D_close()<CR>
endfunction

function! D_close ()
	DIstop
	nunmap h
	nunmap j
	nunmap k
	nunmap l
	nunmap i
	nunmap p
	nunmap n
	nunmap o
	nunmap <Esc>
	nnoremap <Leader>dr <Cmd>call D_open()<CR>
endfunction

nnoremap <Leader>dr <Cmd>call D_open()<CR>
" }}}
" Gitgutter {{{
set updatetime=100
let g:gitgutter_sign_added = '+>'
let g:gitgutter_sign_modified = '~~'
let g:gitgutter_sign_removed = 'dd'
let g:gitgutter_sign_removed_first_line = 'd>'
let g:gitgutter_sign_modified_removed = '~d'
let g:gitgutter_max_signs = 1000
nnoremap <Leader>gi <Plug>GitGutterPreviewHunk
" nnoremap <Leader>com <Plug>GitGutterStageHunk
nnoremap <Leader>uu <Plug>GitGutterUndoHunk
" set signcolumn=yes
" let g:gitgutter_sign_column_always = 1
highlight SignColumn guibg=blue      " gVim/MacVim 
" }}}
" Commentary {{{
nmap \ gc
nmap \\ gcc
vmap \ gc
" }}}
" NERDTree {{{
nnoremap <Leader>tf <Cmd>NERDTreeFind<CR>
nnoremap <Leader>te <Cmd>NERDTree<CR>
" 在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
" exe 'autocmd VimEnter * : NERDTree'
" 将 NERDTree 的窗口设置在 vim 窗口的右侧（默认为左侧）
" let NERDTreeWinPos='right'
" 窗口大小
let NERDTreeWinSize=25
" 当打开 NERDTree 窗口时，自动显示 Bookmarks
let NERDTreeShowBookmarks=1
" }}}
" UndoTree {{{
nnoremap <Leader>un <Cmd>UndotreeToggle<CR>
if has('persistent_undo')
    set undodir=~/.undodir/
    set undofile
endif
" 窗口大小
let g:undotree_SplitWidth = 20
" 标示形状
let g:undotree_TreeNodeShape = '*'
" 高亮文本
let g:undotree_HighlightChangedText = 0
" 靠右
let g:undotree_WindowLayout = 4
let g:undotree_CustomDiffpanelCmd = 'botright 5 new'
" }}}
" NCM {{{
" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c
" wrap existing omnifunc
" Note that omnifunc does not run in background and may probably block the
" editor. If you don't want to be blocked by omnifunc too often, you could
" add 180ms delay before the omni wrapper:
"  'on_complete': ['ncm2#on_complete#delay', 180,
"               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
exe "autocmd User Ncm2Plugin call ncm2#register_source({
			\ 'name' : 'css',
			\ 'priority': 9,
			\ 'subscope_enable': 1,
			\ 'scope': ['css','scss'],
			\ 'mark': 'css',
			\ 'word_pattern': '[\w\-]+',
			\ 'complete_pattern': ':\s*',
			\ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
			\ })"
" }}}
" GDB {{{
noremap <Leader>gdb <Cmd>!g++ % -Wall -g<CR>:GdbStart gdb -q a.out<CR><CR><CR>b main<CR>run<CR><C-\><C-n><C-w>k:call Gdb_begin()<CR>
function Gdb_add_break()
	let break_point = line('.')
	normal! <C-w>j1
endfunction
function Gdb_begin()
	nnoremap \n <Cmd>GdbNext<CR>
	nnoremap \s <Cmd>GdbStep<CR>
	nnoremap \c <Cmd>GdbContinue<CR>
	nnoremap \u <Cmd>GdbUntil<CR>
	" nnoremap \b <Cmd>call Gdb_add_break()<CR>
endfunction
" }}}
" clever-f {{{
let g:clever_f_across_no_line = 0 " 允许换行
let g:clever_f_smart_case = 1 " 智能大小写
let g:clever_f_fix_key_direction = 1 " f 永远往右，F 永远往左
let g:clever_f_show_prompt = 1 " 提示符
let g:clever_f_repeat_last_char_inputs = ['.'] " . 重复上次操作
nnoremap ; <Nul>
nnoremap , <Nul>
" }}}
" Clang-format {{{
vnoremap <Leader>cl :ClangFormat<CR>
nnoremap <Leader>cl <Cmd> %:ClangFormat<CR>
let g:clang_format#style_options = {
			\ 'BasedOnStyle' : 'llvm' ,
			\ 'IndentWidth' : '4' ,
			\ 'UseTab' : 'Always' ,
			\ 'IndentCaseLabels' : 'true' ,
			\ 'Standard' : 'C++11'
			\ }
" }}}
" hardtime {{{
" 自动开启
" exe 'autocmd BufEnter * : HardTimeOn'
let g:hardtime_showmsg = 1
let g:hardtime_allow_different_key = 1 " 允许用不同键
let g:hardtime_maxcount = 3 " 按 3 次后触发 hardtime
let g:list_of_normal_keys = ['h', 'l', '-', '+', '<UP>', '<DOWN>', '<LEFT>', '<RIGHT>']
let g:list_of_visual_keys = ['h', 'l', '-', '+', '<UP>', '<DOWN>', '<LEFT>', '<RIGHT>']
" }}}
" Rainbow {{{
let g:rainbow_active = 0
nnoremap <Leader>ra <Cmd>RainbowToggle<CR>
" }}}
" deoplete {{{
" let g:deoplete#enable_at_startup = 1
" " path to directory where library can be found
" let g:clang_library_path='/usr/lib/llvm/lib'
" " or path directly to the library file
" let g:clang_library_path='/usr/lib64/libclang.so.9'
" }}}
" python-syntax {{{
let g:python_highlight_all = 1 " 开启
" }}}
" vimtex {{{
let g:vimtex_view_method = 'zathura'
" 关闭默认映射
" let g:vimtex_imaps_enabled = 0
let g:vimtex_mappings_enabled = 0
" 保留部分映射
imap ]] <plug>(vimtex-delim-close)
nmap <Leader>ll <plug>(vimtex-compile)
" }}}
" open-browser {{{
nnoremap <Leader>go <Cmd>call openbrowser#_keymap_open('n')<CR>
" https://google.com
" }}}
