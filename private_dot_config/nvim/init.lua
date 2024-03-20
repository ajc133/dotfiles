local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

-- Auto-install lazy.nvim if not present
if not vim.loop.fs_stat(lazypath) then
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
end ---@diagnostic disable-next-line: undefined-field
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

-- Normal mode mappings
vim.keymap.set("n", "<TAB>", ":bnext<CR>", { desc = "TAB to next buffer" })
vim.keymap.set("n", "<S-TAB>", ":bprevious<CR>", { desc = "Shift + TAB to prev buffer" })
vim.keymap.set("n", "<C-s>", ":write<cr>", { desc = "Save" })
vim.keymap.set("n", "<Leader>c", "<C-w>c", { desc = "Close window" })
vim.keymap.set("n", "<Leader>d", '"_d', { desc = "Blackhole register" })
vim.keymap.set("n", "<Leader>p", "$p<cr>", { desc = "Paste to end of line" })
-- vim.keymap.set("n", "<Leader>s", ":%s/\\<<C-r><C-w>\\>/", { desc = " -- Search-replace word in file" })
vim.keymap.set("n", "<Leader>x", ":bdelete<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<Leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<Leader>.", '@:', { desc = "Do the most recent Ex command" })

-- Visual mode mappings" })
vim.keymap.set("v", "<", "<gv", { desc = "Keep visual selection when indenting forward" })
vim.keymap.set("v", ">", ">gv", { desc = "Keep visual selection when indenting backward" })
vim.keymap.set("v", "<Leader>j", "!jq '.' <CR>", { desc = "Format JSON under visual selection" })
vim.keymap.set("v", "<Leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("v", "<Leader>s", '"7y | :%s/\\<<C-r>7\\>/', { desc = "" })

-- Terminal mode mappings
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Escape terminal mode sensibly" })

------------------
-- Autocommands --
------------------

-- Dotfile management
vim.api.nvim_create_autocmd("BufWritePost", {
  desc = "Apply Chezmoi nvim config on change",
  group = vim.api.nvim_create_augroup("chezmoi-write", { clear = true }),
  command = ":!chezmoi apply ~/.config/nvim"
})

-- Highlight when yanking (copying) text
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

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

-- vim.keymap.set('n', '<leader>e', "<cmd>lua vim.diagnostic.open_float()<cr>")
-- vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
-- vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

-- vim.api.nvim_create_autocmd('LspAttach', {
--   desc = 'LSP actions',
--   callback = function(event)
--     local opts = { buffer = event.buf }

--     -- these will be buffer-local keybindings
--     -- because they only work if you have an active language server

--     vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
--     vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
--     vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
--     vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
--     vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
--     -- vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
--     vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
--     vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
--     vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
--     vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
--   end
-- })


-- require('mason-tool-installer').setup {
--   ensure_installed = {
--     'ansible-language-server',
--     'ansible-lint',
--     -- commented the ones i want to try in the future
--     'bash-language-server',
--     'black',
--     'editorconfig-checker',
--     'golangci-lint',
--     'golines',
--     -- 'gomodifytags',
--     'gopls',
--     -- 'gotests',
--     'html-lsp',
--     'isort',
--     -- 'json-to-struct',
--     'lua-language-server',
--     'pyright',
--     'rust-analyzer',
--     'shellcheck',
--     'terraform-ls',
--     'typescript-language-server',
--     -- 'staticcheck',
--     'yaml-language-server',
--   },
--   auto_update = false,
--   run_on_start = true,
--   start_delay = 3000, -- 3 second delay
--   debounce_hours = 5, -- at least 5 hours between attempts to install/update
-- }

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

vim.cmd.colorscheme('onedark')


--------------
-- Mappings --
--------------

-- Git Fugitive
vim.keymap.set("n", "<Leader>gb", ":Git blame<cr>")  -- git blame %
vim.keymap.set("n", "<Leader>gw", ":Gwrite<cr>")     -- git add %
vim.keymap.set("n", "<Leader>gc", ":Git commit<cr>") -- git commit
vim.keymap.set("n", "<Leader>grm", ":Gremove<cr>")   -- git rm %
vim.keymap.set("n", '<Leader>gmv', ':Gmove ')        -- git mv <path>

-- Trouble
vim.keymap.set("n", "<leader>t", function() require("trouble").toggle() end)
