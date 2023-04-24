-- language server config

require'lspconfig'.gopls.setup{}
require'lspconfig'.julials.setup{}
require'lspconfig'.volar.setup{
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
}
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.cssls.setup {
  capabilities = capabilities,
}

require'lspconfig'.html.setup {
  capabilities = capabilities,
}

require'lspconfig'.vls.setup{}

-- live-server is server of html
local status_ok, live_server = pcall(require, "live_server")
if not status_ok then
  return
end
live_server.setup({
  port = 7567,
  browser_command = "microsoft-edge-dev", -- Command or executable path
  quiet = false,
  no_css_inject = false,
  install_path = os.getenv("HOME") .. "/.live/",
})
