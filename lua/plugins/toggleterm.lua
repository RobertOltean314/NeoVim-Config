require("toggleterm").setup({
	size = 15,
	open_mapping = [[<C-\>]],
	direction = "horizontal",
	shell = vim.o.shell,
	shade_terminals = true,
})

local Terminal = require("toggleterm.terminal").Terminal
local rails_server = Terminal:new({ cmd = "bundle exec rails server", hidden = true })
local rails_console = Terminal:new({ cmd = "bundle exec rails console", hidden = true })

vim.keymap.set("n", "<leader>rs", function() rails_server:toggle() end, { desc = "Rails: server" })
vim.keymap.set("n", "<leader>ri", function() rails_console:toggle() end, { desc = "Rails: console" })
