require("aerial").setup({
	on_attach = function(bufnr)
		vim.keymap.set("n", "[s", "<cmd>AerialPrev<CR>", { buffer = bufnr, desc = "Aerial: prev symbol" })
		vim.keymap.set("n", "]s", "<cmd>AerialNext<CR>", { buffer = bufnr, desc = "Aerial: next symbol" })
	end,
	layout = { min_width = 30 },
	show_guides = true,
})

vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>", { desc = "Toggle symbol outline" })
