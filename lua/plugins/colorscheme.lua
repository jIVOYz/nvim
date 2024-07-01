return {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true },
  { "folke/tokyonight.nvim", lazy = false, priority = 1000, config = function() vim.cmd.colorscheme('tokyonight') end}
}
