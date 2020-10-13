" ===================================================================
" File:     Vim configuration
" Author:   Erik Johannes Husom
" Created:  2018-10-13
" Version:  2.0
" -------------------------------------------------------------------
" Description: General configuration for Vim on UNIX.
" Tips:
" - Run `sudo apt-get install vim-gtk` on Ubuntu to be able to copy
"   to system clipboard with `"+y`.
" Resources:
" - Great articles: https://vimways.org/
" - Cheat sheet: https://vim.rtorr.com/
" ===================================================================

" General{{{
set nocompatible            " use vim, not vi api
set term=xterm-256color
syntax on                   " syntax highlighting
filetype indent plugin on   " determine file type and use auto-indenting
set shell=bash\ -i
" set scrolloff=7             " number of lines above/below cursor when scrolling
set number                  " line numbers
set wildmenu                " autocomplete menu
set showmatch               " highlight matching parenthesis
set history=200             " record longer command history (default=50)
set linebreak               " do not break lines in middle of a word
set formatoptions+=t      " automatic line wrapping
set textwidth=79            " max line width
" au BufRead,BufNewFile *.html setlocal textwidth=0 " unlimited line length in html-files
" au BufRead,BufNewFile *.csv setlocal textwidth=0 " unlimited line length in html-files
" set colorcolumn=80
set termguicolors
highlight ColorColumn ctermbg=darkgray
set mouse=a                 " enable mouse in all modes
set ruler                   " always show cursor
set cursorline              " highlight current line
set visualbell              " remove sound at mistype
set splitbelow
set splitright
let mapleader = ','
execute pathogen#infect()
" autocmd BufWinEnter * highlight ColorColumn ctermbg=grey
" set colorcolumn=80  
" allow backspacing over everything in insert mode
set backspace=indent,eol,start        " highlight column 80
" }}}

" Copy/paste{{{
if system('uname -s') == "Darwin\n"
  "OSX
  set clipboard=unnamed
else
  "Linux
  set clipboard=unnamedplus
endif

" The following keymappings work on Unix for copying/pasting from system
" clipboard, without having to use the + and * registers. Also, normal
" control/command and c/v is very slow for large chunks of text, so this works
" better.
vmap <C-y> :w !pbcopy<CR><CR>
nmap <C-p> :r !pbpaste<CR><CR>
"}}}

" Completion{{{
" set complete=
set omnifunc=syntaxcomplete#Complete
set complete-=i
"}}}

" Folding{{{
set foldmethod=marker
autocmd Filetype python set foldmethod=indent       " folds at indent in python files
autocmd Filetype cpp set foldmethod=syntax          " syntax folding in C++ files
autocmd Filetype c set foldmethod=syntax            " syntax folding in C files
autocmd Filetype javascript set foldmethod=indent   " syntax folding in C files
autocmd Filetype javascript set foldnestmax=2       " syntax folding in C files
autocmd Filetype tex set foldmarker=\\begin,\\end
autocmd Filetype tex set foldmethod=marker
let javaScript_fold = 1    
let g:markdown_folding = 1
let g:markdown_enable_folding = 1
nnoremap <space> za                                 " toggle folding
"}}}

" Tab indentation{{{

" General
set tabstop=4               " four-space tab indent
set softtabstop=4           " Vim sees 4 spaces as tab when backspacing
set shiftwidth=4            " using < and > to indent/unindent blocks
set expandtab               " inserts spaces instead of tab character
set autoindent              " autoindent when creating new line

" CSS
" autocmd FileType css setlocal tabstop=2      
" autocmd FileType css setlocal softtabstop=2  
" autocmd FileType css setlocal shiftwidth=2   

" HTML
" autocmd FileType html setlocal tabstop=2      
" autocmd FileType html setlocal softtabstop=2  
" autocmd FileType html setlocal shiftwidth=2   

" JavaScript
autocmd FileType javascript setlocal tabstop=4
autocmd FileType javascript setlocal softtabstop=4 
autocmd FileType javascript setlocal shiftwidth=4

" Make
autocmd FileType make setlocal noexpandtab  " use tab (not spaces) in makefiles


"}}}

" File types{{{
" DVC
autocmd! BufNewFile,BufRead Dvcfile,*.dvc,dvc.lock setfiletype yaml
"}}}

" Searching{{{
" Shortcut for removing search highlighting
nnoremap <leader><space> :nohlsearch<CR>
set incsearch               " automatically jumps to first match
set hlsearch                " highlight search terms
set smartcase               " ignores case if search term has small case, but does not ignore case if term has large case
set ignorecase
set path+=**                " search in subfolders when using :find
nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>
"}}}

" Appearance{{{
" colorscheme pencil
colorscheme gruvbox
" colorscheme molokai
" colorscheme harlequin
" colorscheme dogrun
" colorscheme darkspace
" colorscheme xcodedark
" colorscheme aurora
" colorscheme eldar
" let g:pencil_higher_contrast_ui = 0
" let g:pencil_neutral_code_bg = 1
set background=dark
"set foldcolumn=1           " add margin to the left
"}}}

" Snippets and skeletons{{{
augroup snippets
    autocmd BufNewFile *.c 0r ~/.vim/snippets/skeleton.c
    autocmd BufNewFile *.h 0r ~/.vim/snippets/skeleton.h
    autocmd BufNewFile *.cpp 0r ~/.vim/snippets/skeleton.cpp
    autocmd BufNewFile *.py 0r ~/.vim/snippets/skeleton.py
    autocmd BufNewFile plottest.py 0r ~/.vim/snippets/plottest.py
    autocmd BufNewFile *.vim 0r ~/.vim/snippets/skeleton.vim
    autocmd BufNewFile *.html 0r ~/.vim/snippets/skeleton.html
    autocmd BufNewFile *.css 0r ~/.vim/snippets/skeleton.css
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
nnoremap ,function :r ~/.vim/snippets/function.py<CR>
nnoremap ,class :r ~/.vim/snippets/class.py<CR>
nnoremap ,import :r ~/.vim/snippets/import.py<CR>

" Abbreviation commands
inoremap ,ct ```<CR>

:source ~/dotfiles/snippets/abbreviations.vim 

" Function for removing trailing whitespace '\s' in abbreviations:
func Eatchar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunc
"}}}

" Pandoc{{{
""""""""""""""""""""""""""""""""""
command! -nargs=* RunSilent
      \ | execute ':silent !'.'<args>'
      \ | execute ':redraw!'

if system('uname -s') == "Darwin\n"
    nmap ,pc :RunSilent pandoc -o /tmp/vim-pandoc-out.pdf % && open /tmp/vim-pandoc-out.pdf<CR>
    nmap ,hc :RunSilent pandoc -o /tmp/vim-pandoc-out.html -s --mathml % && open /tmp/vim-pandoc-out.html<CR>
else
    nmap ,pc :!pandoc -o /tmp/vim-pandoc-out.pdf % && xdg-open /tmp/vim-pandoc-out.pdf<CR>
    nmap ,hc :!pandoc -o /tmp/vim-pandoc-out.html -s --mathml % && xdg-open /tmp/vim-pandoc-out.html<CR>
endif
"}}}

" File browsing{{{
" - Help on file browsing: `:help netrw-quickmap`

let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=2  " open in vertical split
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=1     " tree view
let g:netrw_winsize = 25    " sets width of explorer to 25% of the page
" let g:netrw_list_hide=netrw_gitignore#Hide()
" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
"}}}

" User-defined keymappings{{{
nnoremap <C-h> ggVG     " Visual select entire file
"}}}

" Vim scripts{{{
" Visual search with *
source ~/.vim/vimscripts/visual-star.vim
" Comment/uncomment with gc[motion]
source ~/.vim/vimscripts/commentary.vim
" Open URL
source ~/.vim/vimscripts/handle_url.vim
" Switch from source to header
source ~/.vim/vimscripts/switchsourceheader.vim
" Markdown preview
" source ~/.vim/after/ftplugin/markdown/instant-markdown.vim
" GSM translate
source ~/.vim/vimscripts/gsm-translate.vim
source ~/.vim/vimscripts/mdstyle.vim
"}}}

" Statusline{{{
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
set statusline+=%{exists('*GTMStatusline')?'['.GTMStatusline().']':''}\  " displaying gtm metrics
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
"}}}

" Undo{{{
set undodir=~/.vim/undodir
set undofile
"}}}

" Plugins{{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'https://github.com/majutsushi/tagbar', { 'do': { -> mkdp#util#install() } }
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

call plug#end()
"}}}

" Markdown Preview{{{
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {}
    \ }

" use a custom markdown style must be absolute path
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

nmap <C-s> <Plug>MarkdownPreview
"}}}

" TagBar{{{
nmap <F8> :TagbarToggle<CR>
"}}}

" Latex preview{{{
let g:livepreview_previewer = "open -a Preview"
"}}}
