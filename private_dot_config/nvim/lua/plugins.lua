-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(
  function(use)

    -- Get startuptime with `:StartupTime`
    use 'dstein64/vim-startuptime'

    -- "Packer can manage itself"
    use 'wbthomason/packer.nvim'

    -- Status line
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons' },
      config = function() require('lualine').setup({}) end
    }
    use {
      'akinsho/bufferline.nvim',
      tag = "v3.*",
      requires = 'nvim-tree/nvim-web-devicons',
      config = function() require('bufferline').setup() end
    }

    -- Syntax Highlighting
    -- use {
    --   'nvim-treesitter/nvim-treesitter',
    --   run = ':TSUpdate'
    -- }
    -- use {
    --   'p00f/nvim-ts-rainbow',
    --   requires = { 'nvim-treesitter/nvim-treesitter' }
    -- }

   -- Git commands
    use 'tpope/vim-fugitive'

    -- Colorschemes
    use 'lifepillar/vim-gruvbox8'
    use 'frankier/neovim-colors-solarized-truecolor-only'
    use 'folke/tokyonight.nvim'
    use {
      'marko-cerovac/material.nvim',
      config = function() require('material').setup({lualine_style = 'default'}) end,
    }


    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'

    -- Comment things out
    use 'tpope/vim-commentary'

    -- Completion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    -- Telescope
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons'} }
    }

    -- FIXME: Snippets
    -- use 'SirVer/ultisnips'
    -- use 'quangnguyen30192/cmp-nvim-ultisnips'

  end
)
