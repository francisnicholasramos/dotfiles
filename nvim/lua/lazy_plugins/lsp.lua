return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/nvim-cmp",
        },
        event = { "BufReadPre", "BufNewFile" }, -- lazy load 
        config = function()
            vim.diagnostic.config({
                signs = true,
                virtual_text = false,
                underline = true,
                update_in_insert = false,
            })

            vim.api.nvim_create_autocmd("CursorHold", {
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

            local servers = require("mason-lspconfig").get_installed_servers()

            for _, server in ipairs(servers) do
                vim.lsp.config[server] = {
                    on_attach = on_attach,
                    capabilities = capabilities,
                }
            end

            for _, server in ipairs(servers) do
                vim.lsp.enable(server)
            end
        end,
    },
}
