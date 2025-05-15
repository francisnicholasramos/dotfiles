vim.cmd("cd D:/")
vim.opt.number = true -- set line number
vim.opt.cursorline = true -- show which line your cursor is on
vim.opt.splitright = true -- configure how new splits should be opened
vim.opt.splitbelow = true -- configure how new splits should be opened
vim.opt.clipboard = "unnamedplus" -- system clipboard

-- Key Maps
vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>w", ":w<CR>|:Prettier<CR>") -- save with prettier format
vim.keymap.set("n", "<leader>w", ":w<CR>") -- save
vim.keymap.set("n", "<leader>q", ":q<CR>") -- quit
vim.keymap.set("n", "<leader>t", ":Sex<CR> | :terminal<CR>") -- terminal/shell
vim.keymap.set("n", "<leader>vv", ":vsplit<cr>") -- vertical tab
vim.keymap.set("n", "<leader>ss", ":Sex<cr>") -- horizontal tab
vim.keymap.set("n", "cf", ":e ~/.config/nvim/lua/plugins/plugin_config.lua<cr>") -- linux
vim.keymap.set("n", "cf", ":e C:/Users/niko/AppData/Local/nvim/lua/plugins/plugin_config.lua<cr>") -- windows
vim.keymap.set("n", ";", ":", { noremap = true }) -- command mode
vim.keymap.set("n", "[", ":bp<cr>") -- previous tab
vim.keymap.set("n", "]", ":bn<cr>") -- next tab
vim.keymap.set("n", "<leader>bd", ":bd<cr>") -- kill/exit current buffer
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>") -- clear highlights on search when pressing
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true }) -- exit terminal mode
vim.keymap.set("n", "<leader>bd", "<C-\\><C-n>:bd!<CR>", { noremap = true, silent = true }) -- kill terminal
vim.keymap.set("v", "<leader>y", '"+y') -- copy a line (visual mode) and can be paste outside nvim
vim.keymap.set("n", "<leader>p", '"+p') -- paste something you copy outside the vim
vim.keymap.set("n", "=p", '"+gP', { noremap = true, silent = true }) -- paste something you copy outside the vim
vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format()
end, { noremap = true, silent = true }) -- format lua files
vim.keymap.set("n", "<Tab>", "<C-w>") -- switch windows with ease (buffer)
vim.keymap.set("n", "<leader>a", "ggVG") -- select all command
vim.keymap.set("v", "<Tab>", ">gv") -- indent forward (right)
vim.keymap.set("v", "<S-Tab>", "<gv") -- indent backward (left)
vim.keymap.set("v", "y", "myy`y", { noremap = true, silent = true }) -- keep the cursor after yank

-- Indentation
vim.opt.autoindent = true -- Enable auto indentation
vim.opt.smartindent = true -- Enable smart indentation
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.shiftwidth = 2 -- Number of spaces for indentation
vim.opt.tabstop = 2 -- Number of spaces for a tab

-- NvimTreeToggle
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })

-- Fzf 
vim.keymap.set("n", "<leader>ff", ":FzfLua files<CR>")
vim.keymap.set("n", "<leader><leader>", ":FzfLua buffers<CR>")
vim.keymap.set("n", "<leader>rf", ":FzfLua oldfiles<CR>")
vim.keymap.set("n", "<leader>gr", ":FzfLua grep_project<CR>")

-- Multi-cursor
vim.g.VM_default_mappings = 0 -- disable default mappings
vim.g.VM_maps = {
  ["Find Under"]         = "<M-n>", -- Alt+m to select word under cursor
  ["Find Subword Under"] = "<M-n>", -- same for subwords
  ["Select All"]         = "<M-a>", -- Alt+a to select all occurrences
  ["Skip Region"]        = "<M-x>", -- Alt+x to skip current
  ["Remove Region"]      = "<M-q>", -- Alt+q to remove region
}

-- Hover an errors
vim.opt.updatetime = 200 -- Reduce delay for CursorHold event
vim.api.nvim_create_autocmd("CursorHold", {
	pattern = "*",
	callback = function()
		vim.diagnostic.open_float(nil, {
			focusable = false, -- Prevents window from taking focus
			prefix = "* ", -- Bullet for readability
		})
	end,
})

vim.cmd([[
  hi DiagnosticUnderlineError guisp=#E57373 gui=undercurl
]])
