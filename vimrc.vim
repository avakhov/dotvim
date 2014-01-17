set nocompatible
syntax on

" Backup and swap
set noswapfile
set nobackup
set nowritebackup

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Pathogen and basic settings
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
set wh=1
colorscheme custom
set laststatus=2
set fileformats=unix,dos
set cmdheight=1
filetype off
filetype indent on
filetype plugin on
filetype plugin indent on

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" CtrlP
let g:ctrlp_open_new_file = 'r'

" Auto save
set autowrite
set autowriteall

" Search options
set is
set hls
set ic

" Tab options
set tabstop=2
set shiftwidth=2
set et

" Insert empty lines in normal mode
nnoremap - o<esc>
nnoremap _ O<esc>

" Visual settings for gui
if has("gui_running")
  set guifont=dejavu\ sans\ mono\ 11
  set guioptions-=T
  set lines=39
  set columns=138
  winp 0 0
end
if has("gui_macvim")
  set guifont=Monaco:h16
end

" Open new tab
nmap <leader>c :tabedit %<cr>

" NERD tree
nmap <leader>t :NERDTreeToggle<cr>
let NERDTreeShowHidden=1

" remember cursor line (see /etc/vim/vimrc)
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Search in typical rails project
command! -nargs=1 Fi :vim <args> app/** test/** spec/** config/** db/migrate/**

" Open file on linenumber
function! s:gotoline()
  let file = bufname("%")
  if (filereadable(file))
    return
  endif

  let names =  matchlist( file, '\(.\{-1,}\):\(\d\+\)')
  if empty(names)
    return
  endif

  let file_name = names[1]
  let line_num  = names[2] == ''? '0' : names[2]

  if filereadable(file_name)
    exec "edit " . file_name
    exec ":" . line_num
  endif
endfunction

autocmd! BufNewFile *:* nested call s:gotoline()
autocmd! BufRead *:* nested call s:gotoline()


" BufOnly.vim  -  Delete all the buffers except the current/named buffer.
"
" Copyright November 2003 by Christian J. Robinson <infynity@onewest.net>
"
" Distributed under the terms of the Vim license.  See ":help license".
"
" Usage:
"
" :Bonly / :BOnly / :Bufonly / :BufOnly [buffer] 
"
" Without any arguments the current buffer is kept.  With an argument the
" buffer name/number supplied is kept.

command! -nargs=? -complete=buffer -bang Bonly
    \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang BOnly
    \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang Bufonly
    \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang BufOnly
    \ :call BufOnly('<args>', '<bang>')

function! BufOnly(buffer, bang)
	if a:buffer == ''
		" No buffer provided, use the current buffer.
		let buffer = bufnr('%')
	elseif (a:buffer + 0) > 0
		" A buffer number was provided.
		let buffer = bufnr(a:buffer + 0)
	else
		" A buffer name was provided.
		let buffer = bufnr(a:buffer)
	endif

	if buffer == -1
		echohl ErrorMsg
		echomsg "No matching buffer for" a:buffer
		echohl None
		return
	endif

	let last_buffer = bufnr('$')

	let delete_count = 0
	let n = 1
	while n <= last_buffer
		if n != buffer && buflisted(n)
			if a:bang == '' && getbufvar(n, '&modified')
				echohl ErrorMsg
				echomsg 'No write since last change for buffer'
							\ n '(add ! to override)'
				echohl None
			else
				silent exe 'bdel' . a:bang . ' ' . n
				if ! buflisted(n)
					let delete_count = delete_count+1
				endif
			endif
		endif
		let n = n+1
	endwhile

	if delete_count == 1
		echomsg delete_count "buffer deleted"
	elseif delete_count > 1
		echomsg delete_count "buffers deleted"
	endif

endfunction
