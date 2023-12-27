return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    cmd = "Telescope",
    -- stylua: ignore
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Git Files" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
      { "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Search text" },
      { "<leader>ft", "<cmd>lua require('utils.telescopeTags').Tags()<cr>", desc = "Search tags" },
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = function(...)
              require("telescope.actions").move_selection_next(...)
            end,
            ["<C-k>"] = function(...)
              require("telescope.actions").move_selection_previous(...)
            end,
            ["<C-n>"] = function(...)
              require("telescope.actions").cycle_history_next(...)
            end,
            ["<C-p>"] = function(...)
              require("telescope.actions").cycle_history_prev(...)
            end,
          },
        },
      },
    },
    config = function(_, opts)
      local telescope = require "telescope"
      telescope.setup(opts)
      telescope.load_extension "fzf"
    end,
  },
  {
    "chentoast/marks.nvim",
    lazy = false,
    config = function()
      require("marks").setup()
    end,
  },
  {
    "Vonr/align.nvim",
    branch = "v2",
    lazy = true,
    init = function()
      local NS = { noremap = true, silent = true, desc = "" }

      -- Aligns to 1 character
      NS.desc = "Aligns to 1 character"
      vim.keymap.set("x", "aa", function()
        require("align").align_to_char {
          length = 1,
        }
      end, NS)

      -- Aligns to 2 characters with previews
      NS.desc = "Aligns to 2 characters with previews"
      vim.keymap.set("x", "ad", function()
        require("align").align_to_char {
          preview = true,
          length = 2,
        }
      end, NS)

      -- Aligns to a string with previews
      NS.desc = "Aligns to a string with previews"
      vim.keymap.set("x", "aw", function()
        require("align").align_to_string {
          preview = true,
          regex = false,
        }
      end, NS)

      --Aligns to a string with previews
      NS.desc = "Aligns to a string with previews"
      vim.keymap.set("x", "ar", function()
        require("align").align_to_string {
          preview = true,
          regex = true,
        }
      end, NS)

      --Aligns to a string with previews
      NS.desc = "Aligns to a string with previews"
      vim.keymap.set("n", "gaw", function()
        local a = require "align"
        a.operator(a.align_to_string, {
          regex = false,
          preview = true,
        })
      end, NS)

      -- Example gaaip to align a paragraph to 1 character
      NS.desc = "Example gaaip to align a paragraph to 1 character"
      vim.keymap.set("n", "gaa", function()
        local a = require "align"
        a.operator(a.align_to_char)
      end, NS)
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
      defaults = {
        mode = { "n", "v" },
        ["<leader>f"] = { name = "+File" },
        ["<leader>q"] = { name = "+Quit/Session" },
        ["<leader>qq"] = { cmd = "<cmd>q<cr>", desc = "Quit" },
      },
    },
    config = function(_, opts)
      local wk = require "which-key"
      wk.setup(opts)
      wk.register(opts.defaults)
    end,
  },
  {
    "folke/zen-mode.nvim",
    event = "VeryLazy",
  },
}
