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
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = function() require('lualine').setup() end
    }

    -- Syntax Highlighting
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
    }
    use 'p00f/nvim-ts-rainbow'
  
   -- Git commands
    use 'tpope/vim-fugitive'
  
    -- Colorschemes
    use 'lifepillar/vim-gruvbox8'
 
    -- LSP
    use 'neovim/nvim-lspconfig'

    -- Comment things out
    use 'tpope/vim-commentary'
  
    -- Completion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- FIXME: Snippets
    -- use 'SirVer/ultisnips'
    -- use 'quangnguyen30192/cmp-nvim-ultisnips'
 
  end
)
