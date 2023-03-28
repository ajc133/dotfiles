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
			config = function()
				require('lualine').setup({
					sections = {
						lualine_a = { { 'buffers', show_filename_only = false } }
					}
				})
			end
		}

		-- File tree
		use {
			'nvim-tree/nvim-tree.lua',
			requires = {
				'nvim-tree/nvim-web-devicons',
			},
			tag = 'nightly' -- optional, updated every week. (see issue #1193)
		}

		-- Status line
		use {
			'akinsho/bufferline.nvim',
			tag = "v3.*",
			requires = 'nvim-tree/nvim-web-devicons',
			config = function() require('bufferline').setup {} end,
		}

		-- Syntax Highlighting
		use { -- Highlight, edit, and navigate code
			'nvim-treesitter/nvim-treesitter',
			run = function()
				pcall(require('nvim-treesitter.install').update { with_sync = true })
			end,
		}
		use { -- Additional text objects via treesitter
			'nvim-treesitter/nvim-treesitter-textobjects',
			after = 'nvim-treesitter',
		}

		-- Git
		use 'tpope/vim-fugitive'
		use 'shumphrey/fugitive-gitlab.vim'
		use 'lewis6991/gitsigns.nvim'

		-- Colorschemes
		use 'lifepillar/vim-gruvbox8'
		use 'frankier/neovim-colors-solarized-truecolor-only'
		use 'folke/tokyonight.nvim'
		use 'Mofiqul/dracula.nvim'
		use {
			'marko-cerovac/material.nvim',
			config = function() require('material').setup({ lualine_style = 'default' }) end,
		}


		-- LSP
		use 'neovim/nvim-lspconfig'
		use 'williamboman/mason.nvim'
		use 'j-hui/fidget.nvim'

		-- Golang
		use {
			'crispgm/nvim-go',
			requires = { { 'nvim-lua/plenary.nvim' } }
		}

		-- Comment things out
		use 'tpope/vim-commentary'

		-- Completion
		use { -- Autocompletion
			'hrsh7th/nvim-cmp',
			requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
		}

		-- Telescope
		use {
			'nvim-telescope/telescope.nvim', tag = '0.1.0',
			requires = { { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' } }
		}

		-- FIXME: Snippets
		-- use 'SirVer/ultisnips'
		-- use 'quangnguyen30192/cmp-nvim-ultisnips'

	end
)
