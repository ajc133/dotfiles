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


------------------
-- Autocommands --
------------------
local autocmd = vim.api.nvim_create_autocmd

-- Dotfile management
autocmd({ "BufWritePost" }, {
  pattern = { vim.fn.expand("~") .. "/.local/share/chezmoi/private_dot_config/nvim-lspzero/*" },
  command = "! chezmoi apply",
})

-- Highlight yank
autocmd({ "TextYankPost" }, {
  pattern = { "*" },
  command = "lua require'vim.highlight'.on_yank()"
})

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

vim.cmd.colorscheme('dracula')
