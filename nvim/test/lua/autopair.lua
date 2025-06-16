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
    vim.keymap.set('i', 'ar<Tab>', 'const @ = () => {\n\n}<Left><Up><Tab>', { buffer = true })
		vim.keymap.set('i', 'fn<Tab>', 'function @() {\n\n}<Left><Up><Tab>', { buffer = true })
		vim.keymap.set('i', 'if<Tab>', 'if () {\n\n}<Left><Up><Tab>', { buffer = true }) 
		vim.keymap.set('i', 'for<Tab>', 'for () {\n\n}<Left><Up><Tab>', { buffer = true })
		vim.keymap.set('i', 'sw<Tab>', 'switch () {\n\n}<Left><Up><Tab>', { buffer = true }) 
		vim.keymap.set('i', 'cl<Tab>', 'class @ {\n\n}<Left><Up><Tab>', { buffer = true }) 
		vim.keymap.set('i', 'wh<Tab>', 'while () {\n\n}<Left><Up><Tab>', { buffer = true })
		vim.keymap.set('i', 'do<Tab>', 'do {\n\n}\nwhile ()<Left><Left><Left><Left><Left><Left><Left><Left><Left><Up><Up><Tab>', { buffer = true })
  end,
})


