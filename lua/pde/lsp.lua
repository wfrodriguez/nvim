return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
        opts = {
            ui = { border = 'double', }
        }
    },
    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            -- { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason-lspconfig.nvim' },
        },
        config = function()
            -- This is where all the LSP shenanigans will live
            local lspZero = require('lsp-zero')
            local lspConfig = require('lspconfig')
            -- local settings = require('utils.lspsettings')
            lspZero.extend_lspconfig()
            lspZero.on_attach(function(client, bufnr)
                -- nvim-navic
                if client.server_capabilities.documentSymbolProvider then
                    local navic = require "nvim-navic"
                    navic.attach(client, bufnr)
                end
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lspZero.default_keymaps({ buffer = bufnr })
            end)
            require('mason-lspconfig').setup({
                ensure_installed = { 'lua_ls', 'gopls' },
                handlers = {
                    lspZero.default_setup,
                    --[[lua_ls = function()
                        lspConfig.lua_ls.setup(lspZero.nvim_lua_ls())
                    end,--]]
                }
            })
        end
    }
}