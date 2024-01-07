local Input = require("nui.input")
local Menu = require("nui.menu")
local NuiText = require("nui.text")
local NuiPopup = require("nui.popup")
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

M.popup_options = function(title, min_width, override_options)
    local min_width = min_width or 30
    local width = string.len(title) + 2
    local right_padding = " "
    if width < min_width then
      right_padding = string.rep(" ", min_width - width + 1)
      width = min_width
    end
 
    local popup_border_style = 'double'
    local popup_options = {
      relative = "cursor",
      position = {
        row = 1,
        col = 0,
      },
      size = width,
      border = {
        text = {
          top = title,
        },
        style = popup_border_style,
      },
      win_options = {
        winhighlight = "Normal:Normal,FloatBorder:Normal",
      },
      buf_options = {
        bufhidden = "delete",
        buflisted = false,
        filetype = "neo-tree-popup",
      },
    }
  
    if popup_border_style == "NC" then
      local blank = NuiText(" ", "--")
      local text = NuiText(" " .. title .. " ", "--")
      popup_options.border = {
        style = { "▕", blank, "▏", "▏", " ", "▔", " ", "▕" },
        text = {
          top = text,
          top_align = "center",
        },
      }
    end

    return popup_options
  end

M.alert = function(title, message)
    local lines = {}
    local max_line_width = title:len()
    local add_line = function(line)
      if not type(line) == "string" then
        line = tostring(line)
      end
      if line:len() > max_line_width then
        max_line_width = line:len()
      end
      table.insert(lines, line)
    end
  
    if type(message) == "table" then
      for _, v in ipairs(message) do
        add_line(v)
      end
    else
      add_line(message)
    end
  
    -- add_line(" Press <Escape> or <Enter> to close")
  
    local win_options = M.popup_options(title, 80)
    win_options.zindex = 60
    win_options.size = {
      width = max_line_width + 4,
      height = #lines+1,
    }
    local win = NuiPopup(win_options)
    win:mount()
  
    local success, msg = pcall(vim.api.nvim_buf_set_lines, win.bufnr, 0, 0, false, lines)
    if success then
      win:map("n", "<esc>", function(bufnr)
        win:unmount()
      end, { noremap = true })
  
      win:map("n", "<enter>", function(bufnr)
        win:unmount()
      end, { noremap = true })
  
      local event = require("nui.utils.autocmd").event
      win:on({ event.BufLeave, event.BufDelete }, function()
        win:unmount()
      end, { once = true })
  
      -- why is this necessary?
      vim.api.nvim_set_current_win(win.winid)
    else
      log.error(msg)
      win:unmount()
    end
  end
  

return M
