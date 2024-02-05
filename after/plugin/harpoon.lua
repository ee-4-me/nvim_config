local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set('n', '<leader>a', function () -- add file to harpoon
  local file = vim.fn.expand('%:p'):gsub('\\', '/')
  local cwd = vim.fn.getcwd():gsub('\\', '/')
  local relative = string.sub(file, #cwd + 2)
  mark.add_file(relative)
end)

vim.keymap.set('n', '<leader>e', ui.toggle_quick_menu) -- open harppon

require("harpoon").setup({
  menu = {
    width = vim.api.nvim_win_get_width(0) - 4,
  }
})
