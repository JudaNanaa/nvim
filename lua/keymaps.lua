-- Navigation
vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>")

-- LSP
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

-- Sauvegarder
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>")
vim.keymap.set("i", "<C-s>", "<cmd>w<cr>")
vim.keymap.set("v", "<C-s>", "<cmd>w<cr>")

-- Déplacer une sélection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Cargo
vim.keymap.set("n", "<leader>rb", "<cmd>!cargo build<cr>")
vim.keymap.set("n", "<leader>rr", "<cmd>!cargo run<cr>")
vim.keymap.set("n", "<leader>rt", "<cmd>!cargo test<cr>")

-- Commentaires (C-/ ou C-_ selon le terminal)
local function comment_line()
	require("Comment.api").toggle.linewise.current()
end
local function comment_selection()
	local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
	vim.api.nvim_feedkeys(esc, "nx", false)
	require("Comment.api").toggle.linewise(vim.fn.visualmode())
end
vim.keymap.set("n", "<C-/>", comment_line)
vim.keymap.set("n", "<C-_>", comment_line)
vim.keymap.set("x", "<C-/>", comment_selection)
vim.keymap.set("x", "<C-_>", comment_selection)

vim.keymap.set("i", "<C-_>", function()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	require("Comment.api").toggle.linewise.current()
	local cs = vim.bo.commentstring:match("^(.-)%s*%%s") or ""
	local offset = #cs + 1
	vim.api.nvim_win_set_cursor(0, { row, col + offset })
	vim.cmd("startinsert")
end)
