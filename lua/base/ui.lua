return {
  {
    "nvim-tree/nvim-web-devicons",
    dependencies = { "DaikyXendo/nvim-material-icon" },
    config = function()
      require("nvim-web-devicons").setup {
        override = require("nvim-material-icon").get_icons(),
      }
    end,
  },
  {
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nord").setup {}
      vim.cmd.colorscheme "nord"
    end,
  },
  install = {
    colorscheme = { "nord" },
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    event = "VeryLazy",
    enabled = true,
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            find = "%d+L, %d+B",
          },
          view = "mini",
        },
      },
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = true, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    },
    --stylua: ignore
    keys = {
      { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
      { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll forward" },
      { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll backward"},
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "meuter/lualine-so-fancy.nvim",
    },
    lazy = false,
    opts = {
      options = {
        theme = "nord",
        component_separators = { left = "│", right = "│" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
        refresh = {
          statusline = 100,
        },
      },
      sections = {
        lualine_a = {
          { "fancy_mode", width = 3 },
        },
        lualine_b = {
          { "fancy_branch" },
          { "fancy_diff" },
        },
        lualine_c = {
          { "fancy_cwd", substitute_home = true },
        },
        lualine_x = {
          { "fancy_macro" },
          { "fancy_diagnostics" },
          { "fancy_searchcount" },
          { "fancy_location" },
        },
        lualine_y = {
          { "fancy_filetype", ts_icon = " " },
        },
        lualine_z = {
          { "fancy_lsp_servers" },
        },
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "gbprod/nord.nvim",
    },
    version = "*",
    event = "VeryLazy",
    opts = {
      options = {
        separator_style = "thin",
        buffer_close_icon = "󰅖 ",
        modified_icon = "● ",
        close_icon = " ",
        left_trunc_marker = " ",
        right_trunc_marker = " ",
      },
      -- highlights = require("nord.plugins.bufferline").akinsho(),
    },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}, -- this is equalent to setup({}) function
  },
  {
    "smoka7/hop.nvim",
    event = "VeryLazy",
    opts = {
      keys = "iretonasgpduyfchlmjwq",
      case_insensitive = false,
    },
    config = function(_, opts)
      require("hop").setup(opts)
      local keymap = vim.keymap.set
      keymap("n", "<leader>hw", "<cmd>HopWord<cr>", { desc = "Hop Word" })
      keymap("n", "<leader>hc", "<cmd>HopChar2<cr>", { desc = "Hop Char" })
      keymap("n", "<leader>hl", "<cmd>HopLine<cr>", { desc = "Hop Line" })
    end,
  },
  {
    "liuchengxu/vista.vim",
    config = function(_, opts)
      vim.g.vista_ctags_cmd = {
        go = "gotags",
      }
      vim.g.vista_echo_cursor = 0
      vim.keymap.set("n", "<leader>tt", "<cmd>Vista!!<CR>", { desc = "Toggle Vista Tags" })
    end,
    lazy = false,
    cmd = "Vista",
  },
}
