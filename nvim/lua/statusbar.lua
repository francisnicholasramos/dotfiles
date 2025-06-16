    -- Gruvbox theme -- 
 -- orange: #d65d0e
 -- red: #cc241d
 -- yellow green: #98971a
 -- yellow: #d79921
 -- blue: #458588 
 -- pink: #b16286
 -- green: #689d6a

-- Statusbar
vim.cmd "highlight StatusNormal guibg=#aeae1e guifg=#1d2021"
vim.cmd "highlight StatusInsert guibg=#458588 guifg=#1d2021"
vim.cmd "highlight StatusVisual guibg=#ff9900 guifg=#1d2021"
vim.cmd "highlight StatusTerminal guibg=#458588 guifg=#1d2021"
vim.cmd "highlight NormalTerminal guibg=#aeae1e guifg=#1d2021"
vim.cmd "highlight StatusCommand guibg=#aeae1e guifg=#1d2021"
 
vim.cmd "highlight StatusType guibg=#b16286 guifg=#1d2021" -- pink
vim.cmd "highlight StatusFile guibg=#1d2021 guifg=#ebdbb2"
-- vim.cmd "highlight StatusFile guibg=#fabd2f guifg=#1d2021" -- mustard yellow
vim.cmd "highlight StatusModified guibg=#1d2021 guifg=#d3869b"
vim.cmd "highlight StatusBuffer guibg=#98971a guifg=#1d2021" -- yellow green
vim.cmd "highlight StatusLocation guibg=#458588 guifg=#1d2021" -- blue green
vim.cmd "highlight StatusPercent guibg=#1d2021 guifg=#ebdbb2"
vim.cmd "highlight StatusNorm guibg=#1d2021 guifg=white"
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


