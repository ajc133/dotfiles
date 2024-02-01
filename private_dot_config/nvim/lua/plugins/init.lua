return {
  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',   opts = {} },

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
