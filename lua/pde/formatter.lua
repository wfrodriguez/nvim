return {
	{
		"mhartington/formatter.nvim",
		lazy = false,
		config = function()
			require("formatter").setup({
				-- Enable or disable logging
				logging = true,
				-- Set the log level
				log_level = vim.log.levels.WARN,
				-- All formatter configurations are opt-in
				filetype = {
					lua = require("formatter.filetypes.lua").stylua,
					go = function()
						return {
							exe = "golines",
							args = {
								'--base-formatter="goimports"',
							},
							stdin = true,
						}
					end,
					javascript = require("formatter.filetypes.javascript").prettierd,
					html = require("formatter.filetypes.html").prettierd,
					css = require("formatter.filetypes.css").prettierd,
					json = require("formatter.filetypes.json").jq,

					-- Use the special "*" filetype for defining formatter configurations on any filetype
					["*"] = {
						-- "formatter.filetypes.any" defines default configurations for any
						-- filetype
						require("formatter.filetypes.any").remove_trailing_whitespace,
					},
				},
			})
		end,
	},
}
