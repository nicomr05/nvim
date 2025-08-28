-- ============================================================================
-- COLORSCHEMES
-- ============================================================================

-- Theme & transparency
vim.cmd[[colorscheme slate]]
--vim.cmd[[colorscheme ayu]]
--vim.cmd[[colorscheme unokai]]
--vim.cmd[[colorscheme hemisu]]
--vim.cmd[[colorscheme habamax]]
--vim.cmd[[colorscheme spacecamp_lite]]
--vim.cmd[[colorscheme xcodedarkhc]]
vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none"})
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none"})
vim.o.background = "dark"
