vim.lsp.config('pyright', {
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
        exclude = {"build", ".*", "node_modules", "__pycache__"},
      }
    }
  }
})

vim.lsp.config('clangd', {
  cmd = { "clangd", "--background-index", "--clang-tidy", "--log=verbose" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  init_options = { fallbackFlags = { "-std=c++17" } },
})
