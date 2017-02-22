function! Keyaki#map#_init()
	"gen. trees: normal mode (for sentences), visual mode (for selected areas)
	nmap <silent><buffer> <Localleader>g <plug>Keyaki_text_drawtree_gen
	"vmap <silent><buffer> <Localleader>t <plug>Keyaki_text_drawtree_gen

	"open viewer: normal mode only
	nmap <silent><buffer> <Localleader>v <plug>Keyaki_openviewer

	"search sentence IDs: normal mode only
	nmap <buffer> <Localleader>s/ <plug>Keyaki_command_search_sentence_forward
	nmap <buffer> <Localleader>s? <plug>Keyaki_command_search_sentence_backward
	"search tags: normal mode only
	nmap <buffer> <Localleader>t/ <plug>Keyaki_command_search_tag_forward
	nmap <buffer> <Localleader>t? <plug>Keyaki_command_search_tag_backward
endfunction

function! Keyaki#map#_init_F()
	nmap <buffer> <F3> <LocalLeader>s/
	nmap <buffer> <S-F3> <LocalLeader>s?
	nmap <buffer> <F4> <LocalLeader>t/
	nmap <buffer> <S-F4> <LocalLeader>t?

	nmap <silent><buffer> <S-F5> vas=
	nmap <silent><buffer> <F5> <S-F5><LocalLeader>g
	nmap <silent><buffer> <F6> vanJ
	"nmap <buffer> <S-F6> h/(/<CR>%o<ESC>Jk$%:nohlsearch<CR>i<CR><CR><ESC>%o<ESC>k{j!} munge-trees -w<CR>jdd3k3JJh%
	nmap <silent><buffer> <S-F7> }j
	nmap <silent><buffer> <F7> <S-F7><LocalLeader>g
	nmap <silent><buffer> <S-F8> {{j
	nmap <silent><buffer> <F8> <S-F8><LocalLeader>g

	nmap <silent><buffer> <F9> <Localleader>v
	
	nmap <buffer> <F11> u
	nmap <buffer> <F12> /
	nmap <buffer> <S-F12> ?
endfunction
