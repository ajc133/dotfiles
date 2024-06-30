return {
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

	-- Useful plugin to show you pending keybinds.
	{
		"folke/which-key.nvim",
		event = "VimEnter",
		config = function()
			require("which-key").setup()

			require("which-key").register({
				["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
				["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
				["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
				["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
				["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
			})
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
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			-- your configuration comes here
		},
		config = function()
			vim.keymap.set("n", "<leader>t", function()
				require("trouble").toggle()
			end)
		end,
	},

	{
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				log_level = "error",
				auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
			})
		end,
	},
	{ "nvim-lualine/lualine.nvim", dependencies = "nvim-tree/nvim-web-devicons" },
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
}
