local Input = require("nui.input")
local Menu = require("nui.menu")
local event = require("nui.utils.autocmd").event

local M = {}

-- Función que muestra un campo de entrada de usuario
-- Ejemplo:
--  :lua require('utils.ui').input('Ingrese un texto', '', function(res) vim.notify('El resultado es: ' .. res) end)
function M.input(label, default, onSubmit)
  local input = Input({
    position = "50%",
    size = {
      width = 20,
    },
    border = {
      style = "rounded",
      text = {
        top = label,
        top_align = "center",
      },
    },
    win_options = {
      winhighlight = "Normal:Normal,FloatBorder:Normal",
    },
  }, {
    prompt = "> ",
    default_value = default,
    on_close = function()
      print("Input Closed!")
    end,
    on_submit = onSubmit,
  })
  
  -- mount/open the component
  input:mount()
  
  -- unmount component when cursor leaves buffer
  input:on(event.BufLeave, function()
    input:unmount()
  end)
end

return M