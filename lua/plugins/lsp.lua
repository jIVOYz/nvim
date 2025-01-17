return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup({})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"ts_ls",
					"emmet_language_server",
					"tailwindcss",
					"html",
					"cssls",
					"rust_analyzer",
					"lua_ls",
					"bashls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
		},
		config = function()
			-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
			local lspconfig = require("lspconfig")

			local servers = {
				"ts_ls",
				"lua_ls",
				"rust_analyzer",
				"emmet_language_server",
				"cssls",
				"html",
				"clangd",
				"bashls",
				"gopls",
				"tailwindcss",
				"pylsp",
			}
			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup({
					-- on_attach = my_custom_on_attach,
					capabilities = capabilities,
				})
			end

			lspconfig.volar.setup({
				init_options = {
					typescript = {
						tsdk = "/usr/lib/node_modules/typescript/lib",
					},
				},
			})

			-- Add border to pop up windows
			require("lspconfig.ui.windows").default_options.border = "single"

			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "single",
			})
			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
				border = "single",
			})
			vim.diagnostic.config({
				float = { border = "single" },
			})

			local bufopts = { noremap = true, silent = true, buffer = bufnr }

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {})
			vim.keymap.set("n", "<space>ge", vim.diagnostic.open_float, bufopts)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>gi", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
			end, {})
		end,
	},
}
