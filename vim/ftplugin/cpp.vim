" ===================================================================
" File:     cpp.vim
" Author:   Erik Johannes Husom
" Created:  2019-07-09
" -------------------------------------------------------------------
" Description: Vim configuration for C++ files.
" ===================================================================

"""""""""""""""""""""""""""""
" Abbreviations
"""""""""""""""""""""""""""""

" for-loop
iab ffor for (int i = 0; i <  ; i++){<CR><CR>}<Up><Up><Esc>20li<C-R>=Eatchar('\s')<CR>
" if-test
iab iff if (){<CR><CR>}<Up><Up><Esc>4li<C-R>=Eatchar('\s')<CR>
" printf
iab printf printf("%", );<Esc>4hi<C-R>=Eatchar('\s')<CR>
" timing
iab timeit #include <chrono>
    \<CR>using namespace std::chrono;
    \<CR>auto start = high_resolution_clock::now();
    \<CR>
    \<CR>auto stop = high_resolution_clock::now();
    \<CR>duration<double> elapsed = stop - start;
    \<CR>cout << elapsed.count() << endl;
    \<Esc>3ki<C-R>=Eatchar('\s')<CR>
