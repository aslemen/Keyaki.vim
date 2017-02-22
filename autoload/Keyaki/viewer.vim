function! Keyaki#viewer#_init()
	map <silent><buffer> <plug>Keyaki_openviewer <SID>Keyaki_openviewer

	noremap <silent><buffer> <SID>Keyaki_openviewer :<c-u>call Keyaki#viewer#open()<cr>
endfunction

function! Keyaki#viewer#open()
	silent execute "! watch nohup atril  " . b:tempname . ".pdf & "
endfunction
