set nocompatible

" leader key
let g:mapleader = ' '

call plug#begin('~/.config/nvim/plugged')

  " Color schemes
  Plug 'altercation/vim-colors-solarized'
  Plug 'morhetz/gruvbox'

  " LSP and auto-complete
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'

  " Git wrapper: https://vimawesome.com/plugin/fugitive-vim. ':help fugitive'
  Plug 'tpope/vim-fugitive'

  " FZF: https://github.com/junegunn/fzf.vim
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  Plug 'kien/rainbow_parentheses.vim'
  Plug 'tpope/vim-commentary'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" ----------------------- Plugin Settings ----------------------------------------

" FZF
function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

nnoremap <leader>ff <cmd>GFiles<cr>
nnoremap <leader>fg <cmd>RG<cr>
nnoremap <leader>fb <cmd>Buffers<cr>
let g:fzf_buffers_jump = 1

" Git - vim-fugitive

nnoremap <leader>gb <cmd>Git blame<cr>

" --------------------------------------------------------------------------------

if has('termguicolors')
  set termguicolors
endif

set background=dark
colorscheme solarized

set nu 
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set cmdheight=2
set updatetime=50
set signcolumn=yes
set hidden

" Text wrap and indentation
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround
set autoindent
set smartindent
set scrolloff=4
set textwidth=0


" Search options
set nohlsearch
set ignorecase
set smartcase

set mouse=a

" Security
set modelines=0
set noswapfile
set nobackup
set nowb
set confirm



"------------------------------ Mappings ----------------------------"
"
" Normal mode mappings
"
" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" Better window navigation (ctrl + vim-direction)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>x <cmd>bd<cr>

"
" Insert mode mappings
"
"nnoremap <Leader>d :wq<CR>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

"
" Visual mode mappings
"
" Better tabbing
vnoremap < <gv
vnoremap > >gv

"--------------------------------------------------------------------"

" -------------------- LSP ---------------------------------
:lua << EOF
  local nvim_lsp = require('lspconfig')

  local on_attach = function(client, bufnr)
    require('completion').on_attach()

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Generic Mappings
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<Leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<Leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<Leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<Leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<Leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<Leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    end

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        require('lspconfig').util.nvim_multiline_command [[
        :hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
        :hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
        :hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
        augroup lsp_document_highlight
            autocmd!
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]]
    end
  end

  local servers = {
   'bashls',
   'cssls',
   'denols',
   'dockerls',
   'gopls',
   'html',
   'pyright',
   'rust_analyzer',
   'terraformls',
   'tsserver',
   'yamlls'
  }
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
    }
  end

  -- LSP Specific Settings
  nvim_lsp.terraformls.setup{
    filetypes = { "terraform", "hcl", "tf" }
  }
  nvim_lsp.yamlls.setup{
    filetypes = { "yaml", "yml" },
    cmd = { "node",
            "/home/aj/workspace/src/github.com/redhat-developer/yaml-language-server/out/server/src/server.js",
            "--stdio"},
    settings = {
      validate = true;
    }
  }
EOF

" Completion
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" -------------------- LSP ---------------------------------


augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

autocmd TermOpen * setlocal nonumber norelativenumber
autocmd CmdwinEnter [:] startinsert
au! BufWritePost $MYVIMRC source %  " auto source when writing to init.vm alternatively you can run :source $MYVIMRC
autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path "%"  " Run chezmoi apply whenever you save a dotfile

" Custom color stuff
highlight Pmenu guibg=bg ctermbg=bg
highlight Pmenu guifg=Green ctermfg=Green
highlight PmenuSel guibg=Purple ctermbg=DarkMagenta
highlight PmenuSel guifg=Red ctermfg=Red
highlight! link Visual Cursorline

autocmd Filetype go setlocal ts=4 sw=4 sts=0 noexpandtab
autocmd Filetype typescript setlocal ts=2 sw=2 expandtab
autocmd Filetype terraform setlocal ts=2 sw=2 expandtab
autocmd Filetype tf setlocal ts=2 sw=2 expandtab
autocmd FileType yaml setlocal keywordprg='ansible-doc'
autocmd FileType yaml setlocal ts=2 sw=2 expandtab

nnoremap <leader>ff <cmd>GFiles<cr>
nnoremap <leader>u <cmd>'<,'>s/["${}]//g<CR>
