set nocompatible
syntax on
let g:pymode_python = 'python3'


" Backup and swap
set noswapfile
set nobackup
set nowritebackup
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Pathogen and basic settings
let g:pathogen_disabled = []
if exists('$NO_COPILOT')
  call add(g:pathogen_disabled, 'copilot.vim')
endif
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
set wh=1
colorscheme custom
set laststatus=2
set fileformats=unix,dos
set cmdheight=2
filetype off
filetype indent on
filetype plugin on
filetype plugin indent on

" UltiSnips
"
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


" CtrlP
let g:ctrlp_open_new_file = 'r'
nmap <C-i> :CtrlPBuffer<cr>

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
  set lines=34
  set columns=130
  winp 1 1
end
if has("gui_macvim")
  set guifont=Monaco:h16
end

" I like PostgreSQL
let g:sql_type_default = 'pgsql'

" remember cursor line (see /etc/vim/vimrc)
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Search in typical rails project
command! -nargs=1 Fi :vim <args> app/assets/javascripts/** app/assets/stylesheets/** app/[b-z]*/** test/** spec/** config/** db/migrate/** lib/** doc/**

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

" Crazy MacVim
set visualbell t_vb=

" ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" redraw!
command! Rd redraw!

" leaders
nmap <leader>b :EasyBuffer<cr>
nmap <leader>t :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
nmap <leader>n :tabnew<cr>
 
