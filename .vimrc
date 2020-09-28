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
nnoremap <leader>q :wincmd q<CR>

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
inoremap { {}<Esc>i
inoremap [ []<Esc>i

" Vim-Plug plugins
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'ajh17/VimCompletesMe'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
call plug#end()

if has('termguicolors')
	set termguicolors
endif

autocmd vimenter * colorscheme gruvbox
autocmd vimenter * AirlineTheme gruvbox
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_termcolors=256

set background=dark
" Tabline with airline
let g:airline#extensions#tabline#enabled = 1
