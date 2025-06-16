vim.lsp.config.clangd = {
  cmd = { 'typescript-language-server', '--stdio' },
  root_markers = { 'compile_commands.json', 'compile_flags.txt' },
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
}

vim.lsp.enable({'typescript-language-server'})

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = ture })
			end
		end,
})
