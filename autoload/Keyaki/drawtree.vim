function! Keyaki#drawtree#_init()
	map <silent><buffer> <plug>Keyaki_text_drawtree_gen <SID>Keyaki_text_drawtree_gen
	map <silent><buffer> <plug>Keyaki_motion_drawtree_gen <SID>Keyaki_motion_drawtree_gen

	noremap <silent><buffer> <SID>Keyaki_text_drawtree_gen :<c-u>call Keyaki#drawtree#gen(0)<cr><C-L>
	noremap <silent><buffer> <SID>Keyaki_motion_drawtree_gen :<c-u>call Keyaki#drawtree#gen(1)<cr><C-L>
endfunction

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

	" generate tree via parse_story
	execute "!" . b:Keyaki_script_dir . "/bin/parse_story" . b:tempname . ".psd > " . b:tempname . ".html"
	" launch the browser
	Keyaki#viewer#open(b:tempname . ".html")

	"silent! execute "!" . b:Keyaki_script_dir . "/bin/generate-indexed-tree.sh " . b:tempname .  ".psd > " . b:tempname . ".tex"
	"silent! execute "! pdflatex -output-directory=" . fnamemodify(b:tempname, ":p:h") " " . b:tempname . ".tex"
	" execute "! nohup atril  " . b:tempname . ".pdf &"
endfunction
 
