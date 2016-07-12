

execute pathogen#infect()
" Installed plugins
" * airline
" * airline themes

" Graphic {{{
syntax enable
set t_Co=256
colo pencil
set background=light

set cursorline
set laststatus=2

let &t_SI = "\<Esc>]12;orange\x7"
" Grapics }}}


" Settings {{{
let mapleader = ";"
let g:mapleader = ";"
  
set wildmenu

set noswapfile
set nobackup

set tabstop=4
set shiftwidth=4 

set foldmethod=marker
" Settings }}}


" Controls {{{
imap <leader>;	<C-S-p>
nmap <leader>n	:tabnew<Cr>
map <space> za

map <C-up> :m .-2<CR>==
map <C-down> :m .+1<CR>==
" Controls }}}


" Abbrev {{{
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev WQ wq
cnoreabbr Wq wq
" Abbrev }}}


" Functions {{{

map <leader>. :call LineComment()<CR>
func! LineComment()
	let comm_sym = GetCommentFt()
	let line = getline(".")
	let pos = getpos(".")
	call setpos(".", [0, pos[1], 0, 0])
	if line =~ '^\s*'.comm_sym.".*"
		exec 's/^' . comm_sym . '//'
	else
 		s/^/\=comm_sym
	end
		call setpos(".", pos)
endfunc

func! GetCommentFt()
	let ft = &ft
	if ft == "vim"
		return "\""
	elseif ft == "python" || ft == "perl"
		return "#"
	elseif ft == "c" 
		return "\/\/"
	else
		return "X"
	end
endfunc

" Functions }}}


" Filetypes {{{
au BufRead,BufNewFile *.fish setfiletype sh

" Filetypes }}}


" Plugin:Airline {{{
let g:airline_theme="base16"
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enables = 1
let g:airline_section_z="%l/%L"
" Airline }}}
