local M = {}

-- Valida si un archivo existe
function file_exists(name)
  local f = io.open(name, "r")
  return f ~= nil and io.close(f)
end

-- Valida si el archivo `.nvim.lua` existe, si existe entonces
-- carga la configuración de este archivo
function M.loadNvimStart()
  local nvimrc = vim.fn.getcwd() .. "/.nvim.lua"
  if file_exists(nvimrc) then
    vim.cmd("luafile " .. nvimrc)
  else
    vim.notify("Archivo `.nvim.lua` no encontrado", "info", { title = " Neovim Config" })
  end
end

return M
