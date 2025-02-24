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
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "pyright",
          "clangd",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").pyright.setup{}
      require("lspconfig").clangd.setup({
        cmd = { "clangd", "--background-index", "--clang-tidy", "--log=verbose" },
        filetypes = { "c", "cpp", "objc", "objcpp" },
        root_dir = require('lspconfig').util.root_pattern("compile_commands.json", ".git"),
        init_options = { fallbackFlags = { "-std=c++17" } },
      })
    end,
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
}
