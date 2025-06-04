vim.g.mapleader = " "

vim.g.netrw_banner = 0            -- optional: hides the banner
vim.g.netrw_liststyle = 3         -- optional: tree-style listing
vim.g.netrw_browse_split=4
vim.g.netrw_altv = 1

-- vim.cmd("cd D:/")
vim.cmd("colorscheme habamax")

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
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })  
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
vim.api.nvim_create_autocmd("FileType", {
	pattern = {"html", "javascript", "typescript", "javascriptreact", "typescriptreact", "python", "java", "lua"},
	callback = function()
		vim.keymap.set("i", "'", "''<Left>", { buffer = true})
		vim.keymap.set("i", "(", "()<Left>", { buffer = true })
		vim.keymap.set("i", "[", "[]<Left>", { buffer = true })
		vim.keymap.set("i", "{", "{}<Left>", { buffer = true })
		vim.keymap.set("i", '"', '""<Left>', { buffer = true })
	end,
})

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

vim.cmd([[
	cd D:/
	set path+=**
  filetype plugin indent on 
  syntax enable
]])

-- Statusbar
vim.cmd "highlight StatusNormal guibg=#aeae1e guifg=#1d2021"
vim.cmd "highlight StatusInsert guibg=#458588 guifg=#1d2021"
vim.cmd "highlight StatusVisual guibg=#ff9900 guifg=#1d2021"
vim.cmd "highlight StatusTerminal guibg=#458588 guifg=#1d2021"
vim.cmd "highlight NormalTerminal guibg=#aeae1e guifg=#1d2021"
vim.cmd "highlight StatusCommand guibg=#aeae1e guifg=#1d2021"
 
vim.cmd "highlight StatusType guibg=#b16286 guifg=#1d2021" -- pink
vim.cmd "highlight StatusFile guibg=none guifg=#ebdbb2"
-- vim.cmd "highlight StatusFile guibg=#fabd2f guifg=#1d2021" -- mustard yellow
vim.cmd "highlight StatusModified guibg=#1d2021 guifg=#d3869b"
vim.cmd "highlight StatusBuffer guibg=#98971a guifg=#1d2021" -- yellow green
vim.cmd "highlight StatusLocation guibg=#458588 guifg=#1d2021" -- blue green
vim.cmd "highlight StatusPercent guibg=#1d2021 guifg=#ebdbb2"
vim.cmd "highlight StatusNorm guibg=none guifg=white"
vim.cmd "highlight StatusGit guibg=#66aeb2 guifg=#1d2021"
-- vim.cmd "highlight StatusGit guibg=#83a598 guifg=#1d2021"

local mode_map = {
  n = { "NORMAL", "%#StatusNormal#" },
  i = { "INSERT", "%#StatusInsert#" },
  v = { "VISUAL", "%#StatusVisual#" },
  V = { "V-LINE", "%#StatusVisual#" },
  [""] = { "V-BLOCK", "%#StatusVisual#" },
  c = { "COMMAND", "%#StatusCommand#" },
  R = { "REPLACE", "%#StatusReplace#" },
  t = { "TERMINAL", "%#StatusTerminal#" },
	nt = { "TERMINAL n", "%#NormalTerminal#" },
}

local function get_git_branch()
  local cwd = vim.fn.expand('%:p:h') -- Get full path of current file's directory
  local git_dir = vim.fn.finddir('.git', cwd .. ';')
  if git_dir == '' then
    return ''
  end

  local git_root = vim.fn.fnamemodify(git_dir, ':h')
  local branch_file = git_root .. '/.git/HEAD'
  local file = io.open(branch_file)

  if file then
    local head = file:read("*l")
    file:close()
    local branch = head:match("ref: refs/heads/(.+)")
    if branch then
      return "%#StatusGit#  " .. branch .. " "
    end
  end

  return ''
end

-- Function to update statusline
local function update_statusline()
  local mode = vim.api.nvim_get_mode().mode
  local mode_info = mode_map[mode] or { "OTHER", "%#StatusNorm#" }

  vim.o.statusline =
    mode_info[2] .. " " .. mode_info[1] .. " "
		.. get_git_branch()
    .. "%#StatusFile#"
    .. " %<%.70F"
    .. "%#StatusModified#"
    .. " %m"
    .. "%#StatusNorm#"
    .. "%="
    .. "%#StatusType#"
    .. " "
    .. " %y "
    .. "%#StatusBuffer#"
    .. "  %n  "
    .. "%#StatusLocation#"
    .. "  %l,%c  "
    .. "%#StatusPercent#"
    .. " %p%% "
    .. "%#StatusGit#"
end

-- Update on VimEnter, ModeChanged, and BufEnter
vim.api.nvim_create_autocmd({ "ModeChanged", "BufEnter", "DirChanged", "VimEnter" }, {
  callback = update_statusline,
})
