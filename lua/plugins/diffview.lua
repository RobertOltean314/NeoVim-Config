require("diffview").setup()

vim.keymap.set("n", "<leader>gD", "<cmd>DiffviewOpen<cr>", { desc = "Git: open diffview" })
vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", { desc = "Git: file history" })
vim.keymap.set("n", "<leader>gH", "<cmd>DiffviewFileHistory<cr>", { desc = "Git: repo history" })
vim.keymap.set("n", "<leader>gx", "<cmd>DiffviewClose<cr>", { desc = "Git: close diffview" })
