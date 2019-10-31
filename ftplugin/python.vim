" ===================================================================
" File:     python.vim
" Author:   Erik Johannes Husom
" Created:  2019-06-24
" -------------------------------------------------------------------
" Description: Python-specific configuration for Vim.
" ===================================================================

"""""""""""""""""""""""""""""
" Abbreviations
"""""""""""""""""""""""""""""
iab ifmain if __name__ == '__main__':
iab inp import numpy as np

iab deff def function():
\<CR>   """Oneliner.
\<CR>
\<CR>Parameters
\<CR>----------
\<CR>parameter : float
\<CR>   Description.
\<CR>
\<CR><BS>
\<CR>Returns
\<CR>-------
\<CR>array[float]
\<CR>   Description.
\<CR>
\<CR><BS>
\<CR>Notes
\<CR>-----
\<CR>
\<CR>
\<CR>Example
\<CR>-------
\<CR>>>>
\<CR>
\<CR><BS>"""
\<CR>
\<Esc>i<Tab><Tab><C-R>=Eatchar('\s')<CR>

iab class class ClassName():
\<CR>   """Oneliner.
\<CR>
\<CR>Parameters
\<CR>----------
\<CR>parameter : float
\<CR>   Description.
\<CR>
\<CR>
\<CR><BS>
\<CR>Attributes
\<CR>----------
\<CR>attribute : float
\<CR>   Description.
\<CR>
\<CR>array[float]
\<CR>   Description.
\<CR>
\<CR><BS>
\<CR>Notes
\<CR>-----
\<CR>
\<CR>
\<CR>Example
\<CR>-------
\<CR>>>>
\<CR>
\<CR><BS>"""
\<CR>
\<CR>
\<CR>def __init__(self):
\<CR><Tab>pass
\<Esc>A<C-R>=Eatchar('\s')<CR>
