return {
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        event = "BufRead",
        config = function()
            require("nvim-treesitter.configs").setup({

                highlight = { 
                    enable = false 
                },

                indent = { 
                    enable = true, 
                    disable = { "html" } 
                },
            })
        end,
    },
}
