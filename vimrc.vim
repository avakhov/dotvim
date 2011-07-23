set nocompatible
syntax on

" backup&swap
set noswapfile
set nobackup
set nowritebackup

call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
set wh=1
colorscheme custom
set laststatus=2
set fileformats=unix,dos
set cmdheight=1
filetype off
filetype plugin on
filetype plugin indent on

" insert empty lines in normal mode (like o, O)
nnoremap - o<esc>
nnoremap _ O<esc>

" auto save
set autowrite
set autowriteall

" search options
set is
set hls
set ic

" tab options
set tabstop=2
set shiftwidth=2
set et

" Line numbers
set nonumber
inoremap <silent> <F4> <C-o>:let &number = !&number<CR>
nnoremap <silent> <F4> :let &number = !&number<CR>

" open new window or tab
nmap <F9> :tabnew<Return>
nmap <F11> <C-W>n

" Use CTRL-S for file saving
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR><Esc>

if has("gui_running")
  set guifont=dejavu\ sans\ mono\ 11
  set guioptions-=T
  if hostname() == 'mama-ubuntik'
    set lines=39
  else
    set lines=35
    set columns=138
  end
  winp 0 0
end

" system ruby gems path
command! Lcd :lcd /usr/local/lib/ruby/gems/1.8/gems/

" NERD tree
nmap <F5> :NERDTreeToggle<cr>
vmap <F5> <esc>:NERDTreeToggle<cr>i
imap <F5> <esc>:NERDTreeToggle<cr>i
let NERDTreeShowHidden=1

" execute current ruby script
nmap <F6> :!ruby %<cr>
imap <F6> <esc>:!ruby %<cr>

" vim-git mapping
nmap <F7> <Leader>gs
nmap <F7> <esc><Leader>gs
nmap <F8> <Leader>gd
nmap <F8> <esc><Leader>gd

" to cursor line position (see /etc/vim/vimrc)
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" set full file info [http://www.vim.org/tips/tip.php?tip_id=145]
set statusline=%<%f%h%m%r\ %.40{getcwd()}%=%{&ff}\ %l,%c%V\ %P 

" Search by rails project
command! -nargs=1 Fi :vim <args> app/** lib/** test/** config/**/*.rb config/**/*.yml db/migrate/** public/javascripts/** public/stylesheets/**
