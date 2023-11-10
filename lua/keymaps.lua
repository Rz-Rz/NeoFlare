-- keymaps.lua
vim.g.mapleader = ';'
vim.g.maplocalleader = ';'

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }


--Telescope
keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>g", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>h", "<cmd>Telescope help_tags<cr>", opts)


--Transaprency
keymap("n", "<leader>tr", "<cmd>TransparentToggle<cr>", opts)

--Neotree
keymap("n", "<leader>tt", "<cmd>Neotree<cr>", opts)

--Bufferline
keymap('n', '<leader>d', ':BufferLineCycleNext<CR>', opts)
keymap('n', '<leader>a', ':BufferLineCyclePrev<CR>', opts)
keymap('n', '<leader>x', ':BufferLinePickClose<CR>', opts)
