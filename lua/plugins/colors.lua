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
      -- vim.cmd [[colorscheme catppuccin-latte]]
    end
  },
  {
    "rose-pine/neovim",
    config = function()
      -- vim.cmd [[colorscheme rose-pine-main]]
    end
  },
  {
    "sainnhe/gruvbox-material",
    config = function()
      -- vim.cmd [[colorscheme gruvbox-material]]
    end
  },
  {
    "folke/tokyonight.nvim",
    config = function()
      vim.cmd [[colorscheme tokyonight-night]]
    end
  }
}
