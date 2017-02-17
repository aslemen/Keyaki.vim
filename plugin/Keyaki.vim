" Keyaki.vim: NPCMJ Toolkit
"
" Maintainer: Tatsuya Hayashi <net@hayashi-lin.net>
" Last Modified: 2017 Feb 17

let b:Keyaki_script_dir = expand('<sfile>:p:h') . "/.."

if exists('b:did_keyaki')
  finish
endif
let b:did_keyaki= 1

call Keyaki#_init()

"vmap <silent><buffer> as <plug>penn_motion_sentence_all
"vmap <silent><buffer> is <plug>penn_motion_sentence_inner
"omap <silent><buffer> as <plug>penn_text_obj_sentence_all
"omap <silent><buffer> is <plug>penn_text_obj_sentence_inner
"
"vmap <silent><buffer> an <plug>penn_motion_node_all
"vmap <silent><buffer> in <plug>penn_motion_node_inner
"omap <silent><buffer> an <plug>penn_text_obj_node_all
"omap <silent><buffer> in <plug>penn_text_obj_node_inner
