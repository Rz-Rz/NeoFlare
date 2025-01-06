-- init.lua
require('settings')  -- General Neovim settings
require('keymaps')   -- Keymappings
require('plugins')   -- Plugin configurations
require('treesitter') -- Treesitter configurations
require('theme')     -- Colorscheme settings
require('bufferline-conf')
require('lualine-conf')
require('mason-conf')
require('nvim-cmp')
require('cop')
require('commentary')
require('options')
require('luasnip-conf')
require('null-ls-config')
require('lsp-conf')

-- require('transparent').clear_prefix('NeoTree')
-- require('transparent').clear_prefix('Telescope')
require('telescope').setup({
	defaults = {
   		preview = {
   			treesitter = false,
   		},
      vimgrep_arguments = {
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
        '--hidden',
        '--no-ignore-vcs',
      },
   },
})
require('telescope').load_extension('fzf')
