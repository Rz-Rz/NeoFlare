-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")

-- servers only attach when their binary exists, so this list is the union of every machine's needs
local servers = {
	"html",
	"cssls",
	"ts_ls",
	"tailwindcss",
	"eslint",
	"asm_lsp",
	"rust_analyzer",
	"jedi_language_server",
	"basedpyright",
}
local nvlsp = require("nvchad.configs.lspconfig")

-- lsps with default config
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = nvlsp.on_attach,
		on_init = nvlsp.on_init,
		capabilities = nvlsp.capabilities,
	})
end

-- Configure clangd explicitly with clang-tidy enabled
lspconfig.clangd.setup({
	on_attach = nvlsp.on_attach,
	on_init = nvlsp.on_init,
	capabilities = nvlsp.capabilities,
	-- Add the --clang-tidy flag to the command used to launch clangd.
	cmd = { "clangd", "--clang-tidy", "--clang-tidy-checks=-cppcoreguidelines-pro-type-vararg" },
})
