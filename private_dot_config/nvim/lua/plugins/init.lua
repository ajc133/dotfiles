return {
  -- Useful plugin to show you pending keybinds.
  {
    "folke/which-key.nvim",
    event = "VimEnter",
    opts = {
      preset = "modern",
    },
    config = function()
      require("which-key").setup()
    end,
  },

  -- gitsigns
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },

  -- git blame
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<Leader>gb", ":Git blame<cr>", { desc = "[g]it [B]lame" })
      vim.keymap.set("n", "<Leader>gw", ":Gwrite<cr>", { desc = "[g]it [w]rite" })
      vim.keymap.set("n", "<Leader>grm", ":Gremove<cr>", { desc = "[g]it [r]e[m]ove" })
      vim.keymap.set("n", "<Leader>gmv", ":Gmove ", { desc = "[g]it [mv]" })
    end,
    opts = {},
  },

  -- Debugger
  { "mfussenegger/nvim-dap" },
  { "leoluz/nvim-dap-go" },

  -- "gc" to comment visual regions/lines
  { "numToStr/Comment.nvim", opts = {} },

  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
      })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("lualine").setup()
    end
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup()
    end
  },
  { "Glench/Vim-Jinja2-Syntax" },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
}
