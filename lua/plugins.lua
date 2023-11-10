require("lazy").setup({
"folke/which-key.nvim", 
{ "folke/neoconf.nvim", cmd = "Neoconf" }, 
"folke/neodev.nvim",
{ "nvim-telescope/telescope.nvim", tag = '0.1.4', 
dependencies = { 'nvim-lua/plenary.nvim', { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true } }
},
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim",
	dependencies = { 
		"williamboman/mason.nvim",
		"nvim-lua/plenary.nvim", }
},
	{ "neovim/nvim-lspconfig",
	dependencies = { "folke/neodev.nvim" }
	},
	-- Adding nvim-treesitter and its dependencies
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				event = "VeryLazy",
			},
			{
				"JoosepAlviste/nvim-ts-context-commentstring",
				event = "VeryLazy",
			},
			{
				"windwp/nvim-ts-autotag",
				event = "VeryLazy",
			},
			{
				"windwp/nvim-autopairs",
				event = "InsertEnter",
			},
		},
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{ "xiyaowong/transparent.nvim" },
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		}
	},
	{'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
	{ 'nvim-lualine/lualine.nvim', dependencies = 'nvim-tree/nvim-web-devicons' },
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{
				"hrsh7th/cmp-nvim-lsp",
			},
			{
				"hrsh7th/cmp-emoji",
			},
			{
				"hrsh7th/cmp-buffer",
			},
			{
				"hrsh7th/cmp-path",
			},
			{
				"hrsh7th/cmp-cmdline",
			},
			{
				"saadparwaiz1/cmp_luasnip",
			},
			{
				"L3MON4D3/LuaSnip",
				dependencies = { "rafamadriz/friendly-snippets" }
			},
			{
				"hrsh7th/cmp-nvim-lua"
			},
		},
	},
	{ "zbirenbaum/copilot.lua",
	event = "VimEnter" }
})

require('transparent').clear_prefix('lazy')
