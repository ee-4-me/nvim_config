vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

  -- Packer can manage itself
  use('wbthomason/packer.nvim')

  use('tpope/vim-fugitive')
  use('f-person/git-blame.nvim')
  use('sindrets/diffview.nvim')

  use({
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    requires = { {'nvim-lua/plenary.nvim'} }
  })

  use('martinsione/darkplus.nvim')

  use('ThePrimeagen/harpoon')
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use('mbbill/undotree')

  use({
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      --- Uncomment these if you want to manage LSP servers from neovim
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- LSP Support
      {'neovim/nvim-lspconfig'},
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    }
  })

  use('m4xshen/autoclose.nvim')

  use({'mg979/vim-visual-multi', branch = 'master'})
  use('yamatsum/nvim-cursorline')

  use({
    'lukas-reineke/indent-blankline.nvim',
    opts = {},
  })

  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  })

  use('nvim-tree/nvim-web-devicons')

  use('preservim/nerdcommenter')

  use({
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  })

end)


-- todo is look for a way to show full file path
