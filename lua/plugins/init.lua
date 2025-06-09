return {
  {
    "https://gitlab-master.nvidia.com/asubramaniam/gp.nvim",
    config = function()
      require("gp").setup()
    end,
  },
  {
    "tpope/vim-fugitive",
  },
  {
    "junegunn/fzf",
  },
  {
    "junegunn/fzf.vim",
  },
  {
    "vim-airline/vim-airline",
  },
  {
    "Mofiqul/vscode.nvim",
  },
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "clangd",
      },
    },
    dependencies = {
        "mason-org/mason.nvim",
        "neovim/nvim-lspconfig",
    },
  },
  {
    "hrsh7th/nvim-cmp", -- completion plugin
    "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    "L3MON4D3/LuaSnip", -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      'kevinhwang91/promise-async'
    },
  },
  {
    "airblade/vim-gitgutter",
  },
  {
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({})
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
    }
  }
}
