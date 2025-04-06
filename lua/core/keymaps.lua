print("Neovim BTW!")

vim.cmd("cd D:/")

vim.opt.number = true -- set line number
vim.opt.cursorline = true -- show which line your cursor is on

-- Key Maps
vim.g.mapleader = " "
vim.keymap.set('n', '<leader>w', ':w<CR>') -- save
vim.keymap.set('n', '<leader>q', ':q<CR>') -- quit 
vim.keymap.set('n', '<leader>t', ':terminal<CR>') -- terminal/shell
vim.keymap.set('n', '<leader>vv', ':Vex<cr>') -- vertical tab
vim.keymap.set('n', '<leader>ss', ':Sex<cr>') -- horizontal tab
vim.keymap.set('n', 'cf', ':e C:/Users/niko/AppData/Local/nvim/lua/plugins/plugin_config.lua<cr>') -- init.lua
vim.keymap.set('n', ';', ':', { noremap = true }) -- command mode
vim.keymap.set('n', '[', ':bp<cr>') -- previous tab
vim.keymap.set('n', ']', ':bn<cr>') -- next tab
vim.keymap.set('n', '<leader>bd', ':bd<cr>') -- kill/exit current buffer
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>") -- clear highlights on search when pressing
vim.keymap.splitright = true -- configure how new splits should be opened 
vim.keymap.splitbelow = true -- configure how new splits should be opened 
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent =  true }) -- exit terminal mode
vim.keymap.set('n', '<leader>bd', '<C-\\><C-n>:bd!<CR>', { noremap = true, silent = true }) -- kill terminal
vim.keymap.set('v', '<leader>y', '"+y') -- copy a line (visual mode) and can be paste outside nvim
vim.keymap.set('n', '<leader>p', '"+p') -- paste something you copy outside the vim
vim.keymap.set('n', '=p', '"+gP', { noremap = true, silent = true}) -- paste something you copy outside the vim
vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format() end, { noremap = true, silent = true, }) -- format lua files


-- Indentation
vim.o.autoindent = true   -- Enable auto indentation
vim.o.smartindent = true  -- Enable smart indentation
vim.o.expandtab = true    -- Convert tabs to spaces
vim.o.shiftwidth = 2      -- Number of spaces for indentation
vim.o.tabstop = 2         -- Number of spaces for a tab

-- NvimTreeToggle
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })

-- Hover an errors
vim.o.updatetime = 200 -- Reduce delay for CursorHold event
vim.api.nvim_create_autocmd("CursorHold", {
  pattern = "*",
  callback = function()
    vim.diagnostic.open_float(nil, {
      focusable = false,  -- Prevents window from taking focus
      prefix = "* ",       -- Bullet for readability
    })
  end,
})

vim.cmd [[
  hi DiagnosticUnderlineError guisp=#E57373 gui=undercurl
]
