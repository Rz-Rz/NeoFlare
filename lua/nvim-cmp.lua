-- Initialization of nvim-cmp
local cmp = require'cmp'

-- Setup nvim-cmp
cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- For `luasnip` users.
      require('luasnip').lsp_expand(args.body)
    end
  },
  window = {
    -- Uncomment below lines if you want bordered windows
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  -- Adding `emmet_language_server` to the sources along with `nvim_lsp` and `luasnip`
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    -- Add `emmet_language_server` here if you need it for HTML/CSS files, for example
    { name = 'emmet_language_server' },
  }, {
    { name = 'buffer' },
  })
})

-- Configuration for specific filetype, like gitcommit
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' }, -- Assuming cmp-git is installed
  }, {
    { name = 'buffer' },
  })
})

-- Configuration for command line
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['lua_ls'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['clangd'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['bashls'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['html'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['eslint'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['tsserver'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['tailwindcss'].setup {
    capabilities = capabilities
  }
  -- Adding Pyright for Python support
-- require('lspconfig')['pyright'].setup {
--   capabilities = capabilities
-- }

-- Adding cssls for CSS support
require('lspconfig')['cssls'].setup {
  capabilities = capabilities
}
require('lspconfig')['emmet_language_server'].setup {
  capabilities = capabilities
}
