return {
    {
        "ibhagwan/fzf-lua",
        cmd = "FzfLua",
        config = function()
            require('fzf-lua').setup({
                fzf_colors = {
                    true,
                },
            })
        end,
    },
}
