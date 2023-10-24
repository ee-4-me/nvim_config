local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- leader
vim.g.mapleader = ' '

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

-- cetner after running a command, this is done so the command and center look like they run at the same time
function execute_and_center(command, count)
  local i = 0
  if command:sub(1,1) ~= ':' then
    command = 'normal! ' .. command 
  end
  while i < count do
    i = i + 1
    vim.fn.execute(command)
  end
  require('neoscroll').zz(120, [['sine']]);
end

function setup_center_map(mode, key_binding)
  local command = string.format(':<C-u> lua execute_and_center("%s", vim.v.count1)<CR>', key_binding)
  keymap(mode, key_binding, command, opts)
end

-- keep cursor in middle, and do smooth scroll
setup_center_map('n', 'j')
setup_center_map('n', 'k')
keymap('v', 'j', 'jzz', opts) -- hard to mess with in normal mode 
keymap('v', 'k', 'kzz', opts)

setup_center_map('n', 'H')
setup_center_map('n', 'L')

setup_center_map('n', 'n')
setup_center_map('n', 'N')
setup_center_map('n', 'N')
setup_center_map('n', '<C-o>')
setup_center_map('n', '<C-i>')
setup_center_map('n', 'gd')

-- do like this because we want line number, and its okay, hard to do with function
keymap('n', 'G', 'Gzz', opts)

-- use alt key to move lines like in vs code
keymap('n', '<A-h>', '<<', opts)
keymap('n', '<A-l>', '>>', opts)
keymap('n', '<A-k>', ':m .-2<CR>zz', opts)
keymap('n', '<A-j>', ':m .+1<CR>zz', opts)
keymap('v', '<A-j>', ":m '>+1<CR>gv=gvzz", opts)
keymap('v', '<A-k>', ":m '<-2<CR>gv=gvzz", opts)

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

-- nice mappings
keymap('n', '<C-c>', '<C-c>:noh<CR>', opts) -- clear higlighting
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

-- for ease of use 
keymap('n', ';', ':')
keymap('n', ':', ';')
keymap('n', '/', '/\\c')

