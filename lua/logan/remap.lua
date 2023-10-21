local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- leader
vim.g.mapleader = ' '

keymap('n', ':', ';')
keymap({ 'n', 'v' }, '<Space>', '<Nop>', opts)

-- ------ KEY MAPS ------

function source_files()
  vim.cmd('source C:\\Users\\luedtkel\\AppData\\Local\\nvim\\init.lua')
  vim.cmd('source C:\\Users\\luedtkel\\AppData\\Local\\nvim\\lua\\logan\\init.lua')
  vim.cmd('source C:\\Users\\luedtkel\\AppData\\Local\\nvim\\lua\\logan\\remap.lua')
  vim.cmd('source C:\\Users\\luedtkel\\AppData\\Local\\nvim\\lua\\logan\\set.lua')
end

-- resource
keymap('n', '<leader><leader>', [[:lua source_files()<CR>]], opts)

-- open file explorer
keymap('n', '<leader>pv', ':Ex <CR>', opts)

-- disables enter comment on new line, thank goodness
vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')

-- cetner after running a command, this is done so the sommand and center look like they run at the same time
function execute_and_center(command, count)
  local i = 0
  if command:sub(1,1) ~= ':' then
    command = 'normal! ' .. command 
  end
  while i < count do
    i = i + 1
    vim.fn.execute(command)
  end
  vim.fn.execute('normal! zz')
end

-- hate higligthing
keymap('n', '<C-c>', '<C-c>:noh<CR>', opts)

-- center after moving up or down, searching, many others
keymap('n', 'j', [[:<C-u> lua execute_and_center('j', vim.v.count1)<CR>]], opts)
keymap('n', 'k', [[:<C-u> lua execute_and_center('k', vim.v.count1)<CR>]], opts)
keymap('v', 'j', 'jzz', opts)
keymap('v', 'k', 'kzz', opts)

keymap('n', 'n', 'nzz', opts)
keymap('n', 'N', 'Nzz', opts)
keymap('n', 'H', 'Hzz', opts)
keymap('n', 'L', 'Lzz', opts)
keymap('n', '<C-o>', '<C-o>zz', opts)
keymap('n', '<C-i>', '<C-i>zz', opts)
keymap('n', 'gd', 'gdzz')

-- do like this because we want line number, and its okay, hard to do with function
keymap('n', 'G', 'Gzz', opts)

-- use alt key to move lines like in vs code
keymap('n', '<A-h>', '<<', opts)
keymap('n', '<A-l>', '>>', opts)
keymap('n', '<A-j>', [[:<C-u> lua execute_and_center(':m .+1', 1)<CR>]], opts)
keymap('n', '<A-k>', [[:<C-u> lua execute_and_center(':m .-2', 1)<CR>]], opts)
-- todo see if I can to this better
keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", opts)
keymap('v', '<A-k>', ":m '<-2<CR>gv=gv", opts)

-- insert new lines above and below
keymap('n', '<S-j>', [[:<C-u> lua execute_and_center('o', vim.v.count1)<CR>]], opts)
keymap('n', '<S-k>', 'O<Esc>', opts)

-- hard to press underscore
keymap('i', '<A-n>', '_<Esc>a', opts)

-- copy and paste to clipboard, maybe want to think about copy some more
keymap('v', '<C-y>', '"+y', opts)
keymap('n', '<C-y>', '"+y', opts)
keymap('n', '<C-p>', '"+p', opts)
keymap('i', '<A-p>', '<Esc>pa', opts) -- need to use alt because C is used in lsp I think?

-- delete without copy, amazing
-- I am choosing to by default not copy when deleting, instead, need to ctrl to delete to also copy
keymap('v', 'd', '"_d', opts)
keymap('n', 'd', '"_d', opts)
keymap('n', 'x', '"_x', opts)
keymap('n', 'c', '"_c', opts)
keymap('n', '<C-d>', 'd', opts)
keymap('v', '<C-d>', 'd', opts)

-- the primagen says
keymap('i', '<C-c>', '<Esc>', opts)
keymap('n', 'Q', '<nop>', opts)
keymap('n', '<leader>s', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')
keymap('n', '<leader>f', ':/<C-r><C-w><CR>N')

-- nice way to yank in word, and the replace inner word
keymap('n', '<leader>y', 'yiw')
keymap('n', '<leader>r', '"_diwP')
keymap('n', '<leader>d', '"_diw')
keymap('n', '<leader>c', '"_ciw')
keymap('n', '<leader><C-d>', 'diw')

-- should be able to exit a terminal
keymap('t', '<Esc>', '<C-\\><C-n>', opts)


-- nice way to nativagte windows 
local navigagte_and_size = '<C-w>100-<C-w>3+<C-w>'
keymap('n', '<leader>wK', '<C-w>k', opts)
keymap('n', '<leader>wJ', '<C-w>j', opts)
keymap('n', '<leader>wj', navigagte_and_size .. 'j', opts)
keymap('n', '<leader>wk', navigagte_and_size .. 'k', opts)
keymap('n', '<leader>wl', '<C-w>l', opts)
keymap('n', '<leader>wh', '<C-w>h', opts)

keymap('n', '<leader>wd', ':split<CR>' .. navigagte_and_size .. 'j' .. ':terminal<CR>i', opts)
keymap('n', '<leader>wr', ':vsplit<CR><C-w>l:terminal<CR>i', opts)

-- for ease of use 
keymap('n', ';', ':')
keymap('n', ':', ';')
keymap('n', '/', '/\\c')



