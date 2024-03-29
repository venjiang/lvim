-- leader
vim.g.mapleader = ","
vim.g.maplocalleader = ","
local map = vim.keymap.set
local opt = { noremap = true, silent = true }
map("n", "<Leader>n", ":tabnew<CR>", opt)
map("n", "<Leader>a", "ggVG<CR>", opt)
map("n", "<Leader><CR>", ":nohl<CR>", opt)
map("n", "<C-w>", ":w<CR>", opt)
map("n", "<C-s>", ":w!<CR>", opt)
-- map("n", "<C-q>", ":q<CR>", opt)
map("n", "0", "^", opt)

-- lvim
lvim.builtin.which_key.mappings[";"] = {}
lvim.builtin.which_key.mappings["q"] = {}
lvim.builtin.which_key.mappings["/"] = {}
lvim.builtin.which_key.mappings["w"] = {}
lvim.keys.insert_mode["<A-j>"] = false
lvim.keys.insert_mode["<A-k>"] = false
lvim.keys.normal_mode["<A-j>"] = false
lvim.keys.normal_mode["<A-k>"] = false
lvim.keys.visual_block_mode["<A-j>"] = false
lvim.keys.visual_block_mode["<A-k>"] = false
lvim.keys.visual_block_mode["J"] = false
lvim.keys.visual_block_mode["K"] = false
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<Leader>r"] = ":Telescope oldfiles<CR>"
lvim.builtin.which_key.mappings["t"] = {
	name = "Telescope",
	f = { "<cmd>Telescope find_files<cr>", "Find Files" },
	g = { "<cmd>Telescope live_grep<cr>", "Grep" },
	b = { "<cmd>Telescope buffers<cr>", "Buffers" },
	h = { "<cmd>Telescope help_tags<cr>", "Help" },
	w = { "<cmd>Twilight<cr>", "Twilight" },
}
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<cr>", "Projects" }
-- neo-tree
lvim.builtin.which_key.mappings["e"] = {}
lvim.keys.normal_mode["<Leader>e"] = ":NeoTreeRevealToggle<CR>"
