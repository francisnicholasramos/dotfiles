return {
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        event = "BufRead",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "typescript", "javascript", "bash", "html"
                },

                highlight = { 
                    enable = false,

                    disable = function(lang, buf)
                        local max_filesize = 20 * 1024 -- 100 KB
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end
                    end,
                },

                indent = { 
                    enable = true, 
                    disable = { "html" } 
                },
            })
        end,
    },
}
