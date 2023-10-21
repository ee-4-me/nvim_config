
vim.cmd([[
  autocmd FileType typescript,typescriptreact,javascript inoremap <buffer> <C-l> console.log();<Left><Left>
]])

vim.cmd([[
  autocmd FileType python inoremap <buffer> <C-l> print()<Left>
]])

vim.cmd([[
  autocmd FileType c,cpp inoremap <buffer> <C-l> printf("%d\n", )<Left>
]])
