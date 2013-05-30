set background=dark
highlight clear

if exists("syntax on")
    syntax reset
endif

highlight Normal     term=none ctermfg=250 guifg=none guibg=black
highlight Statement  term=none ctermfg=yellow  cterm=bold guifg=yellow  gui=none
highlight Operator   term=none ctermfg=yellow  cterm=bold guifg=yellow  gui=none
highlight PreProc    term=none ctermfg=magenta cterm=bold guifg=magenta gui=none
highlight CursorLine    term=none ctermfg=none cterm=underline guifg=none guibg=none
highlight Identifier term=none ctermfg=cyan    cterm=bold guifg=cyan    gui=none
highlight Type       term=none ctermfg=green    cterm=bold guifg=green    gui=none
highlight Special    term=none ctermfg=cyan    cterm=bold guifg=cyan    gui=none
highlight String     term=none ctermfg=red    cterm=bold guifg=red    gui=none
highlight Number     term=none ctermfg=red    cterm=bold guifg=red    gui=none
highlight Constant   term=none ctermfg=red    cterm=bold guifg=red    gui=none
highlight Comment    term=none ctermfg=blue     cterm=none guifg=blue     gui=none


