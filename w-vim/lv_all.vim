colorscheme torte
set cmdheight=2
set laststatus=2
set tabstop=4
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set autoindent
set softtabstop=4
set shiftwidth=4
set foldmethod=marker

nnoremap <space>q :q<CR>
nnoremap <space>w :up<CR>
let g:w_vim_has_help = 0
function! See_Help()
	if exists('w:w_vim_in_help')
		echo '正在处于帮助窗口!'
		return
	endif
	if g:w_vim_has_help == 1
		echo '已经打开帮助窗口!'
		return
	endif
	split
	let w:w_vim_in_help = 1
	let g:w_vim_has_help = 1
	open w_vim_help.txt
	call append(0 , g:w_vim_title . '	(此窗口可供练习)')
	call append(1 , '==================================================')
	call append(2 , '(按空格+w保存)(按空格+q退出)') " 置尾
	nnoremap <buffer> <silent> <space>q :call Quit_Help()<CR>
	nnoremap <buffer> <silent> <space>w :echo '此帮助页面不可保存!'<CR>
	if g:w_vim_s_lv == 0 "{{{
		call append(2 , '	体验体验Vim')
		call append(3 , '	如果你发现无法输入,按i')
		call append(4 , '	打打字,这个Vim看上去与一般的编辑器没有区别')
		" }}}
	elseif g:w_vim_s_lv == 1 " {{{
		call append(2 , "	在打字的时候左下角是不是会显示'插入'?")
		call append(3 , '	事实上这是Vim的插入模式')
		call append(4 , '	嗯?什么意思?')
		call append(5 , '	插入模式中的键盘按键可以正常插入')
		call append(6 , '	按<Esc>(左上角)退出插入模式,进入普通模式')
		call append(7 , '	普通模式中,按kjhl分别上下左右移动')
		call append(8 , '	返回插入模式进行编辑,按a或i(两者的区别试试便知道)')
		call append(9 , '	这tm有什么用?熟悉熟悉就知道了')
		call append(10 , '	并且不管你是否接受,上下左右的方向键已经被禁用了')
		" }}}
	elseif g:w_vim_s_lv == 2 "{{{
		call append(2 , '	但愿你已经熟悉hjkl,不过不习惯很正常,这项设定看起来的确很不友好')
		call append(3 , '	现在方向键会被恢复,但不能依赖方向键,你需要慢慢适应hjkl和普通模式')
		call append(4 , '	毕竟普通模式的作用不仅是为了移动')
		call append(5 , '	字符操作很容易,更重要的是懂得在什么时候去用,不急,多用用')
		call append(6 , '==================================================')
		call append(7 , '	删除:按x,删除光标下的字符')
		call append(8 , '		:按X,删除光标前的字符')
		call append(9 , '	替换:按r再按(any),将光标下的字符替换为(any)')
		call append(10 , '	删除+插入:按s,删除当前字符并进入插入模式')
		"}}}
	elseif g:w_vim_s_lv == 3 " {{{
		call append(2 , '	希望你已经对普通模式有了初步了解')
		call append(3 , '	来了解下单词移动吧')
		call append(4 , '==================================================')
		call append(5 , '	w:移动到下一个单词的开头')
		call append(6 , '	e:移动到当前单词的末尾')
		call append(7 , '	b:移动到当前单词的开头')
		" }}}
	elseif g:w_vim_s_lv == 4 " {{{
		call append(2 , '	也许你认为单词移动作用不大')
		call append(3 , '	但希望你能先学学Vim的原子操作')
		call append(4 , '==================================================')
		call append(5 , '	d:删除,不同于x的是,按第一次d不会有作用,因为它在等待你下一个按键来指定范围')
		call append(6 , '		范围?你应该不会忘了刚学的单词操作(w,e,b)吧,dw即删除至下一个单词的开头')
		call append(7 , '		de,db就不用解释了')
		call append(8 , '	c:删除并插入,同样,与s的区别在于可以指定一个范围,如ce,cw,cb')
		call append(9 , '	y:复制,同样是再按(any)来指定范围(粘贴是p,之后会遇到,此是为了给原子操作举例')
		call append(10 , '==================================================')
		call append(11 , '	另外有个特别的范围:重复即为整行.这意味着:')
		call append(12 , '	dd:删除整行')
		call append(13 , '	cc:重新编辑当前行')
		call append(14 , '	yy:复制整行')
		" }}}
	endif
	" set noma
endfunction

function! Quit_Help()
	" set ma
	noremap <F1> :call See_Help()<CR>
	unlet w:w_vim_in_help
	let g:w_vim_has_help = 0
	q!
endfunction
noremap <silent> <F1> :call See_Help()<CR>

function! Get_up()
	" 移动文件 {{{
	if g:w_vim_s_lv == 0 
		!rm ~/.vim/plugin/lv_0.vim
		!cp ~/.vim/w-vim/lv_1.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_1.vim 
	elseif g:w_vim_s_lv == 1 
		!rm ~/.vim/plugin/lv_1.vim
		!cp ~/.vim/w-vim/lv_2.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_2.vim 
	elseif g:w_vim_s_lv == 2 
		!rm ~/.vim/plugin/lv_2.vim
		!cp ~/.vim/w-vim/lv_3.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_3.vim 
	elseif g:w_vim_s_lv == 3 
		!rm ~/.vim/plugin/lv_3.vim
		!cp ~/.vim/w-vim/lv_4.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_4.vim 
	elseif g:w_vim_s_lv == 4 
		!rm ~/.vim/plugin/lv_4.vim
		!cp ~/.vim/w-vim/lv_5.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_5.vim 
	elseif g:w_vim_s_lv == 5 
		!rm ~/.vim/plugin/lv_5.vim
		!cp ~/.vim/w-vim/lv_6.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_6.vim 
	elseif g:w_vim_s_lv == 6 
		!rm ~/.vim/plugin/lv_6.vim
		!cp ~/.vim/w-vim/lv_7.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_7.vim 
	elseif g:w_vim_s_lv == 7 
		!rm ~/.vim/plugin/lv_7.vim
		!cp ~/.vim/w-vim/lv_8.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_8.vim 
	elseif g:w_vim_s_lv == 8 
		!rm ~/.vim/plugin/lv_8.vim
		!cp ~/.vim/w-vim/lv_9.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_9.vim 
	elseif g:w_vim_s_lv == 9 
		!rm ~/.vim/plugin/lv_9.vim
		!cp ~/.vim/w-vim/lv_10.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_10.vim 
	elseif g:w_vim_s_lv == 10 
		!rm ~/.vim/plugin/lv_10.vim
		!cp ~/.vim/w-vim/lv_11.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_11.vim 
	elseif g:w_vim_s_lv == 11 
		!rm ~/.vim/plugin/lv_11.vim
		!cp ~/.vim/w-vim/lv_12.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_12.vim 
	elseif g:w_vim_s_lv == 12 
		!rm ~/.vim/plugin/lv_12.vim
		!cp ~/.vim/w-vim/lv_13.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_13.vim 
	elseif g:w_vim_s_lv == 13 
		!rm ~/.vim/plugin/lv_13.vim
		!cp ~/.vim/w-vim/lv_14.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_14.vim 
	elseif g:w_vim_s_lv == 14 
		!rm ~/.vim/plugin/lv_14.vim
		!cp ~/.vim/w-vim/lv_15.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_15.vim 
	elseif g:w_vim_s_lv == 15 
		!rm ~/.vim/plugin/lv_15.vim
		!cp ~/.vim/w-vim/lv_16.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_16.vim 
	elseif g:w_vim_s_lv == 16 
		!rm ~/.vim/plugin/lv_16.vim
		!cp ~/.vim/w-vim/lv_17.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_17.vim 
	elseif g:w_vim_s_lv == 17 
		!rm ~/.vim/plugin/lv_17.vim
		!cp ~/.vim/w-vim/lv_18.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_18.vim 
	elseif g:w_vim_s_lv == 18 
		!rm ~/.vim/plugin/lv_18.vim
		!cp ~/.vim/w-vim/lv_19.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_19.vim 
	elseif g:w_vim_s_lv == 19 
		!rm ~/.vim/plugin/lv_19.vim
		!cp ~/.vim/w-vim/lv_20.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_20.vim 
	elseif g:w_vim_s_lv == 20 
		!rm ~/.vim/plugin/lv_20.vim
		!cp ~/.vim/w-vim/lv_21.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_21.vim 
	elseif g:w_vim_s_lv == 21 
		!rm ~/.vim/plugin/lv_21.vim
		!cp ~/.vim/w-vim/lv_22.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_22.vim 
	elseif g:w_vim_s_lv == 22 
		!rm ~/.vim/plugin/lv_22.vim
		!cp ~/.vim/w-vim/lv_23.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_23.vim 
	elseif g:w_vim_s_lv == 23 
		!rm ~/.vim/plugin/lv_23.vim
		!cp ~/.vim/w-vim/lv_24.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_24.vim 
	elseif g:w_vim_s_lv == 24 
		!rm ~/.vim/plugin/lv_24.vim
		!cp ~/.vim/w-vim/lv_25.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_25.vim 
	elseif g:w_vim_s_lv == 25 
		!rm ~/.vim/plugin/lv_25.vim
		!cp ~/.vim/w-vim/lv_26.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_26.vim 
	elseif g:w_vim_s_lv == 26 
		!rm ~/.vim/plugin/lv_26.vim
		!cp ~/.vim/w-vim/lv_27.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_27.vim 
	elseif g:w_vim_s_lv == 27 
		!rm ~/.vim/plugin/lv_27.vim
		!cp ~/.vim/w-vim/lv_28.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_28.vim 
	elseif g:w_vim_s_lv == 28 
		!rm ~/.vim/plugin/lv_28.vim
		!cp ~/.vim/w-vim/lv_29.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_29.vim 
	elseif g:w_vim_s_lv == 29 
		!rm ~/.vim/plugin/lv_29.vim
		!cp ~/.vim/w-vim/lv_30.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_30.vim 
	elseif g:w_vim_s_lv == 30 
		!rm ~/.vim/plugin/lv_30.vim
		!cp ~/.vim/w-vim/lv_31.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_31.vim 
	elseif g:w_vim_s_lv == 31 
		!rm ~/.vim/plugin/lv_31.vim
		!cp ~/.vim/w-vim/lv_32.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_32.vim 
	elseif g:w_vim_s_lv == 32 
		!rm ~/.vim/plugin/lv_32.vim
		!cp ~/.vim/w-vim/lv_33.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_33.vim 
	elseif g:w_vim_s_lv == 33 
		!rm ~/.vim/plugin/lv_33.vim
		!cp ~/.vim/w-vim/lv_34.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_34.vim 
	elseif g:w_vim_s_lv == 34 
		!rm ~/.vim/plugin/lv_34.vim
		!cp ~/.vim/w-vim/lv_35.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_35.vim 
	elseif g:w_vim_s_lv == 35 
		!rm ~/.vim/plugin/lv_35.vim
		!cp ~/.vim/w-vim/lv_36.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_36.vim 
	elseif g:w_vim_s_lv == 36 
		!rm ~/.vim/plugin/lv_36.vim
		!cp ~/.vim/w-vim/lv_37.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_37.vim 
	elseif g:w_vim_s_lv == 37 
		!rm ~/.vim/plugin/lv_37.vim
		!cp ~/.vim/w-vim/lv_38.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_38.vim 
	elseif g:w_vim_s_lv == 38 
		!rm ~/.vim/plugin/lv_38.vim
		!cp ~/.vim/w-vim/lv_39.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_39.vim 
	elseif g:w_vim_s_lv == 39 
		!rm ~/.vim/plugin/lv_39.vim
		!cp ~/.vim/w-vim/lv_40.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_40.vim 
	elseif g:w_vim_s_lv == 40 
		!rm ~/.vim/plugin/lv_40.vim
		!cp ~/.vim/w-vim/lv_41.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_41.vim 
	elseif g:w_vim_s_lv == 41 
		!rm ~/.vim/plugin/lv_41.vim
		!cp ~/.vim/w-vim/lv_42.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_42.vim 
	elseif g:w_vim_s_lv == 42 
		!rm ~/.vim/plugin/lv_42.vim
		!cp ~/.vim/w-vim/lv_43.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_43.vim 
	elseif g:w_vim_s_lv == 43 
		!rm ~/.vim/plugin/lv_43.vim
		!cp ~/.vim/w-vim/lv_44.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_44.vim 
	elseif g:w_vim_s_lv == 44 
		!rm ~/.vim/plugin/lv_44.vim
		!cp ~/.vim/w-vim/lv_45.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_45.vim 
	elseif g:w_vim_s_lv == 45 
		!rm ~/.vim/plugin/lv_45.vim
		!cp ~/.vim/w-vim/lv_46.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_46.vim 
	elseif g:w_vim_s_lv == 46 
		!rm ~/.vim/plugin/lv_46.vim
		!cp ~/.vim/w-vim/lv_47.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_47.vim 
	elseif g:w_vim_s_lv == 47 
		!rm ~/.vim/plugin/lv_47.vim
		!cp ~/.vim/w-vim/lv_48.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_48.vim 
	elseif g:w_vim_s_lv == 48 
		!rm ~/.vim/plugin/lv_48.vim
		!cp ~/.vim/w-vim/lv_49.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_49.vim 
	elseif g:w_vim_s_lv == 49 
		!rm ~/.vim/plugin/lv_49.vim
		!cp ~/.vim/w-vim/lv_50.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_50.vim 
	elseif g:w_vim_s_lv == 50 
		!rm ~/.vim/plugin/lv_50.vim
		!cp ~/.vim/w-vim/lv_51.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_51.vim 
	elseif g:w_vim_s_lv == 51 
		!rm ~/.vim/plugin/lv_51.vim
		!cp ~/.vim/w-vim/lv_52.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_52.vim 
	elseif g:w_vim_s_lv == 52 
		!rm ~/.vim/plugin/lv_52.vim
		!cp ~/.vim/w-vim/lv_53.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_53.vim 
	elseif g:w_vim_s_lv == 53 
		!rm ~/.vim/plugin/lv_53.vim
		!cp ~/.vim/w-vim/lv_54.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_54.vim 
	elseif g:w_vim_s_lv == 54 
		!rm ~/.vim/plugin/lv_54.vim
		!cp ~/.vim/w-vim/lv_55.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_55.vim 
	elseif g:w_vim_s_lv == 55 
		!rm ~/.vim/plugin/lv_55.vim
		!cp ~/.vim/w-vim/lv_56.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_56.vim 
	elseif g:w_vim_s_lv == 56 
		!rm ~/.vim/plugin/lv_56.vim
		!cp ~/.vim/w-vim/lv_57.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_57.vim 
	elseif g:w_vim_s_lv == 57 
		!rm ~/.vim/plugin/lv_57.vim
		!cp ~/.vim/w-vim/lv_58.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_58.vim 
	elseif g:w_vim_s_lv == 58 
		!rm ~/.vim/plugin/lv_58.vim
		!cp ~/.vim/w-vim/lv_59.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_59.vim 
	elseif g:w_vim_s_lv == 59 
		!rm ~/.vim/plugin/lv_59.vim
		!cp ~/.vim/w-vim/lv_60.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_60.vim 
	elseif g:w_vim_s_lv == 60 
		!rm ~/.vim/plugin/lv_60.vim
		!cp ~/.vim/w-vim/lv_61.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_61.vim 
	elseif g:w_vim_s_lv == 61 
		!rm ~/.vim/plugin/lv_61.vim
		!cp ~/.vim/w-vim/lv_62.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_62.vim 
	elseif g:w_vim_s_lv == 62 
		!rm ~/.vim/plugin/lv_62.vim
		!cp ~/.vim/w-vim/lv_63.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_63.vim 
	elseif g:w_vim_s_lv == 63 
		!rm ~/.vim/plugin/lv_63.vim
		!cp ~/.vim/w-vim/lv_64.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_64.vim 
	elseif g:w_vim_s_lv == 64 
		!rm ~/.vim/plugin/lv_64.vim
		!cp ~/.vim/w-vim/lv_65.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_65.vim 
	elseif g:w_vim_s_lv == 65 
		!rm ~/.vim/plugin/lv_65.vim
		!cp ~/.vim/w-vim/lv_66.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_66.vim 
	elseif g:w_vim_s_lv == 66 
		!rm ~/.vim/plugin/lv_66.vim
		!cp ~/.vim/w-vim/lv_67.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_67.vim 
	elseif g:w_vim_s_lv == 67 
		!rm ~/.vim/plugin/lv_67.vim
		!cp ~/.vim/w-vim/lv_68.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_68.vim 
	elseif g:w_vim_s_lv == 68 
		!rm ~/.vim/plugin/lv_68.vim
		!cp ~/.vim/w-vim/lv_69.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_69.vim 
	elseif g:w_vim_s_lv == 69 
		!rm ~/.vim/plugin/lv_69.vim
		!cp ~/.vim/w-vim/lv_70.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_70.vim 
	elseif g:w_vim_s_lv == 70 
		!rm ~/.vim/plugin/lv_70.vim
		!cp ~/.vim/w-vim/lv_71.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_71.vim 
	elseif g:w_vim_s_lv == 71 
		!rm ~/.vim/plugin/lv_71.vim
		!cp ~/.vim/w-vim/lv_72.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_72.vim 
	elseif g:w_vim_s_lv == 72 
		!rm ~/.vim/plugin/lv_72.vim
		!cp ~/.vim/w-vim/lv_73.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_73.vim 
	elseif g:w_vim_s_lv == 73 
		!rm ~/.vim/plugin/lv_73.vim
		!cp ~/.vim/w-vim/lv_74.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_74.vim 
	elseif g:w_vim_s_lv == 74 
		!rm ~/.vim/plugin/lv_74.vim
		!cp ~/.vim/w-vim/lv_75.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_75.vim 
	elseif g:w_vim_s_lv == 75 
		!rm ~/.vim/plugin/lv_75.vim
		!cp ~/.vim/w-vim/lv_76.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_76.vim 
	elseif g:w_vim_s_lv == 76 
		!rm ~/.vim/plugin/lv_76.vim
		!cp ~/.vim/w-vim/lv_77.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_77.vim 
	elseif g:w_vim_s_lv == 77 
		!rm ~/.vim/plugin/lv_77.vim
		!cp ~/.vim/w-vim/lv_78.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_78.vim 
	elseif g:w_vim_s_lv == 78 
		!rm ~/.vim/plugin/lv_78.vim
		!cp ~/.vim/w-vim/lv_79.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_79.vim 
	elseif g:w_vim_s_lv == 79 
		!rm ~/.vim/plugin/lv_79.vim
		!cp ~/.vim/w-vim/lv_80.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_80.vim 
	elseif g:w_vim_s_lv == 80 
		!rm ~/.vim/plugin/lv_80.vim
		!cp ~/.vim/w-vim/lv_81.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_81.vim 
	elseif g:w_vim_s_lv == 81 
		!rm ~/.vim/plugin/lv_81.vim
		!cp ~/.vim/w-vim/lv_82.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_82.vim 
	elseif g:w_vim_s_lv == 82 
		!rm ~/.vim/plugin/lv_82.vim
		!cp ~/.vim/w-vim/lv_83.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_83.vim 
	elseif g:w_vim_s_lv == 83 
		!rm ~/.vim/plugin/lv_83.vim
		!cp ~/.vim/w-vim/lv_84.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_84.vim 
	elseif g:w_vim_s_lv == 84 
		!rm ~/.vim/plugin/lv_84.vim
		!cp ~/.vim/w-vim/lv_85.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_85.vim 
	elseif g:w_vim_s_lv == 85 
		!rm ~/.vim/plugin/lv_85.vim
		!cp ~/.vim/w-vim/lv_86.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_86.vim 
	elseif g:w_vim_s_lv == 86 
		!rm ~/.vim/plugin/lv_86.vim
		!cp ~/.vim/w-vim/lv_87.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_87.vim 
	elseif g:w_vim_s_lv == 87 
		!rm ~/.vim/plugin/lv_87.vim
		!cp ~/.vim/w-vim/lv_88.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_88.vim 
	elseif g:w_vim_s_lv == 88 
		!rm ~/.vim/plugin/lv_88.vim
		!cp ~/.vim/w-vim/lv_89.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_89.vim 
	elseif g:w_vim_s_lv == 89 
		!rm ~/.vim/plugin/lv_89.vim
		!cp ~/.vim/w-vim/lv_90.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_90.vim 
	elseif g:w_vim_s_lv == 90 
		!rm ~/.vim/plugin/lv_90.vim
		!cp ~/.vim/w-vim/lv_91.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_91.vim 
	elseif g:w_vim_s_lv == 91 
		!rm ~/.vim/plugin/lv_91.vim
		!cp ~/.vim/w-vim/lv_92.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_92.vim 
	elseif g:w_vim_s_lv == 92 
		!rm ~/.vim/plugin/lv_92.vim
		!cp ~/.vim/w-vim/lv_93.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_93.vim 
	elseif g:w_vim_s_lv == 93 
		!rm ~/.vim/plugin/lv_93.vim
		!cp ~/.vim/w-vim/lv_94.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_94.vim 
	elseif g:w_vim_s_lv == 94 
		!rm ~/.vim/plugin/lv_94.vim
		!cp ~/.vim/w-vim/lv_95.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_95.vim 
	elseif g:w_vim_s_lv == 95 
		!rm ~/.vim/plugin/lv_95.vim
		!cp ~/.vim/w-vim/lv_96.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_96.vim 
	elseif g:w_vim_s_lv == 96 
		!rm ~/.vim/plugin/lv_96.vim
		!cp ~/.vim/w-vim/lv_97.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_97.vim 
	elseif g:w_vim_s_lv == 97 
		!rm ~/.vim/plugin/lv_97.vim
		!cp ~/.vim/w-vim/lv_98.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_98.vim 
	elseif g:w_vim_s_lv == 98 
		!rm ~/.vim/plugin/lv_98.vim
		!cp ~/.vim/w-vim/lv_99.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_99.vim 
	elseif g:w_vim_s_lv == 99 
		!rm ~/.vim/plugin/lv_99.vim
		!cp ~/.vim/w-vim/lv_100.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_100.vim 
	elseif g:w_vim_s_lv == 100 
		!rm ~/.vim/plugin/lv_100.vim
		!cp ~/.vim/w-vim/lv_101.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_101.vim 
	elseif g:w_vim_s_lv == 101 
		!rm ~/.vim/plugin/lv_101.vim
		!cp ~/.vim/w-vim/lv_102.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_102.vim 
	elseif g:w_vim_s_lv == 102 
		!rm ~/.vim/plugin/lv_102.vim
		!cp ~/.vim/w-vim/lv_103.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_103.vim 
	elseif g:w_vim_s_lv == 103 
		!rm ~/.vim/plugin/lv_103.vim
		!cp ~/.vim/w-vim/lv_104.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_104.vim 
	elseif g:w_vim_s_lv == 104 
		!rm ~/.vim/plugin/lv_104.vim
		!cp ~/.vim/w-vim/lv_105.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_105.vim 
	elseif g:w_vim_s_lv == 105 
		!rm ~/.vim/plugin/lv_105.vim
		!cp ~/.vim/w-vim/lv_106.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_106.vim 
	elseif g:w_vim_s_lv == 106 
		!rm ~/.vim/plugin/lv_106.vim
		!cp ~/.vim/w-vim/lv_107.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_107.vim 
	elseif g:w_vim_s_lv == 107 
		!rm ~/.vim/plugin/lv_107.vim
		!cp ~/.vim/w-vim/lv_108.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_108.vim 
	elseif g:w_vim_s_lv == 108 
		!rm ~/.vim/plugin/lv_108.vim
		!cp ~/.vim/w-vim/lv_109.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_109.vim 
	elseif g:w_vim_s_lv == 109 
		!rm ~/.vim/plugin/lv_109.vim
		!cp ~/.vim/w-vim/lv_110.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_110.vim 
	elseif g:w_vim_s_lv == 110 
		!rm ~/.vim/plugin/lv_110.vim
		!cp ~/.vim/w-vim/lv_111.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_111.vim 
	elseif g:w_vim_s_lv == 111 
		!rm ~/.vim/plugin/lv_111.vim
		!cp ~/.vim/w-vim/lv_112.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_112.vim 
	elseif g:w_vim_s_lv == 112 
		!rm ~/.vim/plugin/lv_112.vim
		!cp ~/.vim/w-vim/lv_113.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_113.vim 
	elseif g:w_vim_s_lv == 113 
		!rm ~/.vim/plugin/lv_113.vim
		!cp ~/.vim/w-vim/lv_114.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_114.vim 
	elseif g:w_vim_s_lv == 114 
		!rm ~/.vim/plugin/lv_114.vim
		!cp ~/.vim/w-vim/lv_115.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_115.vim 
	elseif g:w_vim_s_lv == 115 
		!rm ~/.vim/plugin/lv_115.vim
		!cp ~/.vim/w-vim/lv_116.vim ~/.vim/plugin/
		source ~/.vim/w-vim/lv_116.vim 
	endif
	" }}}
	call See_Help()
	echo '部分设置重启Vim后生效'
endfunction
command! Getup :call Get_up()

function! Exp_up( s )
	echo 'Good : ' . a:s
endfunction

exe "autocmd InsertLeave,CursorHold * : echo 'LV:' . g:w_vim_s_lv . '(press <F1> to get the help)'"


