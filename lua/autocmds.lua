vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		local ft = vim.bo.filetype
		if ft == "rust" or ft == "lua" or ft == "wgsl" then
			vim.lsp.buf.format({ async = false })
		end
	end,
})

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
	callback = function()
		vim.cmd("checktime")
	end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "WinLeave" }, {
	pattern = "*",
	callback = function()
		if vim.bo.modified and vim.bo.buflisted and vim.fn.expand("%") ~= "" then
			vim.cmd("silent! write")
		end
	end,
})
