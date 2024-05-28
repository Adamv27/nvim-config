set nu rnu                  " show line numbers
set nocompatible			" disable compatibility to old vi
set tabstop=4				" Number of columns per tab
set softtabstop=4			" See multiple spaces as tabstops
set expandtab
set shiftwidth=4
set autoindent
set cc=80					" 80 column border
set clipboard=unnamedplus	" use system clipboard
set hlsearch				" highlight search
set incsearch				" increamental search
set cursorline				" Underline current cursor line
set nohlsearch
set noswapfile				" disable creating swap file
set nowrap
set termguicolors
set updatetime=300

autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype css setlocal ts=2 sw=2 expandtab
autocmd Filetype js setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
autocmd Filetype json setlocal ts=2 sw=2 expandtab
autocmd Filetype javascriptreact setlocal ts=2 sw=2 expandtab


filetype plugin on


call plug#begin("~/.nvim/plugged")
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', {'tag': '0.1.3'}
    Plug 'honza/vim-snippets'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'kosayoda/nvim-lightbulb'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'akinsho/bufferline.nvim', {'tag': '*'}
    Plug 'abecodes/tabout.nvim'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'jinh0/eyeliner.nvim'
call plug#end()

colorscheme catppuccin-frappe

let mapleader = "\<Space>"

" Find files using Telescope commands
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Configure Coc
inoremap <expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<C-d>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"


nmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)


" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else 
        call feedkeys('K', 'in')
    endif
endfunction


" Buffer navigation
nnoremap <leader><leader> <cmd>:w<cr>   " Save 
nnoremap <Tab> <cmd>:bn<cr>             " Next buffer
nnoremap <S-Tab> <cmd>:bp<cr>           " Previous buffer
nnoremap <leader>x <cmd>:bdelete<cr>    " Delete buffer


" lualine configuration
lua << END
require('lualine').setup()

require('nvim-lightbulb').setup({
    autocmd = { enabled = true }
})

require('nvim-treesitter.configs').setup {
    ensure_installed = {'c', 'lua', 'vim', 'vimdoc', 'query'},
    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true
    }
}

require('bufferline').setup()

require("colorizer").setup()

require("eyeliner").setup({
    highlight_on_key = true
})

END


