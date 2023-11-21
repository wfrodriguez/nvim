local keymap = vim.keymap.set

-- General
keymap("n", "<leader>ww", ":w!<CR>")
keymap("n", "<leader>wa", ":wall!<CR>")
keymap("n", "<leader>qq", ":q!<CR>")
keymap("n", "<leader>qa", ":qall!<CR>")

-- Remap for dealing with word wrap
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Better viewing
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")
keymap("n", "g,", "g,zvzz")
keymap("n", "g;", "g;zvzz")

-- Scrolling
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

-- Paste
keymap("n", "]p", "o<Esc>p", { desc = "Paste below" })
keymap("n", "]P", "O<Esc>p", { desc = "Paste above" })

-- Better escape
keymap("n", "<Esc>", ":nohl<CR>:echo<CR>") -- ESC in normal mode)
keymap("i", "<M-f>", "<ESC>")
keymap("t", "<M-f>", "<C-\\><C-n>")

-- Movements Dvorak
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
-- Terminol mode
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
keymap("n", "<C-h>", ":bp<CR>")
keymap("n", "<C-l>", ":bn<CR>")
keymap("n", "<leader>bd", ":bd<CR>")
keymap("n", "<leader>bdd", ":bd!<CR>")

-- Add undo break-points
keymap("i", ",", ",<c-g>u")
keymap("i", ".", ".<c-g>u")
keymap("i", ";", ";<c-g>u")

-- Better indent
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Paste over currently selected text without yanking it
keymap("v", "p", '"_dp')
-- X clipboard
keymap("x", "<leader>y", '"+y')
keymap("n", "<leader>p", '"+p')
keymap("n", "<leader>P", '"+P')

-- Insert blank line
keymap("n", "]<Space>", "o<Esc>")
keymap("n", "[<Space>", "O<Esc>")

-- Auto indent
keymap("n", "i", function()
  if #vim.fn.getline "." == 0 then
    return [["_cc]]
  else
    return "i"
  end
end, { expr = true })
