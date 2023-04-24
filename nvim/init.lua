local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.cmd [[
    set completeopt=menuone,noinsert,noselect
]]

vim.opt.rtp:prepend(lazypath)

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.o.exrc = true
vim.wo.foldmethod = 'indent'
vim.wo.foldlevel = 10

-- vim.g.mapleader = '\'

require("lazy").setup("plugins")
require'lspcs'
require'daps'
require'pluginConfig'
require'prettierConfig'
require'keymaps'
