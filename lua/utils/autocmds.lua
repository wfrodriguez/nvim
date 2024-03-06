local function augroup(name)
	return vim.api.nvim_create_augroup("nde_" .. name, { clear = true })
end

-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = augroup("highlight_yank"),
	pattern = "*",
})

-- Alternar automáticamente entre números de línea relativos y absolutos
-- Los números relativos se utilizan en un búfer que tiene el foco y está en modo normal, ya que es ahí donde te
-- mueves.
-- Se desactivan cuando sales de Vim, cambias a otra división o entra en los modos de inserción y comando.
local augroup = vim.api.nvim_create_augroup("numbertoggle", {})
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
	pattern = "*",
	group = augroup,
	callback = function()
		if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
			vim.opt.relativenumber = true
		end
	end,
})
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
	pattern = "*",
	group = augroup,
	callback = function()
		if vim.o.nu then
			vim.opt.relativenumber = false
			vim.cmd("redraw")
		end
	end,
})

local is_int = function(n)
	return (type(n) == "number") and (math.floor(n) == n)
end

-- Ubicar el cursor es la última posición
local lastEdited = vim.api.nvim_create_augroup("lastEdited", {})
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*",
	group = lastEdited,
	callback = function()
		pos = vim.fn.line(".")
		fin = vim.fn.line("$")
		if is_int(pos) and is_int(fin) and pos > 0 and pos <= fin then
			vim.cmd([[normal! g`"]])
		end
	end,
})

-- Márgenes en programas cobol
local cobolMargins = vim.api.nvim_create_augroup("cobolMargins", {})
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = { "*.cbl", "*.cob", "*.cobol" },
	group = cobolMargins,
	callback = function()
		vim.cmd([[hi ColorColumn guibg=#333333 ]])
		-- vim.api.nvim_set_hl(0, 'ColorColumn', {bg = "#333333" })
		vim.wo.colorcolumn = "7,12,73"
	end,
})

-- Formato de código antes de guardar
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})

-- Cuando inicie el editor, mostrar un "Tip" al azar
local tips = vim.api.nvim_create_augroup("tips", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
	group = tips,
	callback = function()
		local tip = require("utils.tips").RandomTip()
		vim.notify(tip, vim.log.levels.INFO, { title = "Tip!" })
	end,
})
-- No comentar nuevas líneas
vim.cmd([[au BufEnter * set fo-=c fo-=r fo-=o]])
