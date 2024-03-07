local NInput = require("nui.input")
local NEvent = require("nui.utils.autocmd").event
local NMenu = require("nui.menu")

local M = {}

M.Input = function(prompt, defVal, onConfirm)
	assert(type(onConfirm) == "function", "missing onConfirm function")
	local input = NInput({
		position = "50%",
		size = {
			width = 40,
		},
		border = {
			style = "single",
			text = {
				top = "[" .. prompt .. "]",
				top_align = "left",
			},
		},
		win_options = {
			winhighlight = "Normal:Normal,FloatBorder:Normal",
		},
	}, {
		prompt = " ",
		default_value = defVal,
		on_submit = onConfirm,
	})

	input:mount()

	input:map("n", "<Esc>", function()
		input:unmount()
	end, { noremap = true })

	input:on(NEvent.BufLeave, function()
		input:unmount()
	end)
end

M.Select = function(prompt, strItems, onConfirm)
	assert(type(onConfirm) == "function", "missing onConfirm function")
	local items = {}

	for k, v in pairs(strItems) do
		table.insert(items, NMenu.item(v, { id = k }))
	end

	local menu = NMenu({
		position = "50%",
		size = {
			width = 45,
			height = 5,
		},
		border = {
			style = "single",
			text = {
				top = "[" .. prompt .. "]",
				top_align = "left",
			},
		},
		win_options = {
			winhighlight = "Normal:Normal,FloatBorder:Normal",
		},
	}, {
		lines = items,
		max_width = 20,
		keymap = {
			focus_next = { "j", "<Down>", "<Tab>" },
			focus_prev = { "k", "<Up>", "<S-Tab>" },
			close = { "<Esc>", "<C-c>" },
			submit = { "<CR>", "<Space>" },
		},
		on_submit = onConfirm,
	})

	menu:mount()
end

return M
