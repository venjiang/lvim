vim.g.copilot_assume_mapped = true
-- vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
local function telescope_find_files(_)
	require("lvim.core.nvimtree").start_telescope("find_files")
end

local function telescope_live_grep(_)
	require("lvim.core.nvimtree").start_telescope("live_grep")
end
lvim.builtin.nvimtree.setup.view.mappings.list = {
	{ key = "u", action = "dir_up" },

	{ key = { "l", "<CR>", "o" }, action = "edit", mode = "n" },
	{ key = "h", action = "close_node" },
	{ key = "v", action = "vsplit" },
	{ key = "C", action = "cd" },
	{ key = "gtf", action = "telescope_find_files", action_cb = telescope_find_files },
	{ key = "gtg", action = "telescope_live_grep", action_cb = telescope_live_grep },
}

lvim.plugins = {
	-- onedark
	"ful1e5/onedark.nvim",
	-- catppuccin
	"catppuccin/nvim",
	"ethanholz/nvim-lastplace",
	"tpope/vim-surround",
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").set_default_keymaps()
		end,
	},

	-- git
	{
		"tpope/vim-fugitive",
		cmd = {
			"G",
			"Git",
			"Gdiffsplit",
			"Gread",
			"Gwrite",
			"Ggrep",
			"GMove",
			"GDelete",
			"GBrowse",
			"GRemove",
			"GRename",
			"Glgrep",
			"Gedit",
		},
		ft = { "fugitive" },
	},
	{
		"pwntester/octo.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("octo").setup()
		end,
	},
	-- copilot
	"github/copilot.vim",
	"leoluz/nvim-dap-go",
	"ray-x/go.nvim",
	{ "ray-x/guihua.lua", build = "cd lua/fzy && make" },
}
require("nvim-lastplace").setup()
-- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "stylua" },
	{
		command = "prettier",
		extra_args = { "--print-width", "100" },
		filetypes = { "typescript", "typescriptreact" },
	},
	{ command = "goimports", filetypes = { "go" } },
	{ command = "gofumpt", filetypes = { "go" } },
})

require("guihua.maps").setup()
require("go").setup()
