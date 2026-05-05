require("neotest").setup({
	adapters = {
		require("neotest-rspec"),
		require("neotest-python")({ runner = "pytest" }),
		require("neotest-jest")({ jestCommand = "npx jest" }),
		require("neotest-vitest"),
		require("neotest-rust"),
		require("neotest-java"),
	},
	output = { open_on_run = true },
	summary = {
		open = "botright vsplit | vertical resize 40",
	},
})

vim.keymap.set("n", "<leader>tn", function() require("neotest").run.run() end, { desc = "Test: run nearest" })
vim.keymap.set("n", "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, { desc = "Test: run file" })
vim.keymap.set("n", "<leader>ta", function() require("neotest").run.run(vim.fn.getcwd()) end, { desc = "Test: run all" })
vim.keymap.set("n", "<leader>ts", function() require("neotest").summary.toggle() end, { desc = "Test: toggle summary" })
vim.keymap.set("n", "<leader>to", function() require("neotest").output_panel.toggle() end, { desc = "Test: toggle output" })
vim.keymap.set("n", "<leader>tS", function() require("neotest").run.stop() end, { desc = "Test: stop" })
