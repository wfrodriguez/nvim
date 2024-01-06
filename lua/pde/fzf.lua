return {
    {
        'ibhagwan/fzf-lua',
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VeryLazy",
        config = function(_, opts)
            -- calling `setup` is optional for customization
            require("fzf-lua").setup(opts)
            local keymap = vim.keymap.set
            keymap("n", "<leader>ff", '<cmd>FzfLua files<CR>', {desc='Files'})
            keymap("n", "<leader>fb", '<cmd>FzfLua buffers<CR>', {desc='Buffers'})
            keymap("n", "<leader>fh", '<cmd>FzfLua oldfiles<CR>', {desc='History'})
            keymap("n", "<leader>fl", '<cmd>FzfLua blines<CR>', {desc='Lines in buffer'})
            keymap("n", "<leader>fs", '<cmd>FzfLua live_grep<CR>', {desc='Live search'})
            keymap("n", "<leader>ft", '<cmd>FzfLua btags<CR>', {desc='Tags in buffer'})
            keymap("n", "<leader>fc", '<cmd>FzfLua git_commits<CR>', {desc='Git commits'})
            keymap("n", "<leader>fa", '<cmd>FzfLua help_tags<CR>', {desc='Neovim help'})
            keymap("n", "<leader>fm", '<cmd>FzfLua marks<CR>', {desc='Marks'})
            keymap("n", "<leader>fj", '<cmd>FzfLua jumps<CR>', {desc='Jumps'})
            keymap("n", "<leader>fk", '<cmd>FzfLua keymaps<CR>', {desc='Keymaps'})
        end
    }
}