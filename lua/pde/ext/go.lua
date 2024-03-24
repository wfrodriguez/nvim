function on_attach(on_attach)
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local bufnr = args.buf
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			on_attach(client, bufnr)
		end,
	})
end

return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { "go", "gomod" })
		end,
	},
	{
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {},
		config = function(_, opts)
			require("go").setup(opts)
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				gopls = {
					settings = {
						gopls = {
							analyses = {
								unusedparams = true,
							},
							hints = {
								assignVariableTypes = true,
								compositeLiteralFields = true,
								compositeLiteralTypes = true,
								constantValues = true,
								functionTypeParameters = true,
								parameterNames = true,
								rangeVariableTypes = true,
							},
							staticcheck = true,
							semanticTokens = true,
						},
					},
				},
				golangci_lint_ls = {},
			},
			setup = {
				gopls = function(_, _)
					on_attach(function(client, bufnr)
						local map = function(mode, lhs, rhs, desc)
							if desc then
								desc = desc
							end
							vim.keymap.set(
								mode,
								lhs,
								rhs,
								{ silent = true, desc = desc, buffer = bufnr, noremap = true }
							)
						end
						if client.name == "gopls" then
							map("n", "<leader>ly", "<cmd>GoModTidy<cr>", "Go Mod Tidy")
							map("n", "<leader>lc", "<cmd>GoCoverage<Cr>", "Go Test Coverage")
							map("n", "<leader>lt", "<cmd>GoTest<Cr>", "Go Test")
							map("n", "<leader>lR", "<cmd>GoRun<Cr>", "Go Run")
							map("n", "<leader>dT", "<cmd>lua require('dap-go').debug_test()<cr>", "Go Debug Test")
						end
					end)
				end,
			},
		},
	},
}
