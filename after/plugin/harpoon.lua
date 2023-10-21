local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

-- I love this! lets go
vim.keymap.set('n', '<leader>a', function ()
  local file = vim.fn.expand('%:p'):gsub('\\', '/')
  local cwd = vim.fn.getcwd():gsub('\\', '/')
  local relative = string.sub(file, #cwd + 2)
  mark.add_file(relative)
end)
vim.keymap.set('n', '<leader>e', ui.toggle_quick_menu)

-- awesome, TODO but maybe want different mappings, idk how helpful this is?
--vim.keymap.set('n', '<leader>t', function() ui.nav_next() end)
--vim.keymap.set('n', '<leader>y', function() ui.nav_prev() end)

require("harpoon").setup({
  menu = {
    width = vim.api.nvim_win_get_width(0) - 4,
  }
})
