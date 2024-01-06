-- Set <space> as the leader key
-- See `:help mapleader`
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Tab 4 spaces
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- Make sure your terminal supports this
vim.o.termguicolors = true

-- Show special chars
-- vim.o.listchars = "eol:$,tab:<>,trail:~,extends:❯,precedes:❮,space:·,nbsp:§,multispace:┄┄┄┊"
-- vim.o.list = true

vim.o.magic = true
vim.o.wrap = false

-- Folding
vim.o.foldenable = true
vim.o.foldmethod = "marker"

vim.o.formatoptions = "cq"

vim.o.textwidth = 130
vim.o.wrapmargin = 130

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

