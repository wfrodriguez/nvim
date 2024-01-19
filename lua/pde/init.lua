return {
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.o.background = "dark"
			require("gruvbox").setup({})
			vim.cmd.colorscheme("gruvbox")
		end,
		install = {
			colorscheme = { "gruvbox" },
		},
	},
	{
		"nvim-tree/nvim-web-devicons",
		dependencies = { "DaikyXendo/nvim-material-icon" },
		config = function()
			require("nvim-web-devicons").setup({
				override = require("nvim-material-icon").get_icons(),
			})
		end,
	},
	{
		"rcarriga/nvim-notify",
		lazy = false,
		priority = 1000,
		config = function()
			vim.notify = require("notify")
			vim.notify.setup()
		end,
	},
	{
		"MunifTanjim/nui.nvim",
		config = function() end,
	},
	{
		"SmiteshP/nvim-navic",
		dependencies = { "neovim/nvim-lspconfig" },
		lazy = false,
		priority = 1000,
	},
}
