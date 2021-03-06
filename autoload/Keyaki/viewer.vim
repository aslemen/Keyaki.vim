function! Keyaki#viewer#_init()
	map <silent><buffer> <plug>Keyaki_openviewer <SID>Keyaki_openviewer
	noremap <silent><buffer> <SID>Keyaki_openviewer :<c-u>call Keyaki#viewer#open("")<cr>
endfunction

function! Keyaki#viewer#open(filename)
	if a:filename == ""
		let l:filename = b:tempname . ".svg"
	else
		let l:filename = a:filename
	endif

	let b:viewer_proc = jobstart(["eog", "--single-window",  l:filename])
endfunction
