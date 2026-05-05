local dap = require("dap")
local dapui = require("dapui")

-- Ruby
require("dap-ruby").setup()

-- Python (requires: pip install debugpy)
require("dap-python").setup()

-- JS/TS (requires manual one-time install — see README or run:
--   git clone --depth 1 --branch v1.74.1 https://github.com/microsoft/vscode-js-debug \
--     ~/.local/share/nvim/vscode-js-debug && \
--   cd ~/.local/share/nvim/vscode-js-debug && \
--   npm install --legacy-peer-deps --ignore-scripts && \
--   npx gulp vsDebugServerBundle && mv dist out
local js_debug_path = vim.fn.expand("~/.local/share/nvim/vscode-js-debug")
if vim.fn.isdirectory(js_debug_path) == 1 then
	require("dap-vscode-js").setup({
		debugger_path = js_debug_path,
		adapters = { "pwa-node", "pwa-chrome" },
	})
end
for _, lang in ipairs({ "javascript", "typescript", "javascriptreact", "typescriptreact" }) do
	dap.configurations[lang] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach to process",
			processId = require("dap.utils").pick_process,
			cwd = "${workspaceFolder}",
		},
	}
end

-- Rust (requires: codelldb in PATH — https://github.com/vadimcn/codelldb/releases)
dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		command = "codelldb",
		args = { "--port", "${port}" },
	},
}
dap.configurations.rust = {
	{
		name = "Launch Rust",
		type = "codelldb",
		request = "launch",
		program = function()
			vim.fn.system("cargo build 2>&1")
			return vim.fn.getcwd() .. "/target/debug/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
	},
}

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: continue" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: step over" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: step into" })
vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debug: step out" })
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: toggle breakpoint" })
vim.keymap.set("n", "<leader>dB", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Debug: conditional breakpoint" })
vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Debug: toggle UI" })
vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Debug: open REPL" })
vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "Debug: run last" })
