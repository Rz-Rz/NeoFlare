require('luasnip').filetype_extend("javascript", { "javascriptreact" })
require('luasnip').filetype_extend("javascript", { "html" })
require("luasnip.loaders.from_vscode").load();
require("luasnip.loaders.from_vscode").load({ paths = "./snippets"})
