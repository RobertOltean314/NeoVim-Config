require("conform").setup({
  formatters_by_ft = {
    ruby = { "rubocop" },
    javascript = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    json = { "prettier" },
    lua = { "stylua" },
  },
})

vim.keymap.set('n', '<leader>fm', function()
  require("conform").format({ timeout_ms = 10000 })
end)
