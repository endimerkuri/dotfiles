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
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader><Tab> <Plug>AirlineSelectNextTab
nmap <leader><S-Tab> <Plug>AirlineSelectPrevTab

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
    Plug 'preservim/nerdtree'
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
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
            \ '0': '0 ',
            \ '1': '1 ',
            \ '2': '2 ',
            \ '3': '3 ',
            \ '4': '4 ',
            \ '5': '5 ',
            \ '6': '6 ',
            \ '7': '7 ',
            \ '8': '8 ',
            \ '9': '9 '
            \}

" ALE config
let g:ale_completion_enabled = 1
nnoremap gd :ALEGoToDefinition<CR>

" NERDTree config
nnoremap <leader>f :NERDTreeToggle<CR>

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Tab autocompletion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>"
