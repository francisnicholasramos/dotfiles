local function center_text(lines)
    local win_width = vim.api.nvim_get_option("columns")
    local win_height = vim.api.nvim_get_option("lines")
    local centered_lines = {}

    local start_line = math.floor((win_height - #lines) / 2)

    for i = 1, start_line do
        table.insert(centered_lines, "")
    end

    for _, line in ipairs(lines) do
        local padding = math.floor((win_width - #line) / 2)
        table.insert(centered_lines, string.rep(" ", padding) .. line)
    end

    return centered_lines
end

local dashboard_text = {
    "      ##############################",
    "      ##   +                  +   ##",
    "      ##       ^-----^            ##",
    "     ##       |=\".\"=|            ##",
    "      ##       (_   _)~        +  ##",
    "      ##############################",
    "               Hello, niko!         ",
}

local function show_dashboard()
    if vim.fn.argc() == 0 then -- Only show if no file is opened
        vim.cmd("enew") -- Create a new empty buffer
        vim.api.nvim_buf_set_option(0, "buftype", "nofile")
        vim.api.nvim_buf_set_option(0, "bufhidden", "hide")
        vim.api.nvim_buf_set_option(0, "swapfile", false)

        local centered_text = center_text(dashboard_text)
        vim.api.nvim_buf_set_lines(0, 0, -1, false, centered_text)

        vim.api.nvim_win_set_option(0, "number", false)
        vim.api.nvim_win_set_option(0, "relativenumber", false)
        vim.api.nvim_win_set_option(0, "cursorline", false)
    end
end

vim.api.nvim_create_autocmd("VimEnter", {
    callback = show_dashboard,
})


