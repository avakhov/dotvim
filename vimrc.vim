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

" Visual settings for gui
if has("gui_running")
  set guifont=dejavu\ sans\ mono\ 11
  set guioptions-=T
  set lines=35
  set columns=138
  winp 0 0
end

if has("gui_macvim")
  set guifont=Monaco:h16
  set guioptions-=T
  set lines=39
  set columns=138
  winp 0 0
end

" Line numbers
set nonumber
inoremap <silent> <leader>n <C-o>:let &number = !&number<CR>
nnoremap <silent> <leader>n :let &number = !&number<CR>

" Folding
nmap <leader>s :set foldmethod=syntax<cr>:set foldlevel=1<cr>
nmap <leader>m :set foldmethod=manual<cr>zR<cr>

" Open new window or tab
nmap <leader>c :tabedit %<cr>

" NERD tree
nmap <leader>t :NERDTreeToggle<cr>
let NERDTreeShowHidden=1

" CtrlP
nmap <leader>p :CtrlP<cr>
nmap <leader>m :CtrlPMRU<cr>
nmap <leader>b :CtrlPBuffer<cr>

" remember cursor line (see /etc/vim/vimrc)
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Search by typical rails project
command! -nargs=1 Fi :vim <args> app/** lib/** test/** spec/** config/**/*.rb config/**/*.yml db/migrate/** extras/**
