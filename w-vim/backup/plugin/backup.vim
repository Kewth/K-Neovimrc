"-------------------------------------------------------------------------------
"  Description: Use VMS style versioned backup with centralized backup directory
"    Copyright: Copyright (C) 2006 Martin Krischik
"	        Copyright (C) 2008 Maciej Delmanowski
"   Maintainer: Maciej Delmanowski <harnir@harnir.net>
"      Version: 2.2.1
"     Homepage: http://repo.harnir.net/vim/plugin/cbackup.vim
"      History: 15.05.2006 MK Fix "Press ENTER ..." on vms systems
"               15.05.2006 MK Fix set backupdir on non vms systems
"		24.05.2006 MK Unified Headers
"               15.10.2006 MK Bram's suggestion for runtime integration
"               15.10.2006 MK Fix pathname with space problem
"               09.12.2008 MD Modified non VMS code to use centralized backup directory
"			      in $HOME/.backups with recursive subdirectories
"	 Usage: copy to plugin directory.
"-------------------------------------------------------------------------------
" Customize:
"  g:backup_directory	root of the backup directory structure
"			used for non VMS only. Since non VMS operating-
"			systems don't know about version we would get
"			ugly directory listings. So all backups are
"			moved into centralized directory with subdirectories.
"			Default: $HOME/.backups
"
"  g:backup_purge	count of backups to hold - purge older once.
"			On VMS PURGE is used to delete older version
"			0 switched the feature off.
"			Default: 10
"-------------------------------------------------------------------------------

if exists("s:loaded_backup") || version < 700
    finish
else
    let s:loaded_backup = 221

    if ! exists("g:backup_purge")
	let g:backup_purge=10
    endif

    if has ("vms")
	" Section: vms {{{1
	"
	" backup not needed for vms as vms has a full featured filesystem
	" which includes versioning
	set nowritebackup
	set nobackup
	set backupext=-Backup

	" Subsection: s:Do_Purge {{{2
	"
	function s:Do_Purge (Doc_Path)
	    if g:backup_purge > 0
		execute ":silent :!PURGE /NoLog /Keep=" . g:backup_purge . " " . a:Doc_Path
	    endif
	endfunction Do_Purge

	autocmd BufWritePre * :call s:Do_Purge (expand ('<afile>:p'))
      " }}}1
    else
	" Section: not vms {{{1
	"
	 if ! exists("g:backup_directory")
	    let g:backup_directory=$HOME . '/.backups'
	 endif

	set writebackup
	set backup
	set backupext=;1

	" Subsection: s:Make_Backup_Dir {{{2
	"
         function s:Make_Backup_Dir (Path)
	    if strlen (finddir (a:Path)) == 0
	       call mkdir (a:Path, "p", 0770)
		  if has ("os2")       ||
		   \ has ("win16")     ||
		   \ has ("win32")     ||
		   \ has ("win64")     ||
		   \ has ("dos16")     ||
		   \ has ("dos32")
		     execute '!attrib +h "' . a:Path . '"'
		  endif
	    endif
         endfunction Make_Backup_Dir

	" Subsection: s:Get_Version {{{2
	"
         function s:Get_Version (Filename)
	    return eval (
		\ strpart (
		    \ a:Filename,
		    \ strridx (a:Filename, ";") + 1))
         endfunction s:Get_Version

	" Subsection: s:Version_Compare {{{2
	"
         function s:Version_Compare (Left, Right)
	    let l:Left_Ver = s:Get_Version (a:Left)
	    let l:Right_Ver = s:Get_Version (a:Right)
	    return l:Left_Ver == l:Right_Ver
		    \ ? 0
		    \ : l:Left_Ver > l:Right_Ver
			\ ? 1
			\ : -1
         endfunction s:Version_Compare

	" Subsection: s:Do_Purge {{{2
	"
         function s:Set_Backup (Backup_Root, Doc_Path, Doc_Name)
	    let l:Backup_Path = a:Backup_Root . '/' . a:Doc_Path
	    call s:Make_Backup_Dir (l:Backup_Path)
	    execute "set backupdir^=" . l:Backup_Path
	    let l:Existing_Backups = sort (
		   \ split (
		   \ glob (l:Backup_Path . '/' . a:Doc_Name . ';*'), "\n"),
	       \ "s:Version_Compare")
	    if empty (l:Existing_Backups)
	       set backupext=;1
	    else
	       let &backupext=';' . string (s:Get_Version (l:Existing_Backups[-1]) + 1)
	       if g:backup_purge > 0 && len (l:Existing_Backups) > g:backup_purge
		   for l:Item in l:Existing_Backups[0 :  len (l:Existing_Backups) - g:backup_purge]
		       call delete (l:Item)
		   endfor
	       endif
	    endif
         endfunction Set_Backup

	 " }}}2

         autocmd BufWritePre * :call s:Set_Backup (
	    \ g:backup_directory,
	    \ expand ('<afile>:p:h'),
	    \ expand ('<afile>:p:t'))
      " }}}1
    endif

    finish
endif

"------------------------------------------------------------------------------
"   Copyright (C) 2006  Martin Krischik
"   Copyright (C) 2008  Maciej Delmanowski
"
"   Vim is Charityware - see ":help license" or uganda.txt for licence details.
"-------------------------------------------------------------------------------
" vim: textwidth=0 nowrap tabstop=8 shiftwidth=3 softtabstop=3 noexpandtab
" vim: filetype=vim foldmethod=marker
