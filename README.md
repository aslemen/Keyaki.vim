# Keyaki.vim
Keyaki.vim is an editorial environment 
for the NPCMJ corpus (Keyaki Corpus) by NINJAL, working in Vim / Neovim.
This plugin consists of the following functions:

- The definition of tags (syntactic labels) particular to the Keyaki corpus 
- Key mappings
- Exporting trees to LaTeX
- Connection with tree viewers

## Installation
Put the plugin folder in your .vim directory, or use plugin managers.
__This plugin requires penn.vim.__
Enable the filetype detection, plugin and indent (by the command `:filetype plugin indent on`)

## Syntax Highliting
Set the buffer-local variables `blahblah` and `blahblah` before loading the plugin.

## Default Key Mappings (in Emacs-Keyaki-Mode style)
| Key        | Type | Reference | Function | 
|:--------|:-------:|:-----------|-----------|
| `<F3>` `<LocalLeader>s/` | Normal | `<plug>Keyaki_command_search_sentence_forward` | search sentences by ID forward|
| `<S-F3>` `<LocalLeader>s?` | Normal | `<plug>Keyaki_command_search_sentence_backward` | search sentences by ID backward |
| `<F4>` `<LocalLeader>s/` | Normal | `<plug>Keyaki_command_search_tag_forward` | search tags by tag forward |
| `<S-F4>` `<LocalLeader>s?` | Normal | `<plug>Keyaki_command_search_tag_backward` | search tags by tag backward |
| `<F5>` | Normal | `<S-F5><LocalLeader>g` | indent the whole sentence & generate the tree diagram in the SVG format |
| `<S-F5>` | Normal | `vas=` | indent the whole sentence |
| `<F6>` | Normal | `vanJ` | linearize the whole node |
| `<F7>` | Normal | `}j` | go to the next sentence |
| `<F8>` | Normal | `{{J` | go to the previous sentence |
| `<F9> ` | Normal | `<plug>Keyaki_openviewer` | open the viewer |
| `<F11>` | Normal | `u` | undo |
|	`<F12>` | Normal | `/` | search forward |
|	`<F12>` | Normal | `?` | search backward |

## External Programs
- munge-trees
- parse-svg
- atril

## Getting involved
The author welcomes any contributions for this Vim / Neovim plugin by reporting bugs, creating issues or making pull requests.

The current tasks:
- Smarter implementations
- Implementation of new features

## License
See `LINCENSE`.
