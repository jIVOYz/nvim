return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
    config = function()
      ensure_installed = { "tsserver", "lua_ls", "rust_analyzer" }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp"
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require('lspconfig')

      -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
      local servers = { "tsserver", "lua_ls", "rust_analyzer", "emmet_language_server" }
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
          -- on_attach = my_custom_on_attach,
          capabilities = capabilities,
        })
      end

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.rename, {})
      vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>gi", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, {})
    end,
  },
}
