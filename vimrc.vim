set nocompatible
syntax on

" Backup and swap
set noswapfile
set nobackup
set nowritebackup

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

" Insert empty lines in normal mode
nnoremap - o<esc>
nnoremap _ O<esc>

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

" Line numbers
set nonumber
inoremap <silent> <F4> <C-o>:let &number = !&number<CR>
nnoremap <silent> <F4> :let &number = !&number<CR>

" Folding
nmap <F6> :set foldmethod=syntax<cr>:set foldlevel=1<cr>
nmap <F7> :set foldmethod=manual<cr>zR<cr>

" Open new window or tab
nmap <F9> :tabedit %<cr>
nmap <F11> :split<cr>

" Visual settings for gui
if has("gui_running")
  set guifont=dejavu\ sans\ mono\ 11
  set guioptions-=T
  set lines=35
  set columns=138
  winp 0 0
end

" NERD tree
nmap <F5> :NERDTreeToggle<cr>
vmap <F5> <esc>:NERDTreeToggle<cr>i
imap <F5> <esc>:NERDTreeToggle<cr>i
let NERDTreeShowHidden=1

" remember cursor line (see /etc/vim/vimrc)
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" set full file info [http://www.vim.org/tips/tip.php?tip_id=145]
set statusline=%<%f%h%m%r\ %.40{getcwd()}%=%{&ff}\ %l,%c%V\ %P 

" Search by typical rails project
command! -nargs=1 Fi :vim <args> app/** lib/** test/** spec/** config/**/*.rb config/**/*.yml db/migrate/** extras/**
