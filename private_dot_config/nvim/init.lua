local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
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

-- Normal mode mappings
vim.keymap.set("n", "<TAB>", ":bnext<CR>", { desc = "TAB to next buffer" })
vim.keymap.set("n", "<S-TAB>", ":bprevious<CR>", { desc = "Shift + TAB to prev buffer" })
vim.keymap.set("n", "<C-s>", ":write<cr>", { desc = "Save" })
vim.keymap.set("n", "<Leader>c", "<C-w>c", { desc = "Close window" })
vim.keymap.set("n", "<Leader>d", '"_d', { desc = "Delete to blackhole register" })
vim.keymap.set("n", "<Leader>p", "$p<cr>", { desc = "Paste to end of line" })
vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<cr>", { desc = "Open diagnostic float" })
vim.keymap.set("n", "<F2>", ":%s/\\<<C-r><C-w>\\>/", { desc = "Search-replace word in file" })
vim.keymap.set("n", "<Leader>x", ":bdelete<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<Leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<Leader>.", "@:", { desc = "Do the most recent Ex command" })

-- Visual mode mappings" })
vim.keymap.set("v", "<", "<gv", { desc = "Keep visual selection when indenting forward" })
vim.keymap.set("v", ">", ">gv", { desc = "Keep visual selection when indenting backward" })
vim.keymap.set("v", "<Leader>j", "!jq '.' <CR>", { desc = "Format JSON under visual selection" })
vim.keymap.set("v", "<Leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("v", "<F2>", '"7y | :%s/\\<<C-r>7\\>/', { desc = "" })

-- Terminal mode mappings
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Escape terminal mode sensibly" })

-- Visual and Select mode mappings
vim.keymap.set("x", "<Leader>k", "<Esc>`>a](<C-r>*)<C-o>`<[<Esc>",
  { desc = "Create a markdown link of highlighted text" })

------------------
-- Autocommands --
------------------

-- Dotfile management
vim.api.nvim_create_autocmd("BufWritePost", {
  desc = "Apply Chezmoi nvim config on change",
  group = vim.api.nvim_create_augroup("chezmoi-write", { clear = true }),
  pattern = vim.fn.expand("~") .. "/.local/share/chezmoi/private_dot_config/nvim/*",
  command = ":!chezmoi apply ~/.config/nvim",
})

-- Highlight when yanking (copying) text
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Highlight all search matches only while typing
vim.cmd("autocmd CmdlineEnter /,\\? :set hlsearch")
vim.cmd("autocmd CmdlineLeave /,\\? :set nohlsearch")

------------------
--   Packages   --
------------------

local colorscheme = "onedark"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { colorscheme } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

vim.cmd.colorscheme(colorscheme)

-- auto-session
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
