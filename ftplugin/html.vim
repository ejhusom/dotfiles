" ===================================================================
" File:     Vim skeleton
" Author:   Erik Johannes Husom
" Created:  2019-06-24
" -------------------------------------------------------------------
" Description: Skeleton for Vim files.
" ===================================================================

" Autoclose tag and put cursor inside tag.
imap </ </<C-X><C-O><Esc>F<i
" Write tagname and then <C-e> to get enclosing brackets.
imap <C-e> <Esc>yiwi<<Esc>ea></
