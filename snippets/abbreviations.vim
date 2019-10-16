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

iab begintable \begin{table}
    \<CR>\caption{}
    \<CR>\label{tab:}
    \<CR>\begin{tabular}{ c c c }
    \<CR> cell1 & cell2 & cell3 \\ 
    \<CR> cell4 & cell5 & cell6 \\  
    \<CR> cell7 & cell8 & cell9    
    \<CR>\end{tabular}
    \<CR>\end{table}
    \<Esc>3kA<C-R>=Eatchar('\s')<CR>

iab beginequation \begin{equation}
    \<CR>
    \<CR>\end{equation}
    \<Esc>kA<C-R>=Eatchar('\s')<CR>

iab beginalign \begin{align}
    \<CR>
    \<CR>\end{align}
    \<Esc>kA<C-R>=Eatchar('\s')<CR>
