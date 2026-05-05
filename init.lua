vim.g.mapleader = " "
require("core.options")

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "nvim-tree/nvim-web-devicons", opts = {} },
	{ "nvim-treesitter/nvim-treesitter", event = "BufReadPre" },
	{ "ellisonleao/gruvbox.nvim", lazy = false, priority = 1000 },
	{ "neovim/nvim-lspconfig", event = "BufReadPre" },
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
	},
	{ "ibhagwan/fzf-lua", event = "VeryLazy" },
	{
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{ "windwp/nvim-autopairs", event = "InsertEnter" },
	{ "lewis6991/gitsigns.nvim", event = "BufReadPre" },
	{ "tpope/vim-fugitive", cmd = "Git" },
	{ "tpope/vim-rails", ft = { "ruby", "eruby" } },
	{ "tpope/vim-endwise", ft = { "ruby", "eruby" } },
	{ "tpope/vim-bundler", ft = { "ruby", "eruby" } },
	{ "stevearc/conform.nvim", event = "BufReadPre" },
	require("plugins.lint"),
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000,
		opts = {},
	},
	{
		"L3MON4D3/LuaSnip",
		event = "InsertEnter",
		dependencies = {
			"rafamadriz/friendly-snippets", -- includes Rails snippets
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{ "zbirenbaum/copilot.lua" },
	-- DAP (debugger)
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"suketa/nvim-dap-ruby",
			-- Python: pip install debugpy
			"mfussenegger/nvim-dap-python",
			-- JS/TS: adapter installed manually, see dap.lua comment
			"mxsdev/nvim-dap-vscode-js",
		},
	},
	-- Neotest (test runner)
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"olimorris/neotest-rspec",
			"nvim-neotest/neotest-python",
			"haydenmeade/neotest-jest",
			"marilari88/neotest-vitest",
			"rouge8/neotest-rust",
			"rcasia/neotest-java",
		},
	},
	-- Java LSP
	require("plugins.java"),
	-- Trouble (diagnostics panel)
	{ "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	-- Database
	{
		"tpope/vim-dadbod",
		lazy = true,
		dependencies = {
			{ "kristijanhusak/vim-dadbod-ui", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", lazy = true },
		},
	},
	-- Symbol outline
	{
		"stevearc/aerial.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	},
	-- Git diff viewer
	{ "sindrets/diffview.nvim", cmd = { "DiffviewOpen", "DiffviewFileHistory" } },
	-- Terminal
	{ "akinsho/toggleterm.nvim" },
	-- UI overhaul
	{
		"folke/noice.nvim",
		event = "UIEnter",
		dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
	},
	-- Better input/select popups
	{ "stevearc/dressing.nvim", event = "VeryLazy" },
	-- Breadcrumbs
	{
		"utilyre/barbecue.nvim",
		dependencies = { "SmiteshP/nvim-navic", "nvim-tree/nvim-web-devicons" },
	},
})

require("core.keymaps")
require("core.colorscheme")
require("plugins.treesitter")
require("plugins.lsp")
require("plugins.cmp")
require("plugins.fzf")
require("plugins.nvim-tree")
require("plugins.autopairs")
require("plugins.git")
require("plugins.conform")
require("plugins.lualine")
require("plugins.copilot")
require("plugins.noice")
require("plugins.dressing")
require("plugins.breadcrumbs")
require("plugins.dap")
require("plugins.neotest")
require("plugins.trouble")
require("plugins.database")
require("plugins.aerial")
require("plugins.diffview")
require("plugins.toggleterm")
