require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "pyright",
    "clangd",
    "bashls",
  },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("lua_ls", {
  capabilities = capabilities,
})

vim.lsp.config("pyright", {
  capabilities = capabilities,
})

vim.lsp.config("clangd", {
  capabilities = capabilities,
})

vim.lsp.config("bashls", {
  capabilities = capabilities,
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("pyright")
vim.lsp.enable("clangd")
vim.lsp.enable("bashls")
