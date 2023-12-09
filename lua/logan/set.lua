-- ------ SYSTEM SETTINGS ------

-- line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- tabs

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = false

-- Set specific settings for Python files
vim.cmd([[
  autocmd FileType python
    \ setlocal tabstop=4 |
    \ setlocal softtabstop=4 |
    \ setlocal shiftwidth=4 |
]])



-- vim.opt.smartindent=true
-- vim.opt.shiftround=true
-- vim.opt.tabstop=2
-- vim.opt.shiftwidth=2
-- vim.opt.expandtab=true
-- vim.opt.softtabstop=-1

-- vim.opt.tabstop = 2
-- vim.opt.softtabstop = -1
-- vim.opt.shiftwidth = 0
-- vim.opt.expandtab = true
-- vim.opt.smartindent = true

-- vim.cmd([[
--   autocmd FileType python setlocal tabstop=4
-- ]])


vim.opt.wrap = false
vim.opt.synmaxcol=300

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = 'C:/neovim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

-- idk if this is helping
vim.opt.termguicolors = true

vim.opt.updatetime = 50

-- not a huge fan
-- vim.opt.colorcolumn = '80'

