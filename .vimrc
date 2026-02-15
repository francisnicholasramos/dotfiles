let mapleader = " "

let g:netrw_banner = 0

set nu
set relativenumber
set hlsearch
set nowrap
set autoindent
set smartindent
set expandtab
set shiftwidth=4
set tabstop=4
set splitright
set splitbelow
set wildmode=longest:full,full
set wildmenu
" set wildoptions=pum
set noswapfile 
set mouse=a
set encoding=utf-8
set incsearch
set nocompatible
set belloff=all
set switchbuf=useopen,usetab 
set smartcase 
set ignorecase
set showmatch
set path+=**
set spelllang=en
set background=light

filetype plugin indent on
autocmd FileType netrw setlocal relativenumber number

" Key mappings
nnoremap <Leader>ww :source $MYVIMRC<CR>
nnoremap <leader>c :!gcc % -o %< <CR>
nnoremap <Leader>qq :wq!<CR>
nnoremap <Leader>q :q<CR>
nnoremap <silent> <Esc> :nohlsearch<CR><Esc>
nnoremap ; :
nnoremap <Leader><Tab> <C-6>
nnoremap cf :edit $MYVIMRC<CR>
nnoremap <Leader>a ggVG
nnoremap <Leader>d :bd<CR>
nnoremap <Tab> <C-w>
nnoremap <Leader>s :split<CR>
nnoremap <Leader>v :vsplit<CR>
nnoremap <Leader>t :term<CR>
nnoremap <Leader>ff :find<Space>
nnoremap <leader><leader> :b<Space>
nnoremap <Leader>rf :browse oldfiles<CR>
nnoremap <Leader>rg :vimgrep<Space>/
nnoremap <Leader>co :copen<CR>
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap <silent> <Leader>e :call ToggleNetrw()<CR>
vnoremap y myy`y

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <C-Up> :resize +1<CR>
nnoremap <C-Down> :resize -1<CR>
nnoremap <C-Left> :vertical resize -1<CR>
nnoremap <C-Right> :vertical resize +1<CR>

tnoremap <Esc> <C-\><C-n> 
inoremap <Esc><BS> <C-w>

nnoremap <Tab>j :cnext<CR>
nnoremap <Tab>k :cprev<CR>

inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

nnoremap <C-k> :resize +1<CR>
nnoremap <C-j> :resize -1<CR>
nnoremap <C-h> :vertical resize -1<CR>
nnoremap <C-l> :vertical resize +1<CR>

vnoremap <Leader>y "+y
nnoremap <Leader>yy "+yy
nnoremap <Leader>p "+p
vnoremap <Leader>p "+p

function! ToggleNetrw()"
  if &filetype ==# 'netrw'
    b#
  else 
    Ex
  endif
endfunction

autocmd BufRead,BufNewFile *.ejs set filetype=html  


