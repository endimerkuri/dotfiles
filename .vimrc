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
set expandtab
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
nnoremap <leader>d :bd<CR>
nnoremap <leader>q :wq<CR>

" Easier keybindings to switch buffers
nnoremap <leader><Tab> :bnext<CR>
nnoremap <leader>1 :b1<CR>
nnoremap <leader>2 :b2<CR>
nnoremap <leader>3 :b3<CR>
nnoremap <leader>4 :b4<CR>
nnoremap <leader>5 :b5<CR>
nnoremap <leader>6 :b6<CR>
nnoremap <leader>7 :b7<CR>
nnoremap <leader>8 :b8<CR>
nnoremap <leader>9 :b9<CR>

" Create new buffer
nnoremap <leader>t :e<Space>

" Create new split
nnoremap <leader>s :sp<Space>
nnoremap <leader>v :vsp<Space>

" Vim-Plug plugins
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    Plug 'morhetz/gruvbox'
    Plug 'vim-airline/vim-airline'
    Plug 'JuliaEditorSupport/julia-vim'
    Plug 'tpope/vim-commentary'
    Plug 'jiangmiao/auto-pairs'
    Plug 'mhinz/vim-startify'
    " LSP client
    Plug 'dense-analysis/ale'
call plug#end()

if has('termguicolors')
    set termguicolors
endif

" Gruvbox color theme
autocmd vimenter * colorscheme gruvbox
autocmd vimenter * AirlineTheme gruvbox
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_termcolors=256
set background=dark

" Tabline with airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" ALE config
let g:ale_completion_enabled = 1
nnoremap gd :ALEGoToDefinition<CR>

" Tab autocompletion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
