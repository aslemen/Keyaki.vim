function Keyaki#drawtree#gen(mode)
	let l:tempname = tempname()
	if a:mode == 0
		"non-visual mode
		silent! normal gv
	end

	silent! execute "! tee " . l:tempname . ".psd"
endfunction

