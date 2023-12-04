vim.cmd[[colorscheme darkplus]]

vim.cmd([[highlight DiffAdd ctermfg=none guifg=none guibg=#4D5A26]])
vim.cmd([[highlight DiffChange ctermfg=none guifg=none guibg=#0F2B2B]])
vim.cmd([[highlight DiffDelete ctermfg=none guifg=none guibg=#6C1414]])
vim.cmd([[highlight DiffText ctermfg=none guifg=none guibg=#154746]])

vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_command('highlight Comment gui=NONE')

