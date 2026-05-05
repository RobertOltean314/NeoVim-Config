require("conform").setup({
	formatters_by_ft = {
		ruby = { "rubocop" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		html = { "prettier" },
		eruby = { "htmlbeautifier" },
		css = { "prettier" },
		json = { "prettier" },
		lua = { "stylua" },
		yaml = { "prettier" },
		go = { "gofmt" },
		python = { "black" },
		rust = { "rustfmt" },
	},
})
vim.keymap.set({ "n", "v", "i" }, "<C-A-l>", function()
	require("conform").format({ timeout_ms = 10000 })
end, { desc = "Format file" })

-- format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		require("conform").format({ timeout_ms = 10000 })
	end,
})
