" ===================================================================
" File:     abbrevations.vim
" Author:   Erik Johannes Husom
" Created:  2019-06-24
" -------------------------------------------------------------------
" Description: Global abbreviations for Vim.
" ===================================================================

" Datestamp
:iab <expr> dts strftime("%Y-%m-%d %A %T")

" LaTeX
iab beginfigure \begin{figure}
    \<CR>   \includegraphics[width=\linewidth]{}
    \<CR>\caption{}
    \<CR>\label{fig:}
    \<CR>\end{figure}
    \<Esc>3kA<C-R>=Eatchar('\s')<CR>
