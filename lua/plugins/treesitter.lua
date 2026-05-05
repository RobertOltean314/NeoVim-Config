require("nvim-treesitter.config").setup({
	ensure_installed = {
		"ruby", "python", "javascript", "typescript", "tsx",
		"lua", "rust", "java", "html", "css", "json", "yaml",
	},
	highlight = { enable = true },
})
