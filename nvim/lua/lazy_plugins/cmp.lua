return {
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                completion = {
                    autocomplete = false, -- disable for a now to become better:)
                },
                mapping = {
                    ["<Down>"] = cmp.mapping.select_next_item(), 
                    ["<Up>"] = cmp.mapping.select_prev_item(), 
                    ["<C-j>"] = cmp.mapping.select_next_item(), 
                    ["<C-k>"] = cmp.mapping.select_prev_item(), 
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), 
                },
                sources = {
                    { name = "nvim_lsp" },
                },
            })
        end,
    },

	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
}
