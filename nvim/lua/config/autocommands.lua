vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		if
			vim.bo.filetype == "typescript"
			or vim.bo.filetype == "typescriptreact"
			or vim.bo.filetype == "javascript"
			or vim.bo.filetype == "javascriptreact"
		then
			vim.cmd("TSToolsOrganizeImports")
		end
	end,
})
