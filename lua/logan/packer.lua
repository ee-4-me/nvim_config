vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

  -- Packer can manage itself
  use('wbthomason/packer.nvim')

  -- adds git commands with :G
  use('tpope/vim-fugitive')

  --gotta know who to blame (it was me)
  use('f-person/git-blame.nvim')

  -- git status on left side, amazing
  use('lewis6991/gitsigns.nvim')

  -- git view difference between files
  use('sindrets/diffview.nvim')

  -- fuzzy finder for files, searching all files, etc
  -- TODO really like C-S-f in vscode, search for plugin that does that better
  use({
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    requires = { {'nvim-lua/plenary.nvim'} }
  })

  -- theme
  use('martinsione/darkplus.nvim')

  -- file helper -- TODO should learn how to use this better
  use('ThePrimeagen/harpoon')

  -- magic
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

  -- really nice, can see undo / redo history in a tree
  use('mbbill/undotree')

  -- lsp for autocomplete and other things
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

  -- nice closing opening ([{
  use {
    "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
  }

  -- close div tags and such in html, react
  use {
    "windwp/nvim-ts-autotag",
      config = function() require("nvim-ts-autotag").setup {} end
  }

  -- multiple cursors
  use({'mg979/vim-visual-multi', branch = 'master'})

  -- higlights words that are the same as what is under your cursor
  use('yamatsum/nvim-cursorline')

  -- vertical lines to help see indentation
  use({
    'lukas-reineke/indent-blankline.nvim',
    opts = {},
  })

  -- line on bottom to say which file you are in
  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  })

  -- adds the nice icons
  use('nvim-tree/nvim-web-devicons')

  -- helps making commnets
  use('preservim/nerdcommenter')

  -- gives red errors with lsp I suppose, can open and see error and warnings
  use({
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
    },
  })

  -- for nice search like vs code
  use('nvim-pack/nvim-spectre')

  -- for the tab manager like vscode, amazing
  use('romgrk/barbar.nvim')

end)

