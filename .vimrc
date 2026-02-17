let mapleader = " "

let g:netrw_banner = 0

" set nu
" set rnu
set hls " FZF VIM
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader><Leader> :Buffers<CR>
nnoremap <Leader>rf :History<CR>
nnoremap <Leader>rg :RG<CR>
set nowrap
set autoindent
set smartindent
set expandtab
set sw=4
set ts=4
set splitright
set splitbelow
set wildmode=longest:full,full
set wildmenu
set wildoptions=pum
set noswapfile 
set mouse=a
set incsearch
set nocompatible
set belloff=all
set switchbuf=useopen,usetab 
set smartcase 
set ignorecase
set showmatch
set shortmess-=S
set laststatus=2
set path+=**
set background=light
" set termguicolors

syntax on
syntax enable
filetype plugin indent on
autocmd FileType netrw setlocal rnu nu

" Key mappings
nnoremap ; :
nnoremap cf :edit $MYVIMRC<CR>
nnoremap <leader>c :!gcc % -o %< <CR>
nnoremap <silent> <Esc> :nohlsearch<CR><Esc>
nnoremap <Leader><Tab> <C-6>
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

" tnoremap <Esc> <C-\><C-n>  " escape and switch from terminal
inoremap <Esc><BS> <C-w>

nnoremap <Esc>j :cnext<CR>
nnoremap <Esc>k :cprev<CR>

nnoremap <C-k> :resize +1<CR>
nnoremap <C-j> :resize -1<CR>
nnoremap <C-h> :vertical resize -1<CR>
nnoremap <C-l> :vertical resize +1<CR>

" vnoremap <Leader>y "+y
" nnoremap <Leader>yy "+yy
" nnoremap <Leader>p "+p
" vnoremap <Leader>p "+p

function! ToggleNetrw()
  if &filetype ==# 'netrw'
    b#
  else 
    Ex
  endif
endfunction

autocmd BufRead,BufNewFile *.ejs set filetype=html  

autocmd BufRead,BufNewFile *.css,*.json, setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

hi LineNr ctermfg=239
hi String ctermfg=3
hi Visual ctermbg=235
hi MatchParen ctermfg=97 ctermbg=238 cterm=bold
hi Comment cterm=italic gui=italic
hi Todo ctermfg=97 ctermbg=NONE cterm=bold
hi StatusLine ctermbg=236 ctermfg=246 cterm=NONE
hi StatusLineNC ctermbg=236 ctermfg=244 cterm=NONE
hi VertSplit ctermbg=244 ctermfg=236
hi Search ctermbg=NONE ctermbg=0
hi SignColumn ctermbg=234 guibg=NONE
hi Pmenu        ctermbg=236 ctermfg=248
hi PmenuSel     ctermbg=109 ctermfg=237 cterm=bold
hi PmenuSbar    ctermbg=237
hi PmenuThumb   ctermbg=244
