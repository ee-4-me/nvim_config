local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- leader
vim.g.mapleader = ' '

keymap({ 'n', 'v' }, '<Space>', '<Nop>', opts)

-- ------ KEY MAPS ------

function source_files()
  vim.cmd('source C:\\Users\\luedtkel\\AppData\\Local\\nvim\\init.lua')
  vim.cmd('source C:\\Users\\luedtkel\\AppData\\Local\\nvim\\lua\\logan\\set.lua')
  vim.cmd('source C:\\Users\\luedtkel\\AppData\\Local\\nvim\\lua\\logan\\init.lua')
  vim.cmd('source C:\\Users\\luedtkel\\AppData\\Local\\nvim\\lua\\logan\\remap.lua')
end

-- resource
keymap('n', '<leader><leader>', [[:lua source_files()<CR>:noh<CR>]], opts)

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
  vim.api.nvim_feedkeys('zz', 'n', false);
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
keymap('n', '<C-i>', '<C-i>zz')
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
keymap('v', '<a-h>', '<gv', opts) -- todo make this repeatable
keymap('v', '<a-l>', '>gv', opts)

-- insert new lines above and below
keymap('n', '<S-j>', [[:<C-u> lua execute_and_center('o', vim.v.count1)<CR>]], opts)
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
keymap('n', '<leader>f', ':/<C-r><C-w><CR>N')

-- nice way to yank in word, and the replace inner word
keymap('n', '<leader>y', 'yiw')
keymap('n', '<leader>t', 'viw"+y', opts)
keymap('n', '<leader>r', '"_diwP')
keymap('n', '<leader>d', '"_diw')
keymap('n', '<leader>c', '"_ciw')
keymap('n', '<leader>v', 'viw')

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
keymap('i', '<C-k>', '<Esc><C-w>k', opts)
keymap('i', '<C-j>', '<Esc><C-w>j', opts)
keymap('i', '<C-l>', '<Esc><C-w>l', opts)
keymap('i', '<C-h>', '<Esc><C-w>h', opts)
keymap('n', '<C-A-j>', ':split<CR><C-w>j:term<CR>', opts)
keymap('n', '<C-A-l>', ':vsplit<CR><C-w>l:term<CR>', opts)

-- for ease of use 
keymap('n', ';', ':')
keymap('n', ':', ';')
keymap('n', '/', '/\\c')

-- todo, not a true inner, need to be way smarter, but should be good for now
-- todo, count correct
function select_between_delims(delim_offset)

  -- Define mappings of opening and closing characters and their corresponding deletion pairs
  local delimiters = {
    ['('] = ')',
    ['['] = ']',
    ['{'] = '}',
    ['<'] = '>',
    ["'"] = "'",
    ['"'] = '"',
    ['`'] = '`',
  }

  local line = vim.fn.getline('.')
  local cursor_index = vim.fn.col('.')

  local start_pos
  local matching_delim
  local end_pos

  -- start from cursor pos, move backwards until finding a delim
  for i = cursor_index, 1, -1 do
    local c = string.sub(line, i, i)

    if delimiters[c] then
      start_pos = i + delim_offset
      matching_delim = delimiters[c]
      break
    end
  end

  -- didn't find an opening delim, break
  if not start_pos then
    return
  end

  for i = cursor_index, #line do
    local c = string.sub(line, i, i)

    if c == matching_delim then
      end_pos = i - delim_offset
      break
    end
  end

  -- didn't find a closing delim, break
  if not end_pos then
    return
  end
  vim.fn.cursor(line, end_pos)

  vim.api.nvim_input('v' .. end_pos - start_pos .. 'h')
end

keymap('n', '<leader>h', ':lua select_between_delims(0)<CR>', opts)
keymap('n', '<leader>l', ':lua select_between_delims(1)<CR>', opts)

keymap('n', '<leader>n', '<plug>NERDCommenterInvert', opts)
keymap('n', '<leader>m', '<plug>NERDCommenterAppend<space>', opts)
