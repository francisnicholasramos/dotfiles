let mapleader = " "

let g:netrw_banner = 0 

set number
set relativenumber
set hlsearch
set nowrap
set autoindent
set smartindent
set expandtab
set shiftwidth=4
set tabstop=4
set cursorline
set splitright
set splitbelow
set wildmode=longest:full,full
set wildmenu
set wildoptions=pum
set termguicolors
set noswapfile 
set mouse=a
set encoding=utf-8
set incsearch
set nocompatible
set belloff=all
set switchbuf=useopen,usetab 
set laststatus=2
set smartcase
set ignorecase
set showmatch
set signcolumn=yes 
set path+=**
set background=dark

syntax on
syntax enable 
filetype plugin indent on
autocmd FileType netrw setlocal relativenumber number

" Key mappings
nnoremap <Leader>w :w<CR>
nnoremap <Leader>ww :source $MYVIMRC<CR>
nnoremap <Leader>qq :wq!<CR>
nnoremap <Leader>q :q<CR>
nnoremap <silent> <Esc> :nohlsearch<CR><Esc>
nnoremap ; :
nnoremap cf :edit $MYVIMRC<CR>
nnoremap <Leader>a ggVG
nnoremap <Leader>d :bd<CR>
nnoremap <Tab> <C-w>
nnoremap <Leader>s :split<CR>
nnoremap <Leader>v :vsplit<CR>
nnoremap <Leader>t :terminal<CR>
nnoremap <Leader>ff :find <CR>
nnoremap <Leader><Leader> :b<Space>
nnoremap <Leader>rf :browse oldfiles<CR>
nnoremap <Leader>gr :vimgrep<Space>
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap <silent> <Leader>e :call ToggleNetrw()<CR>
vnoremap y myy`y
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap y "+y
nnoremap yy "+yy
nnoremap dd "+dd
vnoremap d "+d
nnoremap D "+d
vnoremap y "+y
nnoremap p "+p
vnoremap p "+p
nnoremap <C-Up> :resize +1<CR>
nnoremap <C-Down> :resize -1<CR>
nnoremap <C-Left> :vertical resize -1<CR>
nnoremap <C-Right> :vertical resize +1<CR>
tnoremap <Esc> <C-\><C-n>

function! ToggleNetrw()
  if &filetype ==# 'netrw'
    b#
  else 
    Ex
  endif
endfunction

colorscheme groove-box
colorscheme habamax





