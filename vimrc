" ===================================================================
" File:     Vim configuration
" Author:   Erik Johannes Husom
" Created:  2018-10-13
" -------------------------------------------------------------------
" Description: General configuration for Vim on UNIX.
" Tips:
" - Run `sudo apt-get install vim-gtk` on Ubuntu to be able to copy
"   to system clipboard with `"+y`.
" Resources:
" - Great articles: https://vimways.org/
" - Cheat sheet: https://vim.rtorr.com/
" ===================================================================

""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""
syntax on                   " syntax highlighting
filetype indent plugin on   " determine file type and use auto-indenting
set scrolloff=7             " number of lines above/below cursor when scrolling
set number                  " line numbers
set wildmenu                " autocomplete menu
set showmatch               " highlight matching parenthesis
set clipboard=unnamedplus   " something with copy/paste?
set linebreak               " do not break lines in middle of a word
set textwidth=79            " max line width
au BufRead,BufNewFile *.html setlocal textwidth=0 " unlimited line length in html-files
"set mouse=a                 " enable mouse in all modes


""""""""""""""""""""""""""""""""""
" Folding
""""""""""""""""""""""""""""""""""
autocmd Filetype python set foldmethod=indent       " folds at indent in python files
nnoremap zx :set foldlevel=20<CR>
nnoremap zz :set foldlevel=0<CR>


""""""""""""""""""""""""""""""""""
" Tab indentation
""""""""""""""""""""""""""""""""""
set tabstop=4               " four-space tab indent
set softtabstop=4           " Vim sees 4 spaces as tab when backspacing
set shiftwidth=4            " using < and > to indent/unindent blocks
set expandtab               " inserts spaces instead of tab character
set autoindent              " autoindent when creating new line
autocmd FileType make setlocal noexpandtab " use tab (not spaces) in makefiles

""""""""""""""""""""""""""""""""""
" SEARCHING
""""""""""""""""""""""""""""""""""
" Shortcut for removing search highlighting
nnoremap <leader><space> :nohlsearch<CR>
set incsearch               " automatically jumps to first match
set hlsearch                " highlight search terms
set smartcase               " ignores case if search term has small case, but does not ignore case if term has large case
set path+=**                " search in subfolders when using :find



""""""""""""""""""""""""""""""""""
" Appearance
""""""""""""""""""""""""""""""""""
colorscheme pencil
set background=dark
"set foldcolumn=1           " add margin to the left



""""""""""""""""""""""""""""""""""
" Statusline
""""""""""""""""""""""""""""""""""
" Blue theme:
"hi User1 ctermfg=007 ctermbg=004
"hi User2 ctermfg=012 ctermbg=238
" Cream white theme:
hi User1 ctermfg=000 ctermbg=007
hi User2 ctermfg=007 ctermbg=238
hi User3 ctermfg=000 ctermbg=007

set laststatus=2                            " show statusline
"set noshowmode
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#Cursor#%{(mode()=='V')?'\ \ V-LINE\ ':''}
"set statusline+=%#Cursor#%{(mode()=='CTRL-V')?'\ \ V-BLOCK\ ':''}
set statusline+=%{&paste?'\ \ PASTE\ ':''}
set statusline+=%{&spell?'\ \ SPELL\ ':''}

set statusline+=%1*                         " color
set statusline+=\ %t\                       " file name
set statusline+=%R                          " readonly flag
set statusline+=%M\                         " status flag for modified file

set statusline+=%2*                         " color
set statusline+=\ %<%F\                     " path to file

set statusline+=%=                          " switch to right side
set statusline+=%3*                         " color
set statusline+=\ %8{&fileencoding?&fileencoding:&encoding}\  " encoding

set statusline+=𐌂                           " ornament 
"set statusline+=\|                         " ornament 
set statusline+=\ %Y\                       "file type

set statusline+=%3*                         " color
set statusline+=\|                          " ornament 
set statusline+=\ %3l:%-2c\                 " line and column number

set statusline+=%3*                         " color
set statusline+=\|                          " ornament 
set statusline+=\ %3p%%\                    " percentage of file
set statusline+=\|                          " ornament 
set statusline+=\ %LL\                      " total number of lines


""""""""""""""""""""""""""""""""""
" SNIPPETS AND SKELETONS
""""""""""""""""""""""""""""""""""
augroup snippets
    autocmd BufNewFile *.c 0r ~/.vim/snippets/skeleton.c
    autocmd BufNewFile *.h 0r ~/.vim/snippets/skeleton.h
    autocmd BufNewFile *.cpp 0r ~/.vim/snippets/skeleton.cpp
    autocmd BufNewFile *.py 0r ~/.vim/snippets/skeleton.py
    autocmd BufNewFile *.vim 0r ~/.vim/snippets/skeleton.vim
    autocmd BufNewFile *.html 0r ~/.vim/snippets/skeleton.html
    autocmd BufNewFile README.md 0r ~/.vim/snippets/README.md
    autocmd BufNewFile report.tex 0r ~/.vim/snippets/report.tex
    autocmd BufNewFile report.md 0r ~/.vim/snippets/report.md
    autocmd BufNewFile references.bib 0r ~/.vim/snippets/references.bib
    autocmd BufNewFile .gitignore 0r ~/.vim/snippets/.gitignore
augroup END

" Infile skeletons
nnoremap ,makelatex :0r ~/.vim/snippets/makelatex<CR>
nnoremap ,makemarkdown :0r ~/.vim/snippets/makemarkdown<CR>
nnoremap ,makec :0r ~/.vim/snippets/makec<CR>
nnoremap ,makecpp :0r ~/.vim/snippets/makecpp<CR>
nnoremap ,bash :0r ~/.vim/snippets/bashskeleton<CR><S-g>
nnoremap ,function .0r ~.vim/snippets/function.py<CR>
nnoremap ,class .0r ~.vim/snippets/class.py<CR>

" Abbreviation commands
inoremap ,ct ```<CR>

:source ~/dotfiles/snippets/abbreviations.vim 

" Function for removing trailing whitespace '\s' in abbreviations:
func Eatchar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunc


""""""""""""""""""""""""""""""""""
" PANDOC
""""""""""""""""""""""""""""""""""
command! -nargs=* RunSilent
      \ | execute ':silent !'.'<args>'
      \ | execute ':redraw!'
nmap ,pc :RunSilent pandoc -o /tmp/vim-pandoc-out.pdf % && xdg-open /tmp/vim-pandoc-out.pdf<CR>
nmap ,hc :RunSilent pandoc -o /tmp/vim-pandoc-out.html -s --mathml % && xdg-open /tmp/vim-pandoc-out.html<CR>


""""""""""""""""""""""""""""""""""
" File browsing
""""""""""""""""""""""""""""""""""
" - Help on file browsing: `:help netrw-quickmap`

let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=2  " open in vertical split
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_winsize = 25    " sets width of explorer to 25% of the page
" let g:netrw_list_hide=netrw_gitignore#Hide()
" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'


""""""""""""""""""""""""""""""""""
" Comment/uncomment
""""""""""""""""""""""""""""""""""
source ~/.vim/comment.vim
map <C-a> :call Comment()<CR>
map <C-b> :call Uncomment()<CR>
