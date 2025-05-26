vim.g.mapleader = " "

vim.g.netrw_banner = 0            -- optional: hides the banner
vim.g.netrw_liststyle = 3         -- optional: tree-style listing
vim.g.netrw_browse_split=4
vim.g.netrw_altv = 1

-- vim.cmd("cd D:/")
vim.cmd("colorscheme habamax")

-- vim.opt.syntax = "ON"
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
vim.opt.wildmenu = true 
vim.opt.wildmode = { "longest:full", "full" }
vim.opt.title = true

vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>q', ':q<CR>')
vim.keymap.set('n', '<leader>bd', ':bd<CR>')

vim.keymap.set('n', '<Esc>', ':noh<CR>')
vim.keymap.set('n', '<leader>a', 'ggVG')
vim.keymap.set('n', ';', ':')
-- vim.keymap.set("n", "cf", ":e C:/Users/niko/AppData/Local/nvim/init.lua<CR>")
-- vim.keymap.set("n", "<leader>ww", ":source C:/Users/niko/AppData/Local/nvim/init.lua<cr>")
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<leader>vv', ':vsp<CR>')
vim.keymap.set('n', '<leader>ss', ':sp<CR>')
vim.keymap.set("n", "<leader>t", ":Sex<CR> | :terminal<CR>")
vim.keymap.set('v', 'K', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('v', 'J', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })  
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ff", ":FzfLua files<CR>")
vim.keymap.set("n", "<leader><leader>", ":FzfLua buffers<CR>")
vim.keymap.set("n", "<leader>rf", ":FzfLua oldfiles<CR>")
vim.keymap.set("n", "<leader>gr", ":FzfLua grep_project<CR>")

-- Open file explorer 25%
vim.keymap.set('n', '<leader>e', function()
  if vim.bo.filetype == 'netrw' then
    vim.cmd('bd')
  else
    vim.cmd('25Lex %:p:h')  
  end
end, { noremap = true, silent = true })

-- Autocomplete for pairs
vim.keymap.set("i", "'", "''<Left>")
vim.keymap.set("i", "(", "()<Left>")
vim.keymap.set("i", "[", "[]<Left>")
vim.keymap.set("i", "{", "{}<Left>")
vim.keymap.set("i", '"', '""<Left>')

-- Javascript/TypeScript/JsReact/TsScript
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"javascript", "typescript", "javascriptreact", "typescriptreact"},
  callback = function()
    vim.keymap.set('i', 'af<Esc>', 'const @ = () => {\n\n}<Left><Up><Tab>', { buffer = true })
		vim.keymap.set('i', 'fn<Esc>', 'function @() {\n\n}<Left><Up><Tab>', { buffer = true })
		vim.keymap.set('i', 'if<Esc>', 'if () {\n\n}<Left><Up><Tab>', { buffer = true }) 
		vim.keymap.set('i', 'for<Esc>', 'for () {\n\n}<Left><Up><Tab>', { buffer = true })
		vim.keymap.set('i', 'sw<Esc>', 'switch () {\n\n}<Left><Up><Tab>', { buffer = true }) 
		vim.keymap.set('i', 'cl<Esc>', 'class @ {\n\n}<Left><Up><Tab>', { buffer = true }) 
		vim.keymap.set('i', 'wh<Esc>', 'while () {\n\n}<Left><Up><Tab>', { buffer = true })
		vim.keymap.set('i', 'do<Esc>', 'do {\n\n}\nwhile ()<Left><Left><Left><Left><Left><Left><Left><Left><Left><Up><Up><Tab>', { buffer = true })
  end,
})

-- auto indent for filetype like js, py, and, etc..
vim.cmd([[
  filetype plugin indent on 
  syntax enable
]])
