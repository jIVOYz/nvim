return {
  {
    "Mofiqul/dracula.nvim",
    config = function()
      -- vim.cmd [[colorscheme dracula]]
    end
  },
  {
    "catppuccin/nvim", name = "catppuccin", priority = 1000,
    config = function()
      vim.cmd [[colorscheme catppuccin-latte]]
    end
  }
}
