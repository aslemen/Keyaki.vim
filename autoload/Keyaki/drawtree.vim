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

	silent! execute "!" . b:Keyaki_script_dir . "/bin/gen.sh " . b:tempname .  ".psd > " . b:tempname . ".tex"
	silent! execute "! pdflatex -output-directory=" . fnamemodify(b:tempname, ":p:h") " " . b:tempname . ".tex"
	" execute "! nohup atril  " . b:tempname . ".pdf &"
endfunction
 
function! Keyaki#drawtree#openviewer()
	silent execute "! watch nohup atril  " . b:tempname . ".pdf & "
endfunction
