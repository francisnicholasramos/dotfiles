return {
    "williamboman/mason.nvim",
    dependencies = {
        {
            "williamboman/mason-lspconfig.nvim",
            config = function()
                require("mason-lspconfig").setup({
                    ensure_installed = {
                        "html",
                        "cssls",
                        "ts_ls",
                        "eslint",
                        "tailwindcss",
                        "phpactor",
                        "intelephense",

                        -- "html",
                        -- "cssls",
                        -- "ts_ls",
                        -- "eslint",
                        -- "tailwindcss",
                        -- "phpactor",
                        -- "intelephense",
                        -- "blade-formatter",
                        -- "pyright",
                        -- "laravel_ls",
                        -- "lua_ls"
                        -- "clangd",
                        -- "jdtls",
                        -- "jsonls",
                        -- "emmet_ls",



                        -- ** Manually install **
                        -- MasonInstall prettier@2.8.8
                    },
                    automatic_enable = false,
                })
            end,
        }
    },
    cmd = {"Mason"},
    config = function()
        require("mason").setup()
    end
}
