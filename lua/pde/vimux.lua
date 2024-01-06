return {
    {
      "preservim/vimux",
      lazy = false,
      config = function ()
        local keymap = vim.keymap.set
        keymap("n", "<leader>vl", "<cmd>VimuxRunLastCommand<CR>")
        keymap("n", "<leader>vp", "<cmd>VimuxPromptCommand<CR>")
        keymap("n", "<leader>vc", "<cmd>VimuxInterruptRunner<CR>")
      end,
    },
  }