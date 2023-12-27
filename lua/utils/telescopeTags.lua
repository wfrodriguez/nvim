local utils = require "utils"
local M = {}

makeTags = function()
  print "makeTags"
  local baseDir = vim.fn.getcwd()
  local cmd = "ctags -R "
  print "switch"
  utils.switch(vim.ob.filetype, {
    ["go"] = function() -- for case 1
      cmd = "gotags -R " .. baseDir
    end,
    ["default"] = function() -- for default
      cmd = "ctags -R " .. baseDir
    end,
  })
  print(string.format("makeTags: %s; %s; %s", baseDir, cmd, vim.fn.getcwd()))
  os.execute(cmd)
end

M.Tags = function()
  makeTags()
  require("telescope.builtin").tags()
end
