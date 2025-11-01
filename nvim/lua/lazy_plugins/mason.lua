return {
    {
        "williamboman/mason.nvim",
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensured_installed = {
                    "html",
                    "cssls",
                    "ts_ls",
                    "jsonls",
                    "emmet-ls",
                    "tailwindcss",

                     -- "clangd",
                     -- "cssls",
                     -- "emmet_ls",
                     -- "eslint",
                     -- "html",
                     -- "jdtls",
                     -- "jsonls",
                     -- "pyright",
                     -- "tailwindcss",
                     -- "ts_ls",

                    

                    -- ** Manually install **
                    -- MasonInstall prettier@2.8.8
                },
                automatic_enable = false,
            })      

        end,			
    },
}
