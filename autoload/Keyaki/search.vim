function! Keyaki#search#_init()
	map <buffer> <plug>Keyaki_command_search_sentence_forward <SID>Keyaki_command_search_sentence_forward
	map <buffer> <plug>Keyaki_command_search_sentence_backward <SID>Keyaki_command_search_sentence_backward

	map <buffer> <plug>Keyaki_command_search_tag_forward <SID>Keyaki_command_search_tag_forward
	map <buffer> <plug>Keyaki_command_search_tag_backward <SID>Keyaki_command_search_tag_backward

	noremap <buffer> <SID>Keyaki_command_search_sentence_forward :/(ID\s_<Left>
	noremap <buffer> <SID>Keyaki_command_search_sentence_backward :?(ID\s_<Left>

	noremap <buffer> <SID>Keyaki_command_search_tag_forward :/(\s<Left><Left>
	noremap <buffer> <SID>Keyaki_command_search_tag_backward :?(\s<Left><Left>
endfunction
