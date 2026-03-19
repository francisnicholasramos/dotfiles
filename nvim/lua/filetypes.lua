vim.api.nvim_create_autocmd("FileType", {
    pattern = {"css", "json"},
    callback = function()
        vim.opt.tabstop = 2
        vim.opt.softtabstop = 2
        vim.opt.shiftwidth = 2
    end,
})

vim.filetype.add({
    extension= {
        ejs = "html",
    },
})

vim.api.nvim_create_autocmd("BufRead", {
    pattern = "*.blade.php",
    callback = function()
        vim.bo.filetype = "html"
    end,
})
