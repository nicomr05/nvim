vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Python manager
vim.g.python3_host_prog = "/usr/bin/python3"

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- Use spaces for tabs and whatnot
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.grepprg = "grep -HRIn $* ."

vim.keymap.set("n", "<Leader>gg", ":copen | :silent :grep ")
vim.keymap.set("n", "]q", ":cnext <CR>")
vim.keymap.set("n", "[q", ":cprev <CR>")

-- Colorscheme and relative line numbers
--vim.cmd "colorscheme spacecamp_lite"
vim.cmd "colorscheme xcodedarkhc"
vim.cmd "set nu"
vim.cmd "set rnu"
vim.cmd "retab 4"

vim.cmd [[ set noswapfile ]]
vim.cmd [[ set termguicolors ]]
vim.cmd "set smartcase"

-- Line numbers
vim.wo.number = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.background = "dark"
vim.o.termguicolors = true
