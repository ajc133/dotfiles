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

    local opts = { noremap=true, silent=true }
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

    local on_attach = function(client, bufnr)
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      local bufopts = { noremap=true, silent=true, buffer=bufnr }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
      vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
      vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
      vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, bufopts)
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
      vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
      vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
    end

    local lsp_flags = {
      debounce_text_changes = 150,
    }

  local servers = {
   'cssls',
   'denols',
   'dockerls',
   'html',
   'rust_analyzer',
   'tsserver',
  }

  require('lspconfig')['bashls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
  }

  require('lspconfig')['gopls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
  }

  require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
  }

  require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
  }

  require('lspconfig')['terraformls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    filetypes = { "terraform", "hcl", "tf" }
  }

  require('lspconfig')['yamlls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    filetypes = { "yaml", "yml" },
    settings = {
      validate = true;
    }
  }


  -- LSP Specific Settings
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
" auto source when writing to init.vm alternatively you can run :source $MYVIMRC
au! BufWritePost $MYVIMRC source %
" Run chezmoi apply whenever you save a dotfile
au! BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply

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
