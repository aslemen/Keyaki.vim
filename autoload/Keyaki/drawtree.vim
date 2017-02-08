let b:tempname = tempname()

function Keyaki#drawtree#gen(mode)
	if a:mode == 0
		"non-visual mode
		silent! normal v
	else
		"visual mode
		silent! normal gv
	end

	let l:reg_curr = @a 
	normal "ay
	let l:text = @a
	let @a = l:reg_curr

	silent! execute "! tee " . b:tempname . ".psd"
endfunction

