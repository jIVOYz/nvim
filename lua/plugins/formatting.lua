return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescriptreact = { "prettierd" },
        html = { "prettierd" },
        css = { "prettierd" },
        json = { "prettierd" },
        markdown = { "prettierd" },
        lua = { "stylua" },
        rust = { "rustfmt" }
      }
    })

    vim.keymap.set({ "n", "v" }, "<leader>gf", function()
      conform.format({ lsp_fallback = true })
    end)
  end
}
