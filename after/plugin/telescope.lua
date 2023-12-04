local telescope = require('telescope')

telescope.setup{
	defaults = {
		path_display={'smart'},
    layout_config = {
      horizontal = {
        width = 0.99,
      },
    },
	}
}

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pr', builtin.grep_string, {})
vim.keymap.set('n', '<leader>pp', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})

