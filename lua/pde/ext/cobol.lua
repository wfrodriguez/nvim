return {
	{
		"Jorengarenar/COBOl.vim",
		ft = { "cobol", "cob", "cbl" },
		init = function()
			-- vim.g.cobol_legacy_code = 1
			vim.g.cobol_autoupper = 1
			vim.g.cobol_comp_mp_cobc = 1
		end,
	},
}
