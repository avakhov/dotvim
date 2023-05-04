set nocompatible
syntax on

" colors
set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
hi link htmlTag                     xmlTag
hi link htmlTagName                 xmlTagName
hi link htmlEndTag                  xmlEndTag
highlight Comment                   guifg=#0066ff
highlight Normal                    guifg=#000000 guibg=#ddeedd
highlight Cursor                    guifg=#ffffff guibg=#000000 
highlight CursorLine                guibg=#ccddcc
highlight Constant                  guifg=#c5060b gui=bold
highlight Define                    guifg=#0000ff gui=bold
highlight Function                  guifg=#3c4c72 gui=bold
highlight Identifier                guifg=#318495
highlight Include                   guifg=#0000ff gui=bold
highlight rubyClass                 guifg=#0000ff gui=bold
highlight Number                    guifg=#0000cd
highlight Visual                    guibg=#ffa275
highlight LineNr                    guifg=#2B2B2B ctermfg=159 guibg=#C0C0FF
hi StatusLine	                      guifg=black guibg=#7788ff gui=bold
hi StatusLineNC	                    guifg=black guibg=#aaaaaa gui=bold
highlight Title                     guifg=#bb4422 ctermfg=15
hi VertSplit	gui=none	guifg=black	guibg=#aaccaa
highlight Folded guibg=#ddeedd guifg=blue ctermbg=none ctermfg=green cterm=none
highlight FoldColumn guibg=darkgrey guifg=white

" backup and swap
set noswapfile
set nobackup
set nowritebackup
" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" basic settins
set wh=1
set laststatus=2
set fileformats=unix,dos
set cmdheight=1
filetype off
filetype indent on
filetype plugin on
filetype plugin indent on

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

" I like PostgreSQL
let g:sql_type_default = 'pgsql'

" leaders
nmap <leader>t :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
nmap <leader>n :tabnew<cr>
