return {
  {
    "preservim/vimux",
    lazy = false,
    -- stylua: ignore
    config = function ()
      local keymap = vim.keymap.set
      keymap("n", "<F2>", "<cmd>VimuxRunLastCommand<CR>")
      keymap("n", "<F3>", "<cmd>VimuxPromptCommand<CR>")
      keymap("n", "<F4>", "<cmd>VimuxInterruptRunner<CR>")
    end,
  },
}
