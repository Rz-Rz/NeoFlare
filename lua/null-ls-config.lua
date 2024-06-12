local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        -- null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.diagnostics.djlint,
        null_ls.builtins.formatting.djlint,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.prettierd.with({
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "html", "css", "scss", "json", "yaml", "markdown" },
        }),
        null_ls.builtins.diagnostics.flake8.with({
          prefer_local = "venv/bin",
          extra_args = { "--ignore=E501,E302" },
        })
        -- null_ls.builtins.diagnostics.pylint.with({
        --   prefer_local = "venv/bin"
        -- }),
    },
})
