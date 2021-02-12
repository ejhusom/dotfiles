" ===================================================================
" File:     xml.vim
" Author:   Erik Johannes Husom
" Created:  2019-06-24
" -------------------------------------------------------------------
" Description: XML specific configuration.
" ===================================================================

" Autoclose tag and put cursor inside tag.
inoremap </ </<C-X><C-O><Esc>F<i
" Write tagname and then <C-e> to get enclosing brackets.
inoremap <C-e> <Esc>yiwi<<Esc>ea></<Esc>pa><Esc>F<i
" Special tags
inoremap <a <a href=""></a><Esc>F"i
inoremap <img <img src=""><Esc>F"i
