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

require('transparent').clear_prefix('NeoTree')
require('transparent').clear_prefix('Telescope')
