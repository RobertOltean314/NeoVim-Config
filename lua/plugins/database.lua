vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/db_ui"

vim.keymap.set("n", "<leader>Db", "<cmd>DBUIToggle<cr>", { desc = "DB: toggle UI" })
vim.keymap.set("n", "<leader>Df", "<cmd>DBUIFindBuffer<cr>", { desc = "DB: find buffer" })
vim.keymap.set("n", "<leader>Dr", "<cmd>DBUIRenameBuffer<cr>", { desc = "DB: rename buffer" })
vim.keymap.set("n", "<leader>Dl", "<cmd>DBUILastQueryInfo<cr>", { desc = "DB: last query info" })
