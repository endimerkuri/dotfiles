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
set scrolloff=8

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
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

" Git plugin
Plug 'tpope/vim-fugitive'

" Maximizer
Plug 'szw/vim-maximizer'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
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

" Tab autocompletion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

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

" Escape in insert mode when pressing jk
inoremap jk <Esc>

" Create new buffer
nnoremap <leader>t :e<Space>

" Create new split
nnoremap <leader>s :sp<Space>
nnoremap <leader>v :vsp<Space>

" Vim maximizer keybindings
let g:maximizer_set_default_mapping = 0
let g:maximizer_set_mapping_with_bang = 1
nnoremap <leader>m :MaximizerToggle<CR>
vnoremap <leader>m :MaximizerToggle<CR>

" Vim Fugitive keybindings
nmap <leader>gs :G<CR>

" Save and make
nmap <leader>cm :w<CR>:10sp<CR>:terminal make<CR>

" Terminal mode keybindings
:tnoremap <Esc> <C-\><C-n>
:nnoremap <leader>ot :10sp<CR>:terminal<CR>

" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

" Nvim-lsp
nnoremap gd :lua vim.lsp.buf.declaration()<CR>
nnoremap gi :lua vim.lsp.buf.definition()<CR>
nnoremap grr :lua vim.lsp.buf.references()<CR>
nnoremap K :lua vim.lsp.buf.hover()<CR>

lua << EOF
require'lspconfig'.pyls.setup{
    on_attach = on_attach,
    configurationSources = { "pycodestyle", "pyflakes" },
}
require'lspconfig'.texlab.setup{
    on_attach = on_attach,
    settings = {
      bibtex = {
        formatting = {
          lineLength = 120
        }
      },
      latex = {
        build = {
          args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
          executable = "latexmk",
          onSave = true
        },
        forwardSearch = {
          args = {},
          onSave = false
        },
        lint = {
          onChange = false
        }
      }
    }
}
require'lspconfig'.clangd.setup{
    on_attach = on_attach,
}
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
      enable = true,              -- false will disable the whole extension
  },
}
EOF
