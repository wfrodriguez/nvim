return {
	{
		"Pocco81/true-zen.nvim",
		cmd = { "TZNarrow", "TZFocus", "TZMinimalist", "TZAtaraxis" },
		init = function()
			local keymap = vim.keymap.set
			keymap("n", "<leader>zn", ":TZNarrow<CR>", { desc = "Narrow region" })
			keymap("v", "<leader>zn", ":'<,'>TZNarrow<CR>", { desc = "VNarrow region" })
			keymap("n", "<leader>zf", ":TZFocus<CR>", { desc = "Focus buffer" })
			keymap("n", "<leader>zm", ":TZMinimalist<CR>", { desc = "Min mode" })
			keymap("n", "<leader>za", ":TZAtaraxis<CR>", { desc = "Old zen mode" })
		end,
	},
	{
		"chentoast/marks.nvim",
		lazy = false,
		config = function()
			require("marks").setup()
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		lazy = false,
		config = function()
			local ls = require("luasnip")
			local keymap = vim.keymap.set
			keymap({ "i" }, "<C-c>", function()
				ls.expand()
			end, { silent = true })
			keymap({ "i", "s" }, "<C-x>", function()
				ls.jump(1)
			end, { silent = true })
			keymap({ "i", "s" }, "<C-k>", function()
				ls.jump(-1)
			end, { silent = true })

			keymap({ "i", "s" }, "<C-q>", function()
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end, { silent = true })
			-- ~/.config/nvim/snippets
			require("luasnip.loaders.from_vscode").load({ paths = { "~/.config/nvim/snippets/" } })
		end,
	},
	{
		"tpope/vim-fugitive",
		cmd = { "G", "Git" },
		keys = {
			{ "<leader>ga", "<cmd>Git fetch --all --p<CR>", desc = "Git fetch" },
			{ "<leader>gp", "<cmd>Git pull<CR>", desc = "Git pull" },
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		config = true,
		lazy = false,
	},
	{
		"liuchengxu/vista.vim",
		cmd = { "Vista" },
		init = function()
			vim.g.vista_ctags_cmd = { go = "gotags" }
		end,
	},
	{
		"stevearc/oil.nvim",
		opts = {},
		cmd = { "Oil" },
		keys = {
			{ "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
		},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"feline-nvim/feline.nvim",
		lazy = false,
		config = function(_, opts)
			require("feline").setup(opts)
		end,
	},
}
