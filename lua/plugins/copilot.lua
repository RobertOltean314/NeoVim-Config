require("copilot").setup({
	suggestion = {
		enabled = true,
		auto_trigger = true,
		keymap = {
			accept = "<M-l>", -- Alt+l to accept full suggestion
			accept_word = "<M-w>", -- Alt+w to accept one word
			next = "<M-]>", -- Alt+] next suggestion
			prev = "<M-[>", -- Alt+[ previous suggestion
			dismiss = "<M-e>", -- Alt+e dismiss
		},
	},
	panel = { enabled = false },
})
