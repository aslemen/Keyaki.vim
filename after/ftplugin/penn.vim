"	 Keyaki settings
	
" Key Mapping 

" F2 -> zo/zc: fold
" F3: move by sentence ID
" F5 -> =: reindent
" F6: liniarlize
" F7 -> } next sentence
" F8 -> { prev sentence
" F9 -> preview with control relations
" 
" place the constituent that is adjacent to the cursor on one line
" map <F6> h/(/<CR>%o<ESC>Jk$%:nohlsearch<CR>i<CR><CR><ESC>%o<ESC>k{j!} munge-trees -w<CR>jdd3k3J
" place the constituent that is adjacent to the cursor and following functional information on one line
nmap <buffer> <S-F6> h/(/<CR>%o<ESC>Jk$%:nohlsearch<CR>i<CR><CR><ESC>%o<ESC>k{j!} munge-trees -w<CR>jdd3k3JJh%
" (re)indent tree
nmap <buffer> <F5> vas=<CR>
nmap <buffer> <F6> vangj
nmap <buffer> <F7> }j<F9>
nmap <buffer> <F8> {{j<F9>
" nmap <F9> vas ! tee ~/tmp/tree<CR>:redraw!<CR>
nmap <buffer> <F9> vas ! tee ~/tmp/tree<CR>:silent !/home/glenda/Desktop/share/programs/bin/ControlCalculate<CR>:redraw!<CR>
" (re)format tree to a single line

nmap <Leader>t :call Keyaki#drawtree#gen(0)<CR>
vmap <Leader>t :call Keyaki#drawtree#gen(1)<CR>

" setlocal fileencodings=utf-8,sjis,euc-jp,default

"command Control !/home/glenda/Desktop/share/programs/bin/ControlCalculate
"map <Leader>kc <plug>Control
