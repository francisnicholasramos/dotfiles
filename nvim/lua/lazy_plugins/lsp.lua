return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/nvim-cmp",
            "L3MON4D3/LuaSnip",
        },
        event = { "BufReadPre", "BufNewFile" }, -- lazy load 
        config = function()
            local lspconfig = require("lspconfig")

            vim.diagnostic.config({
                signs = true,
                virtual_text = false,
                underline = true,
                update_in_insert = false,
            })

            vim.api.nvim_create_autocmd("CursorHold", {
                pattern = "*",
                callback = function()
                    vim.diagnostic.open_float(nil, {
                        focusable = false, -- prevents window from taking focus
                        prefix = "* ", -- bullet 
                    })
                end,
            })

            local on_attach = function(client, bufnr)
                client.server_capabilities.semanticTokensProvider = nil -- respect colorscheme's syntax highlighting
                local opts = { noremap = true, silent = true, buffer = bufnr }
            end

            lspconfig.html.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            lspconfig.pyright.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            lspconfig.jdtls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            lspconfig.clangd.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            lspconfig.cssls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            lspconfig.ts_ls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            lspconfig.tailwindcss.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            lspconfig.eslint.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            -- Emmet
            lspconfig.emmet_ls.setup({
                filetypes = { "html", "css", "javascriptreact", "typescriptreact"},
                init_options = {
                    html = {
                        options = {
                            ["bem.enabled"] = true, -- Enable BEM support
                        },
                    },
                },
            })
        end,
    },
}
