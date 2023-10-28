local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
local uv = vim.uv or vim.loop

-- Auto-install lazy.nvim if not present
if not uv.fs_stat(lazypath) then
  print('Installing lazy.nvim....')
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
  print('Done.')
end

vim.opt.rtp:prepend(lazypath)


--------------
-- Settings --
--------------

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.hidden = true
vim.opt.mouse = "a"
vim.opt.hidden = true

vim.opt.cmdheight = 1
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.number = true
vim.opt.updatetime = 50
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scrolloff = 8

-- Search options
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Indentation
vim.opt.autoindent = true

vim.opt.list = true
vim.opt.listchars = { tab = "> ", trail = "·", nbsp = "+" }

vim.g.mapleader = " "

-- Convenience
local function map(mode, shortcut, command)
  vim.keymap.set(mode, shortcut, command, { noremap = true, silent = true })
end

local function nmap(shortcut, command)
  map("n", shortcut, command)
end

local function imap(shortcut, command)
  map("i", shortcut, command)
end

local function vmap(shortcut, command)
  map("v", shortcut, command)
end

local function tmap(shortcut, command)
  map("t", shortcut, command)
end
-- Normal mode mappings
nmap("<TAB>", ":bnext<CR>")                -- TAB to next buffer
nmap("<S-TAB>", ":bprevious<CR>")          -- Shift + TAB to prev buffer
nmap("<C-s>", ":write<cr>")                -- Save
nmap("<Leader>c", "<C-w>c")                -- Close window
nmap("<Leader>d", '"_d')                   -- Blackhole register
nmap("<Leader>p", "$p<cr>")                -- Paste to end of line
nmap("<Leader>s", ":%s/\\<<C-r><C-w>\\>/") -- Search-replace word in file
nmap("<Leader>x", ":bdelete<cr>")          -- Close buffer
nmap("<Leader>y", '"+y')                   -- Copy to system clipboard

-- Visual mode mappings
vmap("<", "<gv")                  -- Keep visual selection when indenting forward
vmap(">", ">gv")                  -- Keep visual selection when indenting backward
vmap("<Leader>j", "!jq '.' <CR>") -- Format JSON under visual selection
vmap("<Leader>y", '"+y')          -- Copy to system clipboard

-- Terminal mode mappings
tmap("<Esc>", "<C-\\><C-n>")

------------------
-- Autocommands --
------------------

-- Dotfile management
vim.cmd(
  'autocmd BufWritePost ~/.local/share/chezmoi/private_dot_config/nvim-lspzero/* :!chezmoi apply ~/.config/nvim-lspzero')

-- Highlight yank
vim.cmd("autocmd TextYankPost * lua require'vim.highlight'.on_yank()")

-- Highlight all search matches only while typing
vim.cmd('autocmd CmdlineEnter /,\\? :set hlsearch')
vim.cmd('autocmd CmdlineLeave /,\\? :set nohlsearch')

-- Format on save
vim.cmd('autocmd BufWritePre * lua vim.lsp.buf.format()')

require('lazy').setup("plugins")


---------
-- LSP --
---------
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'gopls', 'rust_analyzer' },
  handlers = {
    lsp_zero.default_setup,
  },
})

local lua_opts = lsp_zero.nvim_lua_ls({
  single_file_support = false,
})

require('lspconfig').lua_ls.setup(lua_opts)


local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local cmp_format = require('lsp-zero').cmp_format()

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  },
  -- Adding to nvim-cmp's preset so I don't lose default keybindings
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({ select = true }),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

    -- Scroll up and down in the completion documentation
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  }),

  formatting = cmp_format,
})

-- Gitsigns
-- See `:help gitsigns.txt`
require("gitsigns").setup {
  signs = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
  },
}


require('dap-go').setup {
  -- Additional dap configurations can be added.
  -- dap_configurations accepts a list of tables where each entry
  -- represents a dap configuration. For more details do:
  -- :help dap-configuration
  dap_configurations = {
    {
      -- Must be "go" or it will be ignored by the plugin
      type = "go",
      name = "Attach remote",
      mode = "remote",
      request = "attach",
    },
  },
}

vim.cmd.colorscheme('dracula')
