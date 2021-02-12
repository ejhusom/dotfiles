" ===================================================================
" File:     c.vim
" Author:   Erik Johannes Husom
" Created:  2019-06-24
" -------------------------------------------------------------------
" Description: Vim configuration for C files.
" ===================================================================

"""""""""""""""""""""""""""""
" Abbreviations
"""""""""""""""""""""""""""""
iab for for (int i = 0; i <  ; i++){<CR><CR>}<Up><Up><Esc>20li<C-R>=Eatchar('\s')<CR>
iab if if (){<CR><CR>}<Up><Up><Esc>4li<C-R>=Eatchar('\s')<CR>
iab printf printf("%", );<Esc>4hi<C-R>=Eatchar('\s')<CR>
