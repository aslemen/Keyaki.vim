function! Keyaki#drawtree#gen(mode)
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

	silent! execute "redir! >".  b:tempname . ".psd"
	silent echon @a
	silent redir END	

	" restore @a
	let @a = l:regbackup

	silent execute "! generate-indexed-tree.sh " . b:tempname .  ".psd"
	silent execute "! pdflatex -output-directory=" . fnamemodify(b:tempname, ":p:h") " " . b:tempname . "-indexed.tex"
	silent execute "! atril" . b:tempname . "-indexed.pdf"
endfunction
