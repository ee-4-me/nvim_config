-- ------ SYSTEM SETTINGS ------

-- Set specific settings for Python files
vim.cmd([[
  autocmd FileType python
    \ setlocal tabstop=4 |
    \ setlocal softtabstop=4 |
    \ setlocal shiftwidth=4
]])

-- disables enter comment on new line, thank goodness
vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')

-- line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- tabs
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = false

vim.opt.wrap = false
vim.opt.synmaxcol=300

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = 'C:/neovim/undodir'
vim.opt.undofile = true

vim.opt.sidescrolloff = 30

vim.opt.hlsearch = true
vim.opt.incsearch = true

-- idk if this is helping
vim.opt.termguicolors = true

vim.opt.updatetime = 10

vim.g.NERDCreateDefaultMappings = 0
vim.g.NERDSpaceDelims = 0
