syntax on
syntax enable

set nocompatible
set autoindent
set laststatus=2
set nocompatible
set t_Co=256
set cursorline

set shiftwidth=4
set tabstop=4
set smarttab
set syntax=on
set wildmenu
set number
set hlsearch
set expandtab
set si
let mapleader ="," 
let g:Powerline_symbols = 'fancy'


autocmd CursorMovedI * if pumvisible() == 0|pclose|endif "for vjde stupid window" 
autocmd InsertLeave * if pumvisible() == 0|pclose|endif 
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"for hardmode"
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

"map for changing color scheme"
map <silent><F3> :NEXTCOLOR<cr> 
map <silent><F2> :PREVCOLOR<cr>

"map for fuzzyfinder"
nnoremap <C-f> :FufFile<cr>
"map to open tab"
nnoremap <leader>g :tabnew<CR>

"for pathogen"
call pathogen#infect()
map <C-n> :NERDTreeToggle<CR>
""helptags /usr/share/vim/vimfiles/doc
:helptags ~/.vim/doc
filetype plugin on
filetype plugin indent on
inoremap jj <ESC>
nnoremap <silent><F9> :TagbarToggle<Cr>

let g:SuperTabDefaultCompletionType = "context"
setlocal omnifunc=javacomplete#Complete
set tags=/home/zabador/tags

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap {{ {<CR>}<Esc>O
autocmd Syntax html,vim,xml inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
""inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

nmap <F4> "zyeb"xywmagg]m%O<Esc>opublic <Esc>"xpAget<Esc>"zpb3l~A()<Esc>o{ <Esc>oreturn this.<Esc>"zpA;<Esc>o" c>o<Esc>opublic void set<Esc>"zpb3l~A(<Esc>"xpA<Esc>"zpA)<Esc>o{ <Esc>othis.<Esc>"zpA = <Esc>"zpA;<Esc>o c>'a'"
function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
 return "\<Right>"
 else
 return a:char
 endif
endf

function CloseBracket()
 if match(getline(line('.') + 1), '\s*}') < 0
 return "\<CR>}"
 else
 return "\<Esc>j0f}a"
 endif
endf

function QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
 "Inserting a quoted quotation mark into the string
 return a:char
 elseif line[col - 1] == a:char
 "Escaping out of the string
 return "\<Right>"
 else
 "Starting a string
 return a:char.a:char."\<Esc>i"
 endif
endf

let $CLASSPATH = '$ANDROID_SDK/platforms/android-8/android.jar' . ':' . $CLASSPATH

""set background=dark
colorscheme mytheme
""highlight clear
""
""if exists("syntax on")
""      syntax reset
""      endif
""      
""      
""      highlight Normal     term=none cterm=none ctermfg="#4D2F2D" gui=none guibg=black
""      highlight Statement  term=none ctermfg=yellow  cterm=bold guifg=yellow  gui=none
""      highlight Operator   term=none ctermfg=yellow  cterm=none guifg=yellow  gui=none
""      highlight PreProc    term=none ctermfg=magenta cterm=bold guifg=magenta gui=none
""      highlight Identifier term=none ctermfg=cyan    cterm=bold guifg=cyan    gui=none
""      highlight Type       term=none ctermfg=green    cterm=bold guifg=green    gui=none
""      highlight Special    term=none ctermfg=cyan    cterm=bold guifg=cyan    gui=none
""      highlight String     term=none ctermfg=red    cterm=bold guifg=red    gui=none
""      highlight Number     term=none ctermfg=red    cterm=bold guifg=red    gui=none
""      highlight Constant   term=none ctermfg=red    cterm=bold guifg=red    gui=none
""      highlight Comment    term=none ctermfg=blue     cterm=none guifg=blue     gui=none
      "
"Added by android-vim:
set tags+=/home/zabador/.vim/tags
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
let g:SuperTabDefaultCompletionType = 'context'
"Added by android-vim:
set tags+=/home/zabador/.vim/tags
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
let g:SuperTabDefaultCompletionType = 'context'
