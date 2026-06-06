return {
    {
        "neovim/nvim-lspconfig",
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
                local config = {
                    on_attach = on_attach,
                    capabilities = capabilities,
                }

                if server == "phpactor" then
                    config.filetypes = { "php", "blade" }
                end
                vim.lsp.config[server] = config
                vim.lsp.enable(server)
            end
        end,
    },
}
