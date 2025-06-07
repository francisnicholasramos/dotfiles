vim.g.mapleader = " "

vim.opt.number = true 
vim.opt.hlsearch = true
vim.opt.wrap = true
vim.opt.autoindent = true 
vim.opt.smartindent = true 
vim.opt.expandtab = true 
vim.opt.shiftwidth = 2 
vim.opt.tabstop = 2 
vim.opt.cursorline = true 
vim.opt.splitright = true 
vim.opt.splitbelow = true 
vim.opt.clipboard = "unnamedplus" 
vim.opt.updatetime = 200 
vim.opt.wildmenu = true
vim.opt.wildmode = { "longest:full", "full" }

vim.keymap.set("n", "<leader>w", ":w<CR>") 
vim.keymap.set("n", "<leader>q", ":q<CR>") 
vim.keymap.set("n", "<leader>t", ":Sex<CR> | :terminal<CR>") 
vim.keymap.set("n", "<leader>vv", ":vsp<cr>") 
vim.keymap.set("n", "<leader>ss", ":sp<cr>") 
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true }) 
-- vim.keymap.set("n", "cf", ":e ~/.config/nvim/lua/plugins/plugin_config.lua<cr>") 
vim.keymap.set("n", "cf", ":e C:/Users/niko/AppData/Local/nvim/lua/plugins.lua<cr>") 
vim.keymap.set("n", ";", ":", { noremap = true }) 
vim.keymap.set("n", "[", ":bp<cr>") 
vim.keymap.set("n", "]", ":bn<cr>") 
vim.keymap.set("n", "<leader>bd", ":bd<cr>") 
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>") 
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true }) 
vim.keymap.set("n", "<Tab>", "<C-w>") 
vim.keymap.set("n", "<leader>a", "ggVG") 
vim.keymap.set("v", "<Tab>", ">gv") 
-- vim.keymap.set("n", "<leader>w", ":w<CR>|:Prettier<CR>") -- prettier
vim.keymap.set("v", "y", "myy`y", { noremap = true, silent = true }) -- keep the cursor after yank
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
vim.keymap.set("n", "<leader>ff", ":FzfLua files<CR>")
vim.keymap.set("n", "<leader><leader>", ":FzfLua buffers<CR>")
vim.keymap.set("n", "<leader>rf", ":FzfLua oldfiles<CR>")
vim.keymap.set("n", "<leader>gr", ":FzfLua grep_project<CR>")

vim.cmd([[
  cd D:/
  set path+=**
  filetype plugin indent on
  syntax enable
  hi DiagnosticUnderlineError guisp=#E57373 gui=undercurl
]])

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
vim.api.nvim_create_autocmd("CursorHold", {
	pattern = "*",
	callback = function()
		vim.diagnostic.open_float(nil, {
			focusable = false, -- Prevents window from taking focus
			prefix = "* ", -- Bullet for readability
		})
	end,
})

