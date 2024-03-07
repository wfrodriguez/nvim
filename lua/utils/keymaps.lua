local keymap = vim.keymap.set

-- General
keymap("n", "<leader>ww", "<cmd>w!<CR>", { desc = "Save buffer" })
keymap("n", "<leader>wa", "<cmd>wall!<CR>", { desc = "Save all buffers" })
keymap("n", "<leader>qq", "<cmd>q!<CR>", { desc = "Quit buffer" })
keymap("n", "<leader>qa", "<cmd>qall!<CR>", { desc = "Quit all buffers" })

-- Remap for dealing with word wrap
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = "" })
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = "" })

-- Mejor visualización en la búsqueda
keymap("n", "n", "nzzzv", { desc = "Search next and Center" })
keymap("n", "N", "Nzzzv", { desc = "Search prev and Center" })
keymap("n", "g,", "g,zvzz", { desc = "" })
keymap("n", "g;", "g;zvzz", { desc = "" })

-- Mejor desplazamiento
keymap("n", "<C-d>", "<C-d>zz", { desc = "Page down and center" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Page up and center" })

-- Paste
keymap("", "]p", "o<Esc>p", { desc = "Paste below" })
keymap("n", "]P", "O<Esc>p", { desc = "Paste above" })

-- Better escape
keymap("n", "<Esc>", "<cmd>nohl<CR>", { desc = "ESC in normal mode" })
keymap("i", "<M-f>", "<ESC>", { desc = "Alternate escape" })
keymap("t", "<M-f>", "<C-\\><C-n>", { desc = "Escape in terminal mode" })

-- Movimientos Dvorak
-- Normal Mode
keymap("n", "<M-r>", "h")
keymap("n", "<M-t>", "j")
keymap("n", "<M-n>", "k")
keymap("n", "<M-s>", "l")
-- Visual Mode
keymap("x", "<M-r>", "h")
keymap("x", "<M-t>", "j")
keymap("x", "<M-n>", "k")
keymap("x", "<M-s>", "l")
-- Insert Mode
keymap("i", "<M-r>", "<Left>")
keymap("i", "<M-t>", "<Down>")
keymap("i", "<M-n>", "<Up>")
keymap("i", "<M-s>", "<Right>")
-- Terminal mode
keymap("t", "<C-r>", "<C-\\><C-n><C-w>h")
keymap("t", "<C-t>", "<C-\\><C-n><C-w>j")
keymap("t", "<C-n>", "<C-\\><C-n><C-w>k")
keymap("t", "<C-s>", "<C-\\><C-n><C-w>l")
-- Movements between buffers
keymap("n", "<C-r>", "<C-w>h")
keymap("n", "<C-t>", "<C-w>j")
keymap("n", "<C-n>", "<C-w>k")
keymap("n", "<C-s>", "<C-w>l")

-- Buffer
keymap("n", "<C-h>", "<cmd>bp<CR>", { desc = "Next buffer" })
keymap("n", "<C-l>", "<cmd>bn<CR>", { desc = "Prev buffer" })
keymap("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Delete buffer" })

-- Identación
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Pegar sobre el texto actualmente seleccionado sin copiarlo
keymap("v", "p", '"_dP')
-- Copiar desde el cursor hasta el final de línea
keymap("n", "Y", "y$")
-- X clipboard
keymap("x", "<leader>y", '"+y', { desc = "Copy to Clipboard" })
keymap("n", "<leader>p", '"+p', { desc = "Paste from Clipboard" })
keymap("n", "<leader>P", '"+P', { desc = "Paste before from Clipboard" })

-- Insertar líneas en blanco
keymap("n", "<Space>]", "o<Esc>", { desc = "Insert line next" })
keymap("n", "<Space>[", "O<Esc>", { desc = "Insert line prev" })

-- Auto indent
keymap("n", "i", function()
	if #vim.fn.getline(".") == 0 then
		return [["_cc]]
	else
		return "i"
	end
end, { expr = true })

-- Extra
keymap("n", "<leader>xx", "<cmd>luado require('utils.ui').ProjectInfo()<CR>", { desc = "Project info" })
keymap("n", "<leader>xs", "<cmd>luado require('utils.ui').StackOverflow()<CR>", { desc = "StackOverflow" })
keymap("n", "<leader>xn", "<cmd>luado require('utils.ui').Nami()<CR>", { desc = "Nami Go Docs" })
keymap("n", "<leader>xb", "<cmd>luado require('utils.ui').Shell()<CR>", { desc = "Bash Terminal" })
keymap("n", "<leader>vv", "<cmd>Vista!!<CR>", { desc = "Vista tags" })
