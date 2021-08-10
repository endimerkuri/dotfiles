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
set signcolumn=yes

if has('termguicolors')
    set termguicolors
endif

call plug#begin(stdpath('data') . '/plugged')
"UI plugins
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'lambdalisue/nerdfont.vim'

" Helpful
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'

" LSP client
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" Debugger
Plug 'puremourning/vimspector'

" Git plugin
Plug 'tpope/vim-fugitive'
Plug 'idanarye/vim-merginal'
Plug 'airblade/vim-gitgutter'

" Maximizer
Plug 'szw/vim-maximizer'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" VimWiki
Plug 'vimwiki/vimwiki'

" Database
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

" Vim vinegar
Plug 'tpope/vim-vinegar'

" UndoTree
Plug 'mbbill/undotree'
call plug#end()

" Gruvbox color theme
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_termcolors=256
colorscheme gruvbox

" Vimwiki configuration
let g:vimwiki_folding='expr'

" Startify configuration
let g:startify_session_autoload = 1

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
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true

" Avoid showing message extra message when using completion
set shortmess+=c

" Easier keybindings for switching panes
let mapleader = " "
nnoremap <leader>w <C-w>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>bd :bd<CR>
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
nmap <leader>gb :MerginalToggle<CR>
let g:gitgutter_enabled = 1

" Save and make
nmap <leader>cm :w<CR>:10sp<CR>:terminal make<CR>

" Terminal mode keybindings
:tnoremap <Esc> <C-\><C-n>
:nnoremap <leader>ot :10sp<CR>:terminal<CR>

" Nvim-lsp
nnoremap gi :lua vim.lsp.buf.declaration()<CR>
nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap grr :lua vim.lsp.buf.references()<CR>
nnoremap K :lua vim.lsp.buf.hover()<CR>

" Debugger
nnoremap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>
nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

" Fuzzy finder
nnoremap <leader>f :Files<CR>

" UndoTree
nnoremap <leader>u :UndotreeToggle<CR>

" DBUI
let g:db_ui_win_position='right'
let g:db_ui_use_nerd_fonts=1
let g:db_ui_auto_execute_table_helpers=1
nnoremap <leader>od :DBUIToggle<CR>
let g:db_ui_icons={
            \ 'expanded': {
                \     'db': '▾  ',
                \     'buffers': '▾  ',
                \     'saved_queries': '▾  ',
                \     'schemas': '▾  ',
                \     'schema': '▾ פּ ',
                \     'tables': '▾ 藺 ',
                \     'table': '▾  ',
                \     },
                \ 'collapsed': {
                    \     'db': '▸  ',
                    \     'buffers': '▸  ',
                    \     'saved_queries': '▸  ',
                    \     'schemas': '▸  ',
                    \     'schema': '▸ פּ ',
                    \     'tables': '▸ 藺 ',
                    \     'table': '▸  ',
                    \     },
                    \ 'saved_query': ' ',
                    \ 'new_query': '璘 ',
                    \ 'tables': '離 ',
                    \ 'buffers': '﬘ ',
                    \ 'add_connection': ' ',
                    \ 'connection_ok': '✓ ',
                    \ 'connection_error': '✕ ',
                    \ }

lua << EOF
require'lspconfig'.pylsp.setup{
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
require'lspconfig'.tsserver.setup{}
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
      enable = true,              -- false will disable the whole extension
  },
}
EOF
