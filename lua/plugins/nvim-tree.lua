require("nvim-tree").setup({
  view = {
    width = 30,
    side = "left",
  },
  renderer = {
    icons = {
      show = {
        file = true,
        folder = true,
      },
    },
  },
  filters = {
    dotfiles = false
  },
})

-- keymaps 
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>ef', ':NvimTreeFindFile<CR>') 
