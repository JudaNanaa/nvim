vim.g.mapleader = " "

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

require("options")
require("keymaps")
require("autocmds")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({ "git", "clone", "https://github.com/folke/lazy.nvim", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
