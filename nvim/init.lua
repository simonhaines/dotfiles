-- F12 Insert current date
vim.keymap.set("n", "<F12>", "i<C-R>=strftime('%Y-%m-%d')<CR><CR>")
-- 4 spaces as tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.shiftround = true
-- Line numbers
vim.opt.number = true
vim.opt.whichwrap = "h,l,<,>"
-- Swap file
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = false
-- Colours
vim.opt.background = "dark"
vim.cmd 'colorscheme slate'
