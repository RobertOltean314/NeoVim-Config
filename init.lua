vim.g.mapleader = ' '
require("core.options")

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "nvim-treesitter/nvim-treesitter", event = "BufReadPre" },
  {"ellisonleao/gruvbox.nvim", lazy = false, priority = 1000},
  { "neovim/nvim-lspconfig",           event = "BufReadPre" },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    }
  },
  { "ibhagwan/fzf-lua",        event = "VeryLazy" },
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },
  { "windwp/nvim-autopairs",   event = "InsertEnter" },
  { "lewis6991/gitsigns.nvim", event = "BufReadPre" },
  { "tpope/vim-fugitive",      cmd = "Git" },
  { "tpope/vim-rails",         ft = { "ruby", "eruby" } },
  { "tpope/vim-endwise",       ft = { "ruby", "eruby" } },
  { "tpope/vim-bundler",       ft = { "ruby", "eruby" } },
  { "stevearc/conform.nvim",   event = "BufReadPre" },
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },
})

require("core.keymaps")
require("core.colorscheme")
require("plugins.treesitter")
require("plugins.lsp")
require("plugins.cmp")
require("plugins.fzf")
require("plugins.nvim-tree")
require("plugins.autopairs")
require("plugins.git")
require("plugins.conform")
require("plugins.lualine")
