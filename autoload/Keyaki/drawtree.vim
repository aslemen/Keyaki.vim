function! Keyaki#drawtree#_init()
	map <silent><buffer> <plug>Keyaki_text_drawtree_gen <SID>Keyaki_text_drawtree_gen
	map <silent><buffer> <plug>Keyaki_motion_drawtree_gen <SID>Keyaki_motion_drawtree_gen

	noremap <silent><buffer> <SID>Keyaki_text_drawtree_gen :<c-u>call Keyaki#drawtree#gen(0)<cr><C-L>
	noremap <silent><buffer> <SID>Keyaki_motion_drawtree_gen :<c-u>call Keyaki#drawtree#gen(1)<cr><C-L>
endfunction

function! Keyaki#drawtree#gen(mode)
	let l:file_psd = b:tempname . ".psd"
	let l:file_svg = b:tempname . ".svg"

	" backup @a
	let l:regbackup = @a

	if a:mode == 0
		"non-visual mode
		silent! normal! vas
	else
		"visual mode
		silent! normal! gv
	end

	" yank the selected area to @a
	silent! normal! "ay

	silent! execute "redir! >" . l:file_psd
	silent echon @a
	silent redir END

	" restore @a
	let @a = l:regbackup

	" generate tree via parse_story
	execute "! cat ". l:file_psd . " | " .  "parse_svg > " l:file_svg 
	" launch the browser
	call Keyaki#viewer#open(l:file_svg)
endfunction
 
