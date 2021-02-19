" ===================================================================
" File:     abbrevations.vim
" Author:   Erik Johannes Husom
" Created:  2019-06-24
" -------------------------------------------------------------------
" Description: Global abbreviations for Vim.
" ===================================================================

" General{{{
" Datestamp
:iab <expr> dts strftime("%Y-%m-%d %A %T")
" Closing stuff
" inoremap ( ()<Esc>i
" inoremap [ []<Esc>i
" inoremap { {}<Esc>i
" inoremap " ""<Esc>i
" inoremap ' ''<Esc>i
" inoremap () ()<Left>
" inoremap [] []<Left>
" inoremap {} {}<Left>
" inoremap <> <><Left>
" inoremap "" ""<Left>
" inoremap '' ''<Left>
" inoremap $$ $$<Left>
"}}}

" Latex{{{
inoremap beginfigure \begin{figure}
    \<CR>   \includegraphics[width=\linewidth]{}
    \<CR>\caption{}
    \<CR>\label{fig:}
    \<CR>\end{figure}
    \<Esc>3kA<C-R>=Eatchar('\s')<CR>

inoremap begintable \begin{table}
    \<CR>\caption{}
    \<CR>\label{tab:}
    \<CR>\begin{tabular}{ c c c }
    \<CR> cell1 & cell2 & cell3 \\ 
    \<CR> cell4 & cell5 & cell6 \\  
    \<CR> cell7 & cell8 & cell9    
    \<CR>\end{tabular}
    \<CR>\end{table}
    \<Esc>3kA<C-R>=Eatchar('\s')<CR>

inoremap beginequation \begin{equation}
    \<CR>
    \<CR>\end{equation}
    \<Esc>kA<C-R>=Eatchar('\s')<CR>

inoremap beginalign \begin{align}
    \<CR>
    \<CR>\end{align}
    \<Esc>kA<C-R>=Eatchar('\s')<CR>

inoreabbrev \h \hat{}<Esc>i<C-R>=Eatchar('\s')<CR>
" inoreabbrev bs \boldsymbol{}<Esc>i<C-R>=Eatchar('\s')<CR>
""}}}
