return {
  {
    'nvim-tree/nvim-web-devicons'
  },
  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require('nvim-tree').setup {}

      vim.keymap.set('n', '<leader>e', vim.cmd.NvimTreeToggle)
    end
  }
}
