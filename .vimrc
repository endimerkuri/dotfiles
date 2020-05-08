set nocompatible
set t_Co=256
set nu rnu
set laststatus=2
set ttimeoutlen=50
syntax on
filetype indent on
set smartindent
set incsearch
set nohlsearch
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set wildmenu
set splitbelow splitright
set ruler

" Easier keybindings for switching panes
let mapleader = " "
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" autoinsert matching brackets
inoremap ( ()<Esc>i
inoremap { {<CR>}<Esc>O
inoremap [ []<Esc>i

" vim gruvbox theme
call plug#begin('~/.vim/plugged')
Plug 'sainnhe/gruvbox-material'
call plug#end()

" important!!
if has('termguicolors')
  set termguicolors
endif

" for dark version
set background=dark

" set contrast
" this configuration option should be placed before `colorscheme gruvbox-material`
" available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_palette = 'original'
colorscheme gruvbox-material

" lightline gruvbox theme
let g:lightline = {'colorscheme' : 'gruvbox_material'}
