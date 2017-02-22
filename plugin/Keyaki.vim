" Keyaki.vim: NPCMJ Toolkit
"
" Maintainer: Tatsuya Hayashi <net@hayashi-lin.net>
" Last Modified: 2017 Feb 17

if exists('b:did_keyaki')
  finish
endif
let b:did_keyaki= 1

let b:Keyaki_script_dir = expand('<sfile>:p:h') . "/.."
call Keyaki#_init()

call Keyaki#drawtree#_init()

call Keyaki#viewer#_init()

call Keyaki#search#_init()

call Keyaki#map#_init()
call Keyaki#map#_init_F()
