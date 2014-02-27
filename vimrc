syntax on
syntax enable

set nocompatible
set autoindent
set laststatus=2
set nocompatible
set t_Co=256
set cursorline
set guitablabel=%N\ %f

set shiftwidth=4
set tabstop=4
set smarttab
set syntax=on
set wildmenu
set number
set hlsearch
""set expandtab
set si
set undofile
set undodir=$HOME/.vimundo
let mapleader ="," 
let g:Powerline_symbols = 'fancy'
let g:nerdtree_tabs_open_on_console_startup=1

"automatic import for java
:noremap <F5> <Esc>
 \<C-W>}o//TEMP MARKER<Esc>
 \<C-W>P1G/public class<CR><Esc>yy<C-W>pG?import<CR><Esc>p<Esc>
 \<C-W>P1G/package<CR><Esc>yy<C-W>pG?import<CR><Esc>p<Esc>
 \$xa.<Esc>0jwwi<CR><Esc>kdd<Esc>
 \wDx<Esc>kJxx<Esc>$a;<Esc>
 \0cwimport<Esc>
 \:update<CR><Esc>
 \/TEMP MARKER<CR>dd<Esc>


"jslint"

autocmd FileType javascript noremap <buffer>  <F7> :call JsBeautify()<cr> :%s/function(/function (<cr> :%s/    /\t/g<cr>
" for html
autocmd FileType html noremap <buffer> <F7> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <F7> :call CSSBeautify()<cr>

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc


"Rename tabs to show tab# and # of viewports
if exists("+showtabline")
	function! MyTabLine()
		let s = ''
		let wn = ''
		let t = tabpagenr()
		let i = 1
	while i <= tabpagenr('$')
		let buflist = tabpagebuflist(i)
		let winnr = tabpagewinnr(i)
		let s .= '%' . i . 'T'
		let s .= (i == t ? '%1*' : '%2*')
		let s .= ' '
		let wn = tabpagewinnr(i,'$')

		let s .= (i== t ? '%#TabNumSel#' : '%#TabNum#')
		let s .= i
		let s .= ' %*'
		let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
		let bufnr = buflist[winnr - 1]
		let file = bufname(bufnr)
		let buftype = getbufvar(bufnr, 'buftype')
		if buftype == 'nofile'
			if file =~ '\/.'
				let file = substitute(file, '.*\/\ze.', '', '')
			endif
		else
			let file = fnamemodify(file, ':p:t')
		endif
		if file == ''
			let file = '[No Name]'
		endif
		let s .= file
		let s .= (i == t ? '%m' : '')
		let i = i + 1
	endwhile
	let s .= '%T%#TabLineFill#%='
	return s
endfunction
set stal=2
set tabline=%!MyTabLine()
endif

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif "for vjde stupid window" 
autocmd InsertLeave * if pumvisible() == 0|pclose|endif 
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"for hardmode"
""autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

"map for changing color scheme"
map <silent><F3> :NEXTCOLOR<cr> 
map <silent><F2> :PREVCOLOR<cr>

"map for fuzzyfinder"
nnoremap <C-f> :FufFile<cr>
"map to open tab"
nnoremap <leader>g :tabnew<CR>

"compile javascript from inside vim"
nnoremap <F6> :w<cr> :! ~/p/phonegap/uMobile/umobile-ui/buildme.sh android<CR>:redraw<CR>


function! MakeCWinHelp()
:echo "c to close
:echo "h for help
endfunction

function! MakeCWinKeyMaps()
:noremap <buffer> <silent> c :cclose<CR>
:noremap <buffer> <silent> h :call MakeCWinHelp()<CR>
endfunction

"nmap <F6> :silent make<CR>:copen<CR>:call MakeCWinKeyMaps()<CR>:redraw!<CR>
"nmap <F7> :silent make <CR>:botright copen<CR>:call MakeCWinKeyMaps()<CR>:redraw!<CR>

"NERDtree"
autocmd vimenter * NERDTree
let g:NERDTreeWinPos = "right"
autocmd VimEnter * wincmd h

"for pathogen"
call pathogen#infect()
map <C-n> :NERDTreeToggle<CR>

"javascript highlighting"

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

"move around windows"
	noremap <silent> <C-h> :wincmd h<cr>
	noremap <silent> <C-j> :wincmd j<cr>
	noremap <silent> <C-k> :wincmd k<cr>
	noremap <silent> <C-l> :wincmd l<cr>

nnoremap<C-down> :m +1<Esc>
nnoremap<C-up> :m -2<Esc>


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
""		syntax reset
""		endif
""		
""		
""		highlight Normal	 term=none cterm=none ctermfg="#4D2F2D" gui=none guibg=black
""		highlight Statement  term=none ctermfg=yellow  cterm=bold guifg=yellow	gui=none
""		highlight Operator	 term=none ctermfg=yellow  cterm=none guifg=yellow	gui=none
""		highlight PreProc	 term=none ctermfg=magenta cterm=bold guifg=magenta gui=none
""		highlight Identifier term=none ctermfg=cyan    cterm=bold guifg=cyan	gui=none
""		highlight Type		 term=none ctermfg=green	cterm=bold guifg=green	  gui=none
""		highlight Special	 term=none ctermfg=cyan    cterm=bold guifg=cyan	gui=none
""		highlight String	 term=none ctermfg=red	  cterm=bold guifg=red	  gui=none
""		highlight Number	 term=none ctermfg=red	  cterm=bold guifg=red	  gui=none
""		highlight Constant	 term=none ctermfg=red	  cterm=bold guifg=red	  gui=none
""		highlight Comment	 term=none ctermfg=blue		cterm=none guifg=blue	  gui=none
	  "
"Added by android-vim:
set tags+=/home/zabador/.vim/tags
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
let g:SuperTabDefaultCompletionType = 'context'
"Added by android-vim:
set tags+=/home/zabador/.vim/tags
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
let g:SuperTabDefaultCompletionType = 'context'
