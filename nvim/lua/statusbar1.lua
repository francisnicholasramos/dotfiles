vim.cmd "highlight StatusGit gui=bold" --#aeae1e

local function get_git_branch()
  local cwd = vim.fn.expand('%:p:h')
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
      return "%#StatusGit# " .. branch .. " "
    end
  end

  return ''
end

local function update_statusline()
  local default_statusline = vim.o.statusline 
  vim.o.statusline = default_statusline .. "%<%f %h%m%r%=%{%v:lua.get_git_branch()%}%*%y %l,%c "
end

_G.get_git_branch = get_git_branch

update_statusline()
