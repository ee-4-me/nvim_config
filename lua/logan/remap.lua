local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- leader, space
vim.g.mapleader = ' '

keymap({ 'n', 'v' }, '<Space>', '<Nop>', opts)

-- ------ KEY MAPS ------

function source_files()
  vim.cmd('source C:\\Users\\luedtkel\\AppData\\Local\\nvim\\init.lua')
  vim.cmd('source C:\\Users\\luedtkel\\AppData\\Local\\nvim\\lua\\logan\\set.lua')
  vim.cmd('source C:\\Users\\luedtkel\\AppData\\Local\\nvim\\lua\\logan\\init.lua')
  vim.cmd('source C:\\Users\\luedtkel\\AppData\\Local\\nvim\\lua\\logan\\remap.lua')
end

-- refresh
keymap('n', '<leader><leader>', [[:lua source_files()<CR>:noh<CR>]], opts)

-- open file explorer
keymap('n', '<leader>pv', ':Ex <CR>', opts)

-- disables enter comment on new line, thank goodness
vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')

-- keep cursor in middle
keymap('n', 'j', 'jzz', opts)
keymap('n', 'k', 'kzz', opts)
keymap('v', 'j', 'jzz', opts)
keymap('v', 'k', 'kzz', opts)
keymap('n', 'zj', '5jzz', opts)
keymap('n', 'zk', '5kzz', opts)

keymap('v', 'H', 'Hzz', opts)
keymap('v', 'L', 'Lzz', opts)
keymap('n', 'H', 'Hzz', opts)
keymap('n', 'L', 'Lzz', opts)

keymap('n', 'n', 'nzz', opts)
keymap('n', 'N', 'Nzz', opts)
keymap('n', '<C-o>', '<C-o>zz', opts)
keymap('n', '<C-i>', '<C-i>zz', opts)
keymap('n', 'gd', 'gdzz', opts)

keymap('n', 'G', 'Gzz', opts)

-- use alt key to move lines like in vs code
keymap('n', '<A-h>', '<<', opts)
keymap('n', '<A-l>', '>>', opts)
keymap('n', '<A-k>', ':m .-2<CR>zz', opts)
keymap('n', '<A-j>', ':m .+1<CR>zz', opts)
keymap('v', '<A-j>', ":m '>+1<CR>gv=gvzz", opts)
keymap('v', '<A-k>', ":m '<-2<CR>gv=gvzz", opts)
keymap('v', '<a-h>', '<gv', opts) -- todo make this repeatable
keymap('v', '<a-l>', '>gv', opts)

-- insert new lines above and below
keymap('n', '<S-j>', 'o<Esc>zz', opts)
keymap('n', '<S-k>', 'O<Esc>', opts)

-- hard to press underscore
keymap('i', '<A-n>', '_<Esc>a', opts)

-- paste in insert mode
keymap('i', '<A-p>', '<Esc>pa', opts) -- need to use alt because C is used in lsp I think?

-- delete without copy, amazing
-- I am choosing to by default not copy when deleting, instead, need to ctrl to delete to also copy
keymap('v', 't', '"+y', opts) -- copy to clipboard
keymap('v', 'd', '"_d', opts)
keymap('v', 'p', '"_pp', opts)
keymap('v', 'p', '"_PP', opts)
keymap('v', 'r', 'd', opts)
keymap('n', 'd', '"_d', opts)
keymap('n', '<C-d>', 'd', opts)
keymap('n', 'x', '"_x', opts)
keymap('n', 'c', '"_c', opts)

-- nice mappings
keymap('n', '<leader><enter>', ':noh<CR>', opts) -- clear higlighting
keymap('i', '<C-c>', '<Esc>', opts)
keymap('n', '<C-a>', 'ggVG')
keymap('n', 'Q', '<nop>', opts)
keymap('n', '<leader>s', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')
keymap('n', '<leader>f', ':/<C-r><C-w><CR>N', opts)

-- nice way to yank in word, and the replace inner word
keymap('n', '<leader>y', 'yiw', opts)
keymap('n', '<leader>t', 'viw"+y', opts)
keymap('n', '<leader>r', '"_diwP', opts)
keymap('n', '<leader>d', '"_diw', opts)
keymap('n', '<leader>c', '"_ciw', opts)
keymap('n', '<leader>v', 'viw', opts)

-- should be able to exit a terminal
keymap('t', '<C-k>', '<C-\\><C-n><C-w>k', opts)
keymap('t', '<C-j>', '<C-\\><C-n><C-w>j', opts)
keymap('t', '<C-l>', '<C-\\><C-n><C-w>l', opts)
keymap('t', '<C-h>', '<C-\\><C-n><C-w>h', opts)
keymap('t', '<Esc>', '<C-\\><C-n>', opts)

-- nice way to nativagte windows 
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-l>', '<C-w>l', opts)
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<leader>w', '<C-w>20+', opts)
keymap('i', '<C-k>', '<Esc><C-w>k', opts)
keymap('i', '<C-j>', '<Esc><C-w>j', opts)
keymap('i', '<C-l>', '<Esc><C-w>l', opts)
keymap('i', '<C-h>', '<Esc><C-w>h', opts)
keymap('n', '<C-A-j>', ':split<CR><C-w>j:term<CR>', opts)
keymap('n', '<C-A-l>', ':vsplit<CR><C-w>l:term<CR>', opts)

-- for ease of use 
keymap('n', ';', ':')
keymap('n', ':', ';')
keymap('n', '.', ';', opts)
keymap('n', '/', '/\\c')

-- comments
keymap('v', '<leader>m', '<plug>NERDCommenterToggle gv', opts)
keymap('n', '<leader>m', '<plug>NERDCommenterToggle', opts)
keymap('n', '<leader>,', '<plug>NERDCommenterAppend', opts)

-- spectre, amazing package doing find and replace a lot like vscode
keymap('n', '<leader>si', '<cmd>lua require("spectre").toggle()<CR>i', opts)
keymap('n', '<leader>ss', '<cmd>lua require("spectre").toggle()<CR>', opts)
keymap('n', '<leader>sr', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', opts)
keymap('v', '<leader>sr', '<esc><cmd>lua require("spectre").open_visual()<CR>', opts)
keymap('n', '<leader>sf', '<cmd>lua require("spectre").open_file_search()<CR>', opts)


-- barbar keymaps, like this, maybe more than harpoon, sorry prime

-- Move to previous/next
keymap('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
keymap('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)

-- Re-order to previous/next
keymap('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
keymap('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)

-- Goto buffer in position...
keymap('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
keymap('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
keymap('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
keymap('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
keymap('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
keymap('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
keymap('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
keymap('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
keymap('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
keymap('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

-- Pin/unpin buffer
keymap('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
keymap('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
keymap('n', '<A-d>', '<Cmd>BufferCloseAllButCurrentOrPinned<CR>', opts)

-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight

