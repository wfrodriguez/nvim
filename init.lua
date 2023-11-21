require "config.options"
require "config.lazy"

print("nvim loaded arg " .. vim.fn.argc(-1))
if vim.fn.argc(-1) == 0 then
  vim.api.nvim_create_autocmd("User", {
    group = vim.api.nvim_create_augroup("NeovimPDE", { clear = true }),
    pattern = "VeryLazy",
    callback = function()
      require "config.autocmds"
      require "config.keymaps"
      vim.cmd.colorscheme "catppuccin-mocha"
    end,
  })
else
  require "config.autocmds"
  require "config.keymaps"
  vim.cmd.colorscheme "catppuccin-mocha"
end
