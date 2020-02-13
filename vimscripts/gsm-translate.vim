" ===================================================================
" File:     gsm-translate.vim
" Author:   Erik Johannes Husom
" Created:  2020-02-13
" -------------------------------------------------------------------
" Description: Translate SMS encoded characters.
" ===================================================================

function! GSMTranslate()
    execute '%s/=\n//g'
    exec '%s/=C3=86/Æ/g'
    exec '%s/=C3=A6/æ/g'
    exec '%s/=C3=98/Ø/g'
    exec '%s/=C3=B8/ø/g'
    exec '%s/=C3=85/Å/g'
    exec '%s/=C3=A5/å/g'
    exec '%s/=E2=99=A5/<3/g'
    exec '%s/=E2=99=A1/<3/g'
    exec '%s/=0D=0A/\r/g'
endfunction
