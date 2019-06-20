" Erik Johannes Husom - Vim configuration

""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""
syntax on                   " syntax highlighting
set scrolloff=7             " number of lines above/below cursor when scrolling
set number                  " line numbers
set wildmenu                " autocomplete menu
set showmatch               " highlight matching parenthesis
set clipboard=unnamedplus   " something with copy/paste?
set textwidth=79            " max line width

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

set laststatus=2 " show statusline
"set noshowmode
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#Cursor#%{(mode()=='V')?'\ \ V-LINE\ ':''}
"set statusline+=%#Cursor#%{(mode()=='CTRL-V')?'\ \ V-BLOCK\ ':''}
set statusline+=%{&paste?'\ \ PASTE\ ':''}
set statusline+=%{&spell?'\ \ SPELL\ ':''}

set statusline+=%1* " color
set statusline+=\ %t\  " file name
set statusline+=%R                        " readonly flag
set statusline+=%M\  " status flag for modified file

set statusline+=%2* " color
set statusline+=\ %<%F\  " path to file

set statusline+=%= " switch to right side
set statusline+=%3* " color
set statusline+=\ %8{&fileencoding?&fileencoding:&encoding}\  " encoding

set statusline+=𐌂 " ornament 
"set statusline+=\| " ornament 
set statusline+=\ %Y\  "file type

set statusline+=%3* " color
set statusline+=\| " ornament 
set statusline+=\ %3l:%-2c\  " line and column number

set statusline+=%3* " color
set statusline+=\| " ornament 
set statusline+=\ %3p%%\  " percentage of file
set statusline+=\| " ornament 
set statusline+=\ %LL\  " total number of lines


""""""""""""""""""""""""""""""""""
" SNIPPETS AND SKELETONS
""""""""""""""""""""""""""""""""""
augroup snippets
    autocmd BufNewFile *.c 0r ~/.vim/snippets/skeleton.c
    autocmd BufNewFile README.md 0r ~/.vim/snippets/README.md
    autocmd BufNewFile report.tex 0r ~/.vim/snippets/report.tex
augroup END

nnoremap ,makelatex :0r ~/.vim/snippets/makelatex

""""""""""""""""""""""""""""""""""
" PANDOC
""""""""""""""""""""""""""""""""""
command! -nargs=* RunSilent
      \ | execute ':silent !'.'<args>'
      \ | execute ':redraw!'
nmap <Leader>pc :RunSilent pandoc -o /tmp/vim-pandoc-out.pdf % && xdg-open /tmp/vim-pandoc-out.pdf<CR>
nmap <Leader>hc :RunSilent pandoc -o /tmp/vim-pandoc-out.html -s --mathml % && xdg-open /tmp/vim-pandoc-out.html<CR>


