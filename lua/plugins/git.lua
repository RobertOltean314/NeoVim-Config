require("gitsigns").setup({
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '-' },
  },
})

-- fugitive keymaps
vim.keymap.set('n', '<leader>gs', ':Git<CR>')           -- git status
vim.keymap.set('n', '<leader>gc', ':Git commit<CR>')    -- git commit
vim.keymap.set('n', '<leader>gp', ':Git push<CR>')      -- git push
vim.keymap.set('n', '<leader>gb', ':Git blame<CR>')     -- git blame
vim.keymap.set('n', '<leader>gd', ':Git diff<CR>')      -- git diff
