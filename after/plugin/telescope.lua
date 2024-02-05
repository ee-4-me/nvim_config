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

