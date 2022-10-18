vim.g.mapleader = " "
--------------
-- Mappings --
--------------

-- Convenience
function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

function vmap(shortcut, command)
  map('v', shortcut, command)
end

-- Normal mode mappings

-- TAB in normal mode will move to text buffer
nmap('<TAB>', ':bnext<CR>')
-- SHIFT-TAB will go back
nmap('<S-TAB>', ':bprevious<CR>')
-- Better window navigation (ctrl + vim-direction)
nmap('<C-h>', '<C-w>h')
nmap('<C-j>', '<C-w>j')
nmap('<C-k>', '<C-w>k')
nmap('<C-l>', '<C-w>l')
nmap('<Leader>x', ':bd<cr>')
nmap('<Leader>d', ':wq<CR>')
nmap('<Leader>sv', ':source $MYVIMRC<cr>')
nmap('<Leader>n', ':cn<cr>')
nmap('<Leader>p', ':cp<cr>')


-- Insert mode mappings

-- <TAB>: completion.
imap('<expr><TAB>', 'pumvisible() ? "\\<C-n>" : "\\<TAB>"')
-- Better nav for omnicomplete
imap('<expr><c-j>', '("\\<C-n>")')
imap('<expr><c-k>', '("\\<C-p>")')
-- <TAB>: completion
imap('<expr><TAB>', 'pumvisible() ? "\\<C-n>" : "\\<TAB>"')

-- Visual mode mappings

vmap('<', '<gv')
vmap('>', '>gv')

--------------
-- Settings --
--------------

-- vim.opt.colorscheme = 'desert' ??? 
--vim.cmd('set termguicolors')
vim.cmd('colorscheme gruvbox8')
vim.cmd('set background=dark')
vim.cmd('set hidden')
vim.opt.mouse = 'a'

vim.cmd('set shiftwidth=2')
-- vim.opt.shiftwidth = 2
vim.opt.background = dark
vim.opt.cmdheight = 2
vim.opt.completeopt = {'menuone', 'noselect'}
vim.opt.number = true
vim.opt.updatetime = 50

-- Search options
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.autoindent = true


------------------
-- Autocommands --
------------------

-- Whenever plugins.lua is updated, re-compile
vim.cmd([[
augroup packer_auto_compile
  autocmd!
  autocmd BufWritePost */nvim/lua/plugins.lua source <afile> | PackerCompile
augroup END
]])

-- Dotfile management
-- Run chezmoi apply whenever you save a dotfile
-- Auto source when writing to init.vim alternatively you can run :source $MYVIMRC
vim.cmd([[
augroup dotfiles
  au! BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply
  au! BufWritePost $MYVIMRC source %
augroup END
]])



-- Filetype settings
vim.api.nvim_create_augroup("bufcheck", { clear = true })

-- Golang
vim.api.nvim_create_autocmd("FileType", {
  group = "bufcheck",
  pattern = { "*.go" },
  command = "setlocal ts=4 sw=4 sts=0 noexpandtab" 
})

-- Typescript, Terraform, YAML
vim.api.nvim_create_autocmd("FileType", {
  group = "bufcheck",
  pattern = { "*.ts", "*.tf", "*.yaml", "*.yml"  },
  command = "setlocal ts=2 sw=2 expandtab" 
})


-- Highlight yank
vim.api.nvim_create_autocmd(
    { "TextYankPost" },
    { pattern = { "*" }, command = "lua require'vim.highlight'.on_yank()" }
)

-------------
-- Plugins --
-------------

-- Installs plugins
require('plugins')

-- Configure LSP
require('lsp')


-- Syntax Highlighting
require("nvim-treesitter.configs").setup {
  highlight = {
    -- ...
  },
  -- ...
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
