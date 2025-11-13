-- THIS NEEDS TO BE SET CORRECTLY
-- set runtimepath+=~/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim80,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = ","

vim.opt.backspace      = { "indent", "eol", "start" }
vim.opt.display        = "truncate"
vim.opt.fileencodings  = { "utf-8", "default", "latin1" }
vim.opt.helplang       = { "en" }
-- Git gutter needs a refresh to draw changes
vim.opt.updatetime     = 500
vim.opt.incsearch      = true
vim.opt.nrformats      = { "bin", "hex", "unsigned" }
vim.opt.foldmethod     = "expr"
vim.opt.foldexpr       = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevelstart = 99
vim.opt.scrolloff      = 8
vim.opt.relativenumber = true
vim.opt.number         = true
vim.opt.showcmd        = true
vim.opt.wildmenu       = true
vim.opt.hidden         = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

vim.keymap.set("n", "-", '<cmd>NvimTreeToggle<Cr>', { desc = "File Explorer" })
