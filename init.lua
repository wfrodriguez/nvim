--- Install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("utils.options")

-- Configure lazy.nvim
require("lazy").setup({
	spec = {
		{ import = "pde" },
		{ import = "pde.ext" },
	},
	ui = { border = "double" },
	defaults = { lazy = true, version = nil },
	install = { missing = true, colorscheme = { "ayu" } },
	checker = { enabled = true },
	performance = {
		cache = {
			enabled = true,
		},
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

require("utils.autocmds")
require("utils.keymaps")

if vim.g.neovide then
	vim.o.guifont = "Iosevka Term Slab:h9"
	vim.g.neovide_floating_blur_amount_x = 2.0
	vim.g.neovide_floating_blur_amount_y = 2.0
end
