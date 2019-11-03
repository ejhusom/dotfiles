" ===================================================================
" File:     comment.vim
" Created:  2019-10-22
" -------------------------------------------------------------------
" Description: Functions for fast comment/uncomment.
" ===================================================================
map <C-d> :call Comment()<CR>
map <C-b> :call Uncomment()<CR>

function! Comment()
  let ext = tolower(expand('%:e'))
  if ext == 'php' || ext == 'rb' || ext == 'sh' || ext == 'py'
    silent s/^/\#/
  elseif ext == 'js' || ext == 'c' || ext == 'cpp'
    silent s:^:\/\/:g
  elseif ext == 'vim' || 'vimrc'
    silent s:^:\":g
  endif
endfunction

function! Uncomment()
  let ext = tolower(expand('%:e'))
  if ext == 'php' || ext == 'rb' || ext == 'sh' || ext == 'py'
    silent s/^\#//
  elseif ext == 'js' || ext == 'c' || ext == 'cpp'
    silent s:^\/\/::g
  elseif ext == 'vim'
    silent s:^\"::g
  endif
endfunction
