
"plan.vim
"Author: FuDesign2008@163.com
"Version: 1.0.0
"The plugin is a utility for making monthly plan in markdown.
"

if &cp || exists('g:plan_loaded')
	finish
endif

let g:plan_loaded = 1
let s:save_cpo = &cpo
set cpo&vim

if !exists('g:p_edit_files')
	let g:p_edit_files = {}
endif

"compatibility
if exists('g:p_plan_file')
	let g:p_edit_files['plan'] = g:p_plan_file
elseif exists('g:plan_file')
	let g:p_edit_files['plan'] = g:plan_file
endif
if exists('g:p_diary_file')
	let g:p_edit_files['diary'] = g:p_diary_file
elseif exists('g:diary_file')
	let g:p_edit_files['diary'] = g:diary_file
endif



let s:planWeekWork = {}
if exists('g:plan_week_work')
	let s:planWeekWork = g:plan_week_work
endif

let s:planWeekPersonal = {}
if exists('g:plan_week_personal')
	let s:planWeekPersonal = g:plan_week_personal
endif

let s:planMonthWork = {}
if exists('g:plan_month_work')
	let s:planMonthWork = g:plan_month_work
endif

let s:planMonthPersonal = {}
if exists('g:plan_month_personal')
	let s:planMonthPersonal = g:plan_month_personal
endif


let s:planYearWork = {}
if exists('g:plan_year_work')
	let s:planYearWork = g:plan_year_work
endif

let s:planYearPersonal = {}
if exists('g:plan_year_personal')
	let s:planYearPersonal = g:plan_year_personal
endif

"@param {String}  type
"@param {Boolean}  changeDir
function! s:EditFile(type, changeDir)

	let filePath = get(g:p_edit_files, a:type, '')

	if len(filePath) > 1
		let globFilePath = glob(filePath)
		if isdirectory(globFilePath)
			if a:changeDir
				execute 'cd ' . globFilePath
			endif
			execute 'edit ' . globFilePath
			return
		endif

		let dirPath = fnamemodify(filePath, ':p:h')
		let cwdEqualTargetPath = getcwd() == dirPath

		if a:changeDir && !cwdEqualTargetPath
			execute 'cd ' . dirPath
			let cwdEqualTargetPath = 1
		endif

		let targetFileFullPath = fnamemodify(filePath, ':p')

		if fnamemodify(expand('%'), ':p') != targetFileFullPath
			if cwdEqualTargetPath
				execute 'edit '. fnamemodify(filePath, ':p:t')
			else
				execute 'edit '. targetFileFullPath
			endif
		endif

		if a:type ==# 'plan' || a:type ==# 'diary'
			call s:GotoToday()
		endif
	else
		echomsg  filePath . ' does not exist or is unvalid!'
	endif

endfunction


function! s:PEdit(type)
	call s:EditFile(a:type, 0)
endfunction

function! s:PEditCwd(type)
	call s:EditFile(a:type, 1)
endfunction


" open plan file to  edit
function! s:EditPlanCwd()
	call s:PEditCwd('plan')
endfunction

function! s:EditPlan()
	call s:PEdit('plan')
endfunction

function! s:EditDiaryCwd()
	call s:PEditCwd('diary')
endfunction

function! s:EditDiary()
	call s:PEdit('diary')
endfunction



" to get the day of week
" @see http://en.wikipedia.org/wiki/Determination_of_the_day_of_the_week
" `Implementation-dependent methods of Sakamoto, Lachman, Keith and Craver`
"
"@param {Integer} day, 1-31
"@param {Integer} month, 1-12
"@param {Integer} full year
"@return {Integer} 0-6
function! s:DayOfWeek(day, month, year)
	let month_map = [0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4]
	let y = a:month < 3 ? (a:year - 1) : a:year
	let m = get(month_map, a:month - 1)
	let dayOfWeek =  (y + y/4 - y/100 + y/400 + m + a:day) % 7
	return dayOfWeek
endfunction

" padding integer with zero if the integer is less than 10
" @return {String}
function! s:PaddingTen(int)
	let num = a:int + 0
	if num < 10
		return '0' . num
	endif
	return num
endfunction

"@param {Integer} day, 1-31
"@param {Integer} month, 1-12
"@param {Integer} year
"@param {Integer} isDiary
"@return {String}
function! s:GetDayContent(day, month, year, isDiary)
	let weekdays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
	let weekIndex = s:DayOfWeek(a:day, a:month, a:year)
	let weekStr = get(weekdays, weekIndex, '')
	let fullMonth = s:PaddingTen(a:month)
	let fullDay = s:PaddingTen(a:day)
	let monthDay = fullMonth . '-' . fullDay
	let content = ''

	if a:isDiary
		let content = content . '## ' . a:year . '-' . fullMonth . '-' . fullDay . ' ' . weekStr .';;'
		return content
	endif

	" key of week
	if weekStr ==# 'Mon'
		let content = content . '## Key Point of Week;'
		if exists('g:plan_week_keypoint')
			let content = content . join(g:plan_week_keypoint, '')
		else
			let content = content . '1. ;'
		endif
		let content = content . ';;'
	endif

	let content = content . '## ' . a:year . '-' . fullMonth . '-' . fullDay . ' ' . weekStr .';;'

	"work
	let content = content . '### Work;'
	let regularTasks = get(s:planWeekWork, weekIndex, '')
	let content = content . regularTasks
	let regularTasks = get(s:planMonthWork, a:day, '')
	let content = content . regularTasks
	let regularTasks = get(s:planYearWork, monthDay, '')
	let content = content . regularTasks . ';;'

	"personal
	let content = content . '### Personal;'
	let regularTasks = get(s:planWeekPersonal, weekIndex, '')
	let content = content . regularTasks
	let regularTasks = get(s:planMonthPersonal, a:day, '')
	let content = content . regularTasks
	let regularTasks = get(s:planYearPersonal, monthDay, '')
	let content = content . regularTasks . ';;'

	" weekly review
	if weekStr ==# 'Sun'
		let content = content . '## Weekly Review;'
		if exists('g:plan_week_review')
			let content = content . join(g:plan_week_review, '')
		else
			let content = content . '1. ;'
		endif
		let content = content . ';;'
	endif

	return content
endfunction

"when editing plan file, insert all the template of a day
"@param {Integer} day [optional]  default is current day
"@param {Integer} month [optional]  default is current month
"@param {Integer} year [optional] defautl is current year
function! s:PlanInsertDay(...)
	"@see http://www.cplusplus.com/reference/ctime/strftime/
	let day = get(a:000, 0, strftime('%d'))
	let month = get(a:000, 1, strftime('%m'))
	let year = get(a:000, 2, strftime('%Y'))

	let day = str2nr(day, 10)
	let month = str2nr(month, 10)
	let year = str2nr(year, 10)

	let content = s:GetDayContent(day, month, year, 0) . ';'
	let all_content = split(content, ';')
	let failed = append(line('.'), all_content)
endfunction

"when editing plan file, insert all the template of a day
"@param {Integer} day [optional]  default is current day
"@param {Integer} month [optional]  default is current month
"@param {Integer} year [optional] defautl is current year
function! s:DiaryInsertDay(...)
	"@see http://www.cplusplus.com/reference/ctime/strftime/
	let day = get(a:000, 0, strftime('%d'))
	let month = get(a:000, 1, strftime('%m'))
	let year = get(a:000, 2, strftime('%Y'))

	let day = str2nr(day, 10)
	let month = str2nr(month, 10)
	let year = str2nr(year, 10)

	let content = s:GetDayContent(day, month, year, 1) . ';'
	let all_content = split(content, ';')
	let failed = append(line('.'), all_content)
endfunction


function! s:ComputeDayCount(year, month)
	let day31 = [1,3,5,7,8,10,12]
	let day30 = [4,6,9,11]

	let days = 28
	if index(day31, a:month) > -1
		let days = 31
	elseif index(day30, a:month) > -1
		let days = 30
	elseif a:month == 2
		let isLeapYear = (a:year % 4 == 0 && a:year % 100 != 0) || (a:year % 400 == 0)
		if isLeapYear
			let days = 29
		endif
	endif

	return days

endfunction

"when editing plan file, insert all the template of a month
"@param {Integer} month [optional]  default is current month
"@param {Integer} year [optional] defautl is current year
function! s:PlanInsertMonth(...)
	let month = get(a:000, 0, strftime('%m'))
	let year = get(a:000, 1, strftime('%Y'))

	let month = str2nr(month, 10)
	let year = str2nr(year, 10)

	let header = '# Plan of ' . year . '-' . s:PaddingTen(month) .';;'
	let header = header . '## Key Point of Month;'

	if exists('g:plan_month_keypoint')
		let header = header . join(g:plan_month_keypoint, '')
	else
		let header = header . '1. ;'
	endif

	let header = header . ';;'


	let days = s:ComputeDayCount(year, month)
	let counter = 1
	let content = ''
	while counter <= days
		let content = content . s:GetDayContent(counter, month, year, 0) . ';'
		let counter += 1
	endwhile

	let footer = '## Monthly Review;'

	if exists('g:plan_month_review')
		let footer = footer . join(g:plan_month_review, '')
	else
		let footer = footer . '1.;'
	endif

	let footer = footer . ';;'


	let content = header . content . footer
	let all_content = split(content, ';')
	let failed = append(line('.'), all_content)
	if failed
		echo 'Insert plan failed!'
	endif

endfunction

"when editing plan file, insert all the template of a month
"@param {Integer} month [optional]  default is current month
"@param {Integer} year [optional] defautl is current year
function! s:DiaryInsertMonth(...)
	let month = get(a:000, 0, strftime('%m'))
	let year = get(a:000, 1, strftime('%Y'))

	let month = str2nr(month, 10)
	let year = str2nr(year, 10)

	let header = '# Diary of ' . year . '-' . s:PaddingTen(month) .';;'

	let days = s:ComputeDayCount(year, month)
	let counter = 1
	let content = ''
	while counter <= days
		let content = content . s:GetDayContent(counter, month, year, 1) . ';'
		let counter += 1
	endwhile

	let content = header . content
	let all_content = split(content, ';')
	let failed = append(line('.'), all_content)
	if failed
		echo 'Insert diary failed!'
	endif

endfunction

function! s:GotoToday()
	let str = '## ' . strftime('%Y') . '-' . strftime('%m') . '-' .strftime('%d')
	execute '/'. str
	execute 'normal z.'
endfunction


command!   -nargs=1   PEditCwd     call   s:PEditCwd(<f-args>)
command!   -nargs=1   PEdit        call   s:PEdit(<f-args>)

command!   -nargs=0   EditPlanCwd  call   s:EditPlanCwd()
command!   -nargs=0   EditPlan     call   s:EditPlan()

command!   -nargs=0   EditDiaryCwd call   s:EditDiaryCwd()
command!   -nargs=0   EditDiary    call   s:EditDiary()

command!   -nargs=*   PlanMonth    call   s:PlanInsertMonth(<f-args>)
command!   -nargs=*   PlanDay      call   s:PlanInsertDay(<f-args>)

command!   -nargs=*   DiaryMonth   call   s:DiaryInsertMonth(<f-args>)
command!   -nargs=*   DiaryDay     call   s:DiaryInsertDay(<f-args>)

command!   -nargs=0   GotoToday    call   s:GotoToday()


if !exists('g:plan_custom_keymap')
	nnoremap <leader>gt :GotoToday<CR>
endif


let &cpo = s:save_cpo

