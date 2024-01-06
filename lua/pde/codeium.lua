return {
    {
      "Exafunction/codeium.vim",
      event = "InsertEnter",
      -- stylua: ignore
      config = function ()
        vim.g.codeium_disable_bindings = 1
        local keymap = vim.keymap.set
        keymap("i", "<A-g>", function() return vim.fn["codeium#Accept"]() end, { expr = true })
        keymap("i", "<A-c>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true })
        keymap("i", "<A-h>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true })
        keymap("i", "<A-l>", function() return vim.fn["codeium#Clear"]() end, { expr = true })
        keymap("i", "<A-s>", function() return vim.fn["codeium#Complete"]() end, { expr = true })
      end,
    },
  }