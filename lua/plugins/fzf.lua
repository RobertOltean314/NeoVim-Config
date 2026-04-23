local fzf = require("fzf-lua")

fzf.setup({
  winopts = {
    height = 0.85,
    width = 0.85,
    preview = {
      layout = "vertical",
    },
  },
})

vim.keymap.set('n', '<leader>ff', fzf.files)
vim.keymap.set('n', '<leader>fg', fzf.live_grep)
vim.keymap.set('n', '<leader>fb', fzf.buffers)
vim.keymap.set('n', '<leader>fh', fzf.help_tags)
vim.keymap.set('n', '<leader>fr', fzf.oldfiles)
