function! Keyaki#_init()
	" Buffer-local variables
	let b:tempname = tempname()
	let b:viewer_proc = v:null

	" Global settings
	if exists('g:Keyaki_viewer_command')
		let b:Keyaki_viewer_command = g:Keyaki_viewer_command
	else
		let b:Keyaki_viewer_command = ["eog", "--single-window"]
	endif

	if exists('g:Keyaki_drawtree_command')
		let b:Keyaki_drawtree_command = g:Keyaki_drawtree_command
	else
		let b:Keyaki_drawtree_command = ["parse_svg", 
			\ "--control",
			\ "--old",
			\ "--ich",
			\ "--trace"]
	endif
endfunction
