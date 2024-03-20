return {
  -- Useful plugin to show you pending keybinds.
  {
    'folke/which-key.nvim',
    event = "VimEnter",
    config = function()
      require("which-key").setup()

      -- require('which-key').register {
      --   ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      --   ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
      --   ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
      --   ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
      --   ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
      -- }
    end

  },

  -- gitsigns
  { 'lewis6991/gitsigns.nvim' },

  -- git blame
  { 'tpope/vim-fugitive' },

  -- Debugger
  { 'mfussenegger/nvim-dap' },
  { 'leoluz/nvim-dap-go' },

  -- Commenting
  { 'tpope/vim-commentary' },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
    }
  }
}
