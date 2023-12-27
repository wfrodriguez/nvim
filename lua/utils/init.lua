local M = {}

M.pathSeparator = "/"
M.isWindows = vim.fn.has "win32" == 1 or vim.fn.has "win32unix" == 1

if M.isWindows == true then
  M.pathSeparator = "\\"
end

-- Une varias cadenas en un file path determinado por el separador de directorios
M.pathJoin = function(...)
  local args = { ... }
  if #args == 0 then
    return ""
  end

  local allParts = {}
  if type(args[1]) == "string" and args[1]:sub(1, 1) == M.pathSeparator then
    allParts[1] = ""
  end

  for _, arg in ipairs(args) do
    argParts = M.split(arg, M.pathSeparator)
    vim.list_extend(allParts, argParts)
  end
  return table.concat(allParts, M.pathSeparator)
end

-- Usage:
-- switch(a, {
--     [1] = function()	-- for case 1
--         print "Case 1."
--     end,
--     [2] = function()	-- for case 2
--         print "Case 2."
--     end,
--     [3] = function()	-- for case 3
--         print "Case 3."
--     end,
--     ["default"] = function()	-- for default
--         print "Default."
--     end
-- })
M.switch = function(param, case_table)
  local case = case_table[param]
  if case then
    return case()
  end
  local def = case_table["default"]
  return def and def() or nil
end

return M
