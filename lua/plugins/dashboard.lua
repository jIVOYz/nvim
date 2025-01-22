return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    local logo = {}
    local ascii = {
[[]],
[[]],
[[  o\]],
[[   _________/__\__________]],
[[  |                  - (  |]],
[[ ,'-.                 . `-|]],
[[(____".       ,-.    '   ||]],
[[  |          /\,-\   ,-.  |]],
[[  |      ,-./     \ /'.-\ |]],
[[  |     /-.,\      /     \|]],
[[  |    /     \    ,-.     \]],
[[    |___/_______\__/___\_____\]],
[[]],
[[]],
    }
    for _, item in ipairs(ascii) do
      table.insert(logo, item)
    end

    require("dashboard").setup {
      theme = "doom",
      config = {
        header = logo,
        center = {
          {
            icon = "  ",
            icon_hl = "Title",
            desc = "Find File           ",
            desc_hl = "String",
            key = "f",
            keymap = "SPC ;",
            key_hl = "Number",
            action = "lua require'telescope.builtin'.find_files()"
          },
          {
            icon = "  ",
            desc = "Nvim config",
            key = "n",
            keymap = "SPC ; n",
            action = "lua require'telescope.builtin'.find_files({ cwd = '~/.config/nvim', prompt_title = 'neovim', hidden='true', no_ignore='true' })"
          },
          {
            icon = "  ",
            desc = "Find Dotfiles",
            key = "d",
            keymap = "SPC ; d",
            action = "lua require'telescope.builtin'.find_files({ cwd = '~/dotfiles', prompt_title = 'dotfiles', hidden='true', no_ignore='true' })"
          },
        },
        footer = {},
      }
    }
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } }
}
