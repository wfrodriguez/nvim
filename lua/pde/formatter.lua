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
					lua = function()
						local util = require("formatter.util")
						-- Supports conditional formatting
						if util.get_current_buffer_file_name() == "special.lua" then
							return nil
						end

						-- Full specification of configurations is down below and in Vim help
						-- files
						return {
							exe = "stylua",
							args = {
								"--search-parent-directories",
								"--stdin-filepath",
								util.escape_path(util.get_current_buffer_file_path()),
								"--",
								"-",
							},
							stdin = true,
						}
					end,
					go = function()
						local util = require("formatter.util")
						return {
							exe = "golines",
							args = {
								'--base-formatter="goimports"',
							},
							stdin = true,
						}
					end,
					javascript = {
						-- prettierd
						function()
							return {
								exe = "prettierd",
								args = { vim.api.nvim_buf_get_name(0) },
								stdin = true,
							}
						end,
					},
					html = {
						-- prettierd
						function()
							return {
								exe = "prettierd",
								args = { vim.api.nvim_buf_get_name(0) },
								stdin = true,
							}
						end,
					},
					css = {
						-- prettierd
						function()
							return {
								exe = "prettierd",
								args = { vim.api.nvim_buf_get_name(0) },
								stdin = true,
							}
						end,
					},
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
