vim.g.mapleader = " "

vim.g.netrw_banner = 0            -- optional: hides the banner
vim.g.netrw_liststyle = 3         -- optional: tree-style listing
vim.g.netrw_browse_split=4
vim.g.netrw_altv = 1

vim.opt.number = true
vim.opt.hlsearch = true
vim.opt.wrap = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.splitright = true
vim.opt.splitbelow = true 
vim.opt.termguicolors = true 
vim.opt.compatible = false
vim.opt.backup = false
vim.opt.wildmenu = true 
vim.opt.wildmode = { "longest:full", "full" }
vim.opt.completeopt = "menuone,noselect"

vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set("n", "<leader>ww", ":source C:/Users/niko/AppData/Local/nvim/init.lua<CR>")
vim.keymap.set('n', '<leader>q', ':q<CR>')
vim.keymap.set('n', '<leader>bd', ':bd<CR>')
vim.keymap.set('n', '<Esc>', ':noh<CR>')
vim.keymap.set('n', '<Tab>', '<C-w>')
vim.keymap.set('v', "<Tab>", ">gv")
vim.keymap.set('n', '<leader>a', 'ggVG')
vim.keymap.set('n', ';', ':')
vim.keymap.set("n", "cf", ":e C:/Users/niko/AppData/Local/nvim/init.lua<CR>")
vim.keymap.set("n", "<leader>ww", ":source C:/Users/niko/AppData/Local/nvim/init.lua<cr>")
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<leader>v', ':vsp<CR>')
vim.keymap.set('n', '<leader>s', ':sp<CR>')
vim.keymap.set("n", "<leader>t", ":Sex<CR> | :terminal<CR>")
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })  
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
vim.keymap.set("v", "y", "myy`y", { noremap = true, silent = true })
-- vim.keymap.set("n", '<leader>e', ":25Lex<CR>") -- for no plugin

vim.cmd([[
	cd D:/
	set path+=**
  filetype plugin indent on 
  syntax enable
]])

-- Fzf & NvimTree (plugin)
vim.keymap.set("n", "<leader>ff", ":FzfLua files<CR>")
vim.keymap.set("n", "<leader><leader>", ":FzfLua buffers<CR>")
vim.keymap.set("n", "<leader>rf", ":FzfLua oldfiles<CR>")
vim.keymap.set("n", "<leader>gr", ":FzfLua grep_project<CR>")
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })


vim.fn.sign_define("GitAdd", {text = "+", texthl = "DiffAdd"})
vim.fn.sign_define("GitChange", {text = "~", texthl = "DiffChange"})
vim.fn.sign_define("GitDelete", {text = "_", texthl = "DiffDelete"})
