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
        "tomasiser/vim-code-dark",
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
        require("lspconfig").clangd.setup{}
      end,
    },
}
