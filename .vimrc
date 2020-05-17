syntax on
filetype indent on

set nocompatible
set t_Co=256
set nu rnu
set laststatus=2
set ttimeoutlen=50
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
set nowrap

" Easier keybindings for switching panes
let mapleader = " "
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Easier keybindings to switch tabs
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt

" Create new tab
nnoremap <leader>t :tabnew<Space>

" Create new split
nnoremap <leader>s :sp<Space>
nnoremap <leader>v :vsp<Space>

" Autoinsert matching brackets
inoremap ( ()<Esc>i
inoremap { {<CR>}<Esc>O
inoremap [ []<Esc>i

" Vim-Plug plugins
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'ajh17/VimCompletesMe'
Plug 'sainnhe/gruvbox-material'
call plug#end()

" important!! - For gruvbox theme
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
