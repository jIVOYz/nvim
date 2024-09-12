return {
  {
    'nvim-tree/nvim-web-devicons'
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      local neotree = require('neo-tree')
      neotree.setup({
        event_handlers = {
          {
            event = "file_open_requested",
            handler = function()
              require("neo-tree.command").execute({ action = "close" })
            end
          },
        },
        window = {
          position = "right"
        },
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = true,
            hide_hidden = false,
            hide_by_name = { 'node_modules' },
            always_show = {
              ".gitignore",
            },
            always_show_by_pattern = {
              ".env*",
            },
          }
        }
      })

      vim.keymap.set('n', '<leader>e', '<cmd>Neotree position=right toggle<CR>')
    end
  }
}
