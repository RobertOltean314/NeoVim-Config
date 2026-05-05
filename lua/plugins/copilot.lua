require("copilot").setup({
	suggestion = {
		enabled = true,
		auto_trigger = true,
		keymap = {
			accept = "<M-l>",
			accept_word = "<M-w>",
			next = "<M-]>",
			prev = "<M-[>",
			dismiss = "<M-e>",
		},
	},
	panel = { enabled = false },
})

-- Toggle copilot suggestions
vim.keymap.set("n", "<leader>ct", function()
	require("copilot.suggestion").toggle_auto_trigger()
end, { desc = "Copilot: Toggle auto suggestions" })
