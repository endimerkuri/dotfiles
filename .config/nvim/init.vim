" Download plugins automatically
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

set nu rnu
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set smartindent
set nohlsearch
set splitbelow splitright
set nowrap

if has('termguicolors')
    set termguicolors
endif

call plug#begin(stdpath('data') . '/plugged')
    "UI plugins
    Plug 'mhinz/vim-startify'
    Plug 'morhetz/gruvbox'
    Plug 'vim-airline/vim-airline'
    Plug 'lambdalisue/fern-renderer-devicons.vim'
    Plug 'ryanoasis/vim-devicons'
    " Helpful
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-commentary'
    Plug 'jiangmiao/auto-pairs'
    " File tree drawer
    Plug 'lambdalisue/fern.vim'
    " LSP client
    Plug 'dense-analysis/ale'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    " Git plugin
    Plug 'tpope/vim-fugitive'
    " Cpp syntax highlighting
    Plug 'bfrg/vim-cpp-modern'
call plug#end()

" Gruvbox color theme
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_termcolors=256
colorscheme gruvbox

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
" let g:ale_completion_enabled = 1
nnoremap gd :ALEGoToDefinition<CR>

" Deoplete config
let g:deoplete#enable_at_startup=1
call deoplete#custom#option('sources', {
            \'_': ['ale', 'file', 'buffer'],
            \})

" Tab autocompletion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>"

" Easier keybindings for switching panes
let mapleader = " "
nnoremap <leader>w <C-w>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>d :bd<CR>
nnoremap <leader>q :q<CR>

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

" Fern config
let g:fern#renderer = "devicons"
nnoremap <leader>f :Fern . -drawer -toggle<CR>
" Similar keybindings to lf
function! s:init_fern() abort
  nmap <buffer> ov <Plug>(fern-action-open:vsplit)
  nmap <buffer> os <Plug>(fern-action-open:split)
  nmap <buffer> zh <Plug>(fern-action-hidden)
  nmap <buffer> r <Plug>(fern-action-rename)
  nmap <buffer> d <Plug>(fern-action-clipboard-move)
  nmap <buffer> p <Plug>(fern-action-clipboard-paste)
  nmap <buffer> y <Plug>(fern-action-clipboard-copy)
  " cd into the directory when pressing enter or backspace
  nmap <buffer> <Plug>(fern-my-enter-and-tcd)
        \ <Plug>(fern-action-enter)
        \ <Plug>(fern-wait)
        \ <Plug>(fern-action-tcd:root)

  nmap <buffer> <Plug>(fern-my-leave-and-tcd)
        \ <Plug>(fern-action-leave)
        \ <Plug>(fern-wait)
        \ <Plug>(fern-action-tcd:root)
  nmap <buffer> <CR> <Plug>(fern-my-enter-and-tcd)
  nmap <buffer> <BS> <Plug>(fern-my-leave-and-tcd)
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

" Create new buffer
nnoremap <leader>t :e<Space>

" Create new split
nnoremap <leader>s :sp<Space>
nnoremap <leader>v :vsp<Space>

" Vim Fugitive keybindings
nmap <leader>gs :G<CR>

" Save and Compile latex keybinding
nmap <leader>cl :w<CR>:!latexmk -pdf -f -silent<CR>

" Terminal mode keybindings
:tnoremap <Esc> <C-\><C-n>
:nnoremap <leader>ot :10sp<CR>:term<CR>
