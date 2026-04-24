vim.keymap.set("n", "<leader>tt", ":split | terminal<CR>")
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
