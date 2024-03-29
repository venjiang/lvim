vim.g.copilot_assume_mapped = true
-- vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
-- local function telescope_find_files(_)
-- 	require("lvim.core.nvimtree").start_telescope("find_files")
-- end
--
-- local function telescope_live_grep(_)
-- 	require("lvim.core.nvimtree").start_telescope("live_grep")
-- end

-- lvim.builtin.nvimtree.setup.view.mappings.list = {
-- 	{ key = "u", action = "dir_up" },
--
-- 	{ key = { "l", "<CR>", "o" }, action = "edit", mode = "n" },
-- 	{ key = "h", action = "close_node" },
-- 	{ key = "v", action = "vsplit" },
-- 	{ key = "C", action = "cd" },
-- 	{ key = "gtf", action = "telescope_find_files", action_cb = telescope_find_files },
-- 	{ key = "gtg", action = "telescope_live_grep", action_cb = telescope_live_grep },
-- }

lvim.plugins = {
	-- onedark
	"ful1e5/onedark.nvim",
	-- catppuccin
	"catppuccin/nvim",
	"marko-cerovac/material.nvim",
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000, -- Ensure it loads first
	},
	{
		"folke/twilight.nvim",
		config = function()
			require("twilight").setup({})
		end,
	},
	-- translation
	{
		"potamides/pantran.nvim",
		config = function()
			require("pantran").setup({
				engines = {
					yandex = {
						default_source = "auto",
						default_target = "chinese",
					},
				},
			})
		end,
	},
	-- neo-tree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				close_if_last_window = true,
				source_selector = {
					winbar = true,
				},
				window = {
					position = "right",
					width = 30,
					mappings = {
						["l"] = "open",
					},
				},
				buffers = {
					follow_current_file = true,
				},
				filesystem = {
					follow_current_file = true,
					filtered_items = {
						hide_dotfiles = false,
						hide_gitignored = false,
						hide_by_name = {
							"node_modules",
						},
						never_show = {
							".DS_Store",
							"thumbs.db",
						},
					},
				},
			})
		end,
	},
	"ethanholz/nvim-lastplace",
	"tpope/vim-surround",
	-- search text
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").set_default_keymaps()
		end,
	},
	-- motion
	{
		"phaazon/hop.nvim",
		event = "BufRead",
	},
	-- todo
	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	},
	--  programming activity
	{
		"wakatime/vim-wakatime",
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
		"sindrets/diffview.nvim",
		event = "BufRead",
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
	-- "github/copilot.vim",
	"leoluz/nvim-dap-go",
	"ray-x/go.nvim",
	{ "ray-x/guihua.lua", build = "cd lua/fzy && make" },
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = false,
					auto_trigger = false,
				},
				panel = { enabled = false },
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup({
				method = "getCompletionsCycling",
			})
		end,
	},
}
lvim.builtin.cmp.formatting.source_names["copilot"] = "(Copilot)"
table.insert(lvim.builtin.cmp.sources, 1, { name = "copilot" })

require("nvim-lastplace").setup()
-- hop
require("hop").setup()
vim.api.nvim_set_keymap("n", "<leader>j", ":HopLine<cr>", { silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>w", ":HopWordCurrentLine<cr>", { silent = true })
lvim.keys.normal_mode["<leader>w"] = ":HopWordCurrentLine<cr>"
lvim.keys.normal_mode["<leader>/"] = ":HopPattern<cr>"
lvim.keys.normal_mode["<leader>q"] = ":HopWord<cr>"
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
-- Run gofmt + goimport on save
local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require("go.format").goimport()
	end,
	group = format_sync_grp,
})
