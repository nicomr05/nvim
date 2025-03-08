vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

-- Coloscheme and relative line numbers
vim.cmd "colorscheme gruvbox" 
vim.cmd "set nu"
vim.cmd "set rnu"

vim.cmd [[ set noswapfile ]]
vim.cmd [[ set termguicolors ]]

--Line numbers
vim.wo.number = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- vim.o.background = "dark"
-- vim.o.termguicolors = true

