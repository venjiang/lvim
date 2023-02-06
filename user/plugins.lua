vim.g.copilot_assume_mapped = true
-- vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

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
	-- {
	--   "ggandor/flit.nvim",
	--   config = function()
	--     require('flit').setup({
	--       keys = { f = 'f', F = 'F', t = 't', T = 'T' },
	--       -- A string like "nv", "nvo", "o", etc.
	--       labeled_modes = "v",
	--       multiline = true,
	--       -- Like `leap`s similar argument (call-specific overrides).
	--       -- E.g.: opts = { equivalence_classes = {} }
	--       opts = {}
	--     })
	--   end
	-- },
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
	-- {
	-- 	"phaazon/hop.nvim",
	-- 	branch = "v2", -- optional but strongly recommended
	-- 	config = function()
	-- 		-- you can configure Hop the way you like here; see :h hop-config
	-- 		-- require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
	-- 		require("hop").setup()
	-- 	end,
	-- },
	-- copilot
	"github/copilot.vim",
	-- {
	-- 	"zbirenbaum/copilot.lua",
	-- 	cmd = "Copilot",
	-- 	event = "InsertEnter",
	-- 	config = function()
	-- 		require("copilot").setup({})
	-- 	end,
	-- },
	-- gopher
	-- {
	-- 	"olexsmir/gopher.nvim",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 	},
	-- },
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
-- local gopher = require("gopher")
-- gopher.setup({
-- 	commands = {
-- 		go = "go",
-- 		gomodifytags = "gomodifytags",
-- 		gotests = "gotests",
-- 		impl = "impl",
-- 		iferr = "iferr",
-- 	},
-- })

-- local lsp_manager = require("lvim.lsp.manager")
-- lsp_manager.setup("golangci_lint_ls", {
-- 	on_init = require("lvim.lsp").common_on_init,
-- 	capabilities = require("lvim.lsp").common_capabilities(),
-- })

-- go lsp
-- local dap_ok, dapgo = pcall(require, "dap-go")
-- if not dap_ok then
-- 	return
-- end

-- dapgo.setup()
-- lsp_manager.setup("gopls", {
-- 	on_attach = function(client, bufnr)
-- 		require("lvim.lsp").common_on_attach(client, bufnr)
-- 		local _, _ = pcall(vim.lsp.codelens.refresh)
-- 		local map = function(mode, lhs, rhs, desc)
-- 			if desc then
-- 				desc = desc
-- 			end

-- 			vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc, buffer = bufnr, noremap = true })
-- 		end
-- 		map("n", "<leader>Ci", "<cmd>GoInstallDeps<Cr>", "Install Go Dependencies")
-- 		map("n", "<leader>Ct", "<cmd>GoMod tidy<cr>", "Tidy")
-- 		map("n", "<leader>Ca", "<cmd>GoTestAdd<Cr>", "Add Test")
-- 		map("n", "<leader>CA", "<cmd>GoTestsAll<Cr>", "Add All Tests")
-- 		map("n", "<leader>Ce", "<cmd>GoTestsExp<Cr>", "Add Exported Tests")
-- 		map("n", "<leader>Cg", "<cmd>GoGenerate<Cr>", "Go Generate")
-- 		map("n", "<leader>Cf", "<cmd>GoGenerate %<Cr>", "Go Generate File")
-- 		map("n", "<leader>Cc", "<cmd>GoCmt<Cr>", "Generate Comment")
-- 		map("n", "<leader>DT", "<cmd>lua require('dap-go').debug_test()<cr>", "Debug Test")
-- 	end,
-- 	on_init = require("lvim.lsp").common_on_init,
-- 	capabilities = require("lvim.lsp").common_capabilities(),
-- 	settings = {
-- 		gopls = {
-- 			usePlaceholders = true,
-- 			gofumpt = true,
-- 			codelenses = {
-- 				generate = false,
-- 				gc_details = true,
-- 				test = true,
-- 				tidy = true,
-- 			},
-- 		},
-- 	},
-- })
