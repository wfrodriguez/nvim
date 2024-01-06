local function augroup(name)
  return vim.api.nvim_create_augroup("nde_" .. name, { clear = true })
end

-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = augroup "highlight_yank",
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
      vim.cmd "redraw"
    end
  end,
})

-- Ubicar el cursor es la última posición
local lastEdited = vim.api.nvim_create_augroup("lastEdited", {})
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  group = lastEdited,
  callback = function()
    pos = vim.fn.line "."
    fin = vim.fn.line "$"
    if pos > 0 and pos <= fin then
      vim.cmd [[normal! g`"]]
    end
  end,
})

-- No comentar nuevas líneas
vim.cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]
