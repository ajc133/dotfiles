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
nmap("<Leader>x", ":bdelete<CR>")          -- Close buffer
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
---- note: diagnostics are not exclusive to lsp servers
-- so these can be global keybindings
vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }

    -- these will be buffer-local keybindings
    -- because they only work if you have an active language server

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local default_setup = function(server)
  require('lspconfig')[server].setup({
    capabilities = lsp_capabilities,
  })
end

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    default_setup,
  },
})

local cmp = require('cmp')

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  },
  mapping = cmp.mapping.preset.insert({
    -- Enter key confirms completion item
    ['<CR>'] = cmp.mapping.confirm({ select = false }),

    -- Ctrl + space triggers completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Scroll up and down in the completion documentation
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})



-------------------
-- Other Plugins --
-------------------

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

-- Go Debugger
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


--------------
-- Mappings --
--------------

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fr', builtin.resume, {})
vim.keymap.set('n', '<leader>fw', builtin.grep_string, {})
vim.keymap.set('n', '<leader>gr', builtin.lsp_references, {})
