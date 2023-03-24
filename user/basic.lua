vim.o.timeout = true
vim.o.timeoutlen = 300
vim.opt.wrap = true
lvim.colorscheme = "onedarker"
lvim.leader = ","
lvim.builtin.alpha.active = false
-- lvim.builtin.nvimtree.setup.view.side = "right"
-- lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = true
lvim.builtin.terminal.open_mapping = "<C-t>"
-- fg = "#abb2bf",
-- bg = "#1f2227",
vim.cmd("au ColorScheme * hi VertSplit ctermfg=8 ctermbg=none guifg=#292C33 guibg=none")
