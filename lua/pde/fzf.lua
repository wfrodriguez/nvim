return {
    {
        'ibhagwan/fzf-lua',
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VeryLazy",
        config = function(_, opts)
            -- calling `setup` is optional for customization
            require("fzf-lua").setup(opts)
            vim.keymap.set("n", "<leader>ff", '<cmd>FzfLua files<CR>', {desc='Files'})
            vim.keymap.set("n", "<leader>fb", '<cmd>FzfLua buffers<CR>', {desc='Buffers'})
            vim.keymap.set("n", "<leader>fh", '<cmd>FzfLua oldfiles<CR>', {desc='History'})
            vim.keymap.set("n", "<leader>fl", '<cmd>FzfLua blines<CR>', {desc='Lines in buffer'})
            vim.keymap.set("n", "<leader>fs", '<cmd>FzfLua live_grep<CR>', {desc='Live search'})
            vim.keymap.set("n", "<leader>ft", '<cmd>FzfLua btags<CR>', {desc='Tags in buffer'})
            vim.keymap.set("n", "<leader>fc", '<cmd>FzfLua git_commits<CR>', {desc='Git commits'})
            vim.keymap.set("n", "<leader>fa", '<cmd>FzfLua help_tags<CR>', {desc='Neovim help'})
            vim.keymap.set("n", "<leader>fm", '<cmd>FzfLua marks<CR>', {desc='Marks'})
            vim.keymap.set("n", "<leader>fj", '<cmd>FzfLua jumps<CR>', {desc='Jumps'})
            vim.keymap.set("n", "<leader>fk", '<cmd>FzfLua keymaps<CR>', {desc='Keymaps'})
        end
    }
}