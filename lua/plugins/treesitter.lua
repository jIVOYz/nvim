return {
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      local config = require('nvim-treesitter.configs')
      config.setup({
        ensure_installed = { 'lua', 'javascript', 'typescript' },
        highlight = { enable = true },
        indent = { enable = true },
        auto_install = true,
      })
    end
  },
  {
    -- Enables JSX/TSX comments
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = vim.fn.has("nvim-0.10.0") == 1,
  }
}
