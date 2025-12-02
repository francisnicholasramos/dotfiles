return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim"},
        keys = {
            { "<leader>a", function() require("harpoon").list():add() end},
            { "<C-e>", function() require("harpoon.ui").toggle_quick_menu(require("harpoon").list()) end},
            { "<leader>1", function() require("harpoon").list():select(1) end},
            { "<leader>2", function() require("harpoon").list():select(2) end},
            { "<leader>3", function() require("harpoon").list():select(3) end},
            { "<leader>4", function() require("harpoon").list():select(4) end},
        },
        config = function()
            local harpoon = require("harpoon")
            harpoon:setup()

            vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
            vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
        end,
    },
}
