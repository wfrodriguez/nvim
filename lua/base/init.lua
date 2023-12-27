return {
  { "tpope/vim-sleuth", event = "VeryLazy" },
  { "tpope/vim-repeat", event = "VeryLazy" },
  { "nvim-lua/plenary.nvim" },
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "GBrowse", "Gdiffsplit", "Gvdiffsplit" },
    dependencies = {
      "tpope/vim-rhubarb",
    },
    -- stylua: ignore
    keys = {
      { "<leader>gs", "<cmd>Git<cr>", desc = "Status" },
    },
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help" } },
    -- stylua: ignore
    keys = {
      { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
  },
  { "akinsho/toggleterm.nvim", event = "VeryLazy", config = true },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      defaults = {
        ["<leader>g"] = { name = "+Git" },
        ["<leader>s"] = {
          name = "+Search",
          c = {
            function()
              require("utils.cht").cht()
            end,
            "Cheatsheets",
          },
          s = {
            function()
              require("utils.cht").stack_overflow()
            end,
            "Stack Overflow",
          },
        },
      },
    },
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
  },
  {
    "stevearc/oil.nvim",
    event = "VeryLazy",
    opts = {
      columns = {
        "icon",
        "permissions",
        "size",
        "mtime",
      },
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function(_, opts)
      require("oil").setup(opts)
      vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
    end,
  },
}
