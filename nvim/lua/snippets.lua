vim.keymap.set("n", "html", ":-1read $HOME/.config/nvim/lua/snippets/skeleton.html<CR>")

vim.keymap.set("n", "rafce", function()
  local filename = vim.fn.expand("%:t:r")

  local path = vim.fn.expand("$HOME/.config/nvim/lua/snippets/rafce.jsx")
  local lines = vim.fn.readfile(path)

  for i, line in ipairs(lines) do
    lines[i] = line:gsub("__COMPONENT__", filename)
  end

  vim.fn.append(vim.fn.line(".") - 1, lines)
end, { desc = "rafce" })


