require("mason").setup()
-- require("transparent").clear_prefix("mason")
require("mason-lspconfig").setup()
require("lspconfig").lua_ls.setup {}
require("lspconfig").bashls.setup {}
require("lspconfig").clangd.setup {}
