return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"folke/neodev.nvim",
		-- "hrsh7th/cmp-nvim-lsp",
		"saghen/blink.cmp",
		"b0o/schemastore.nvim",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		require("neodev").setup()

		local lspconfig = require("lspconfig")

		local blink = require("blink.cmp")

		local basic_on_attach = function(_, bufnr)
			vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
			-- vim.diagnostic.config({ update_in_insert = true })
			local km = vim.keymap

			km.set("n", "<leader>gR", "<cmd>Telescope lsp_references<CR>", { desc = "Goto references" })
			km.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "Goto declaration" })
			km.set("n", "<leader>gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Goto definitions" })
			km.set("n", "<leader>gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "Goto implementations" })
			km.set("n", "<leader>gt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Goto type definitions" })
			km.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
			km.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
			km.set("v", "<leader>rs", 'y:%s/<C-r>"//<left>', { desc = "Rename section" })
			km.set("n", "<leader>db", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Buffer diagnostics" })
			km.set("n", "<leader>dl", vim.diagnostic.open_float, { desc = "Line diagnostics" })
			km.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Goto previous diagnostic" })
			km.set("n", "]d", vim.diagnostic.goto_next, { desc = "Goto next diagnostic" })
			km.set("n", "K", vim.lsp.buf.hover, { desc = "Selection documentation" })
			km.set("n", "<leader>xx", ":LspRestart<CR>", { desc = "Restart LSP" })
		end

		local ts_on_attach = function(_, bufnr)
			basic_on_attach(_, bufnr)
			vim.keymap.set("n", "<leader>L", "<ESC>wbywoconsole.log()<ESC>hp", { desc = "Log under cursor" })
		end

		local go_on_attach = function(_, bufnr)
			basic_on_attach(_, bufnr)
			vim.keymap.set("n", "<leader>L", "<ESC>wbywofmt.Println()<ESC>hp", { desc = "Log under cursor" })
			vim.keymap.set("n", "<leader>ge", "oif err != nil {<CR>}<ESC>Oreturn ", { desc = "Go Err" })
		end

		local capabilities = blink.get_lsp_capabilities()
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}
		local schemas = require("schemastore")

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		lspconfig.bashls.setup({
			capabilities = capabilities,
			on_attach = basic_on_attach,
		})

		lspconfig.html.setup({
			capabilities = capabilities,
			on_attach = basic_on_attach,
		})

		lspconfig.ts_ls.setup({
			capabilities = capabilities,
			on_attach = ts_on_attach,
		})

		lspconfig.cssls.setup({
			capabilities = capabilities,
			on_attach = basic_on_attach,
		})

		lspconfig.tailwindcss.setup({
			capabilities = capabilities,
			on_attach = basic_on_attach,
		})

		lspconfig.graphql.setup({
			capabilities = capabilities,
			on_attach = basic_on_attach,
		})

		lspconfig.emmet_ls.setup({
			capabilities = capabilities,
			on_attach = basic_on_attach,
		})

		lspconfig.pyright.setup({
			capabilities = capabilities,
			on_attach = basic_on_attach,
		})

		lspconfig.jsonls.setup({
			settings = {
				json = {
					schemas = schemas.json.schemas(),
					validate = { enable = true },
				},
			},
			capabilities = capabilities,
			on_attach = basic_on_attach,
		})

		lspconfig.yamlls.setup({
			settings = {
				yaml = {
					schemaStore = { enable = false, url = "" },
					schemas = schemas.yaml.schemas(),
				},
			},
			capabilities = capabilities,
			on_attach = basic_on_attach,
		})

		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = { vim.env.VIMRUNTIME },
						checkThirdParty = false,
					},
					telemetry = {
						enable = false,
					},
					completion = {
						callSnipper = "Replace",
					},
				},
			},
			capabilities = capabilities,
			on_attach = basic_on_attach,
		})

		lspconfig.marksman.setup({
			capabilities = capabilities,
			on_attach = basic_on_attach,
		})

		lspconfig.gopls.setup({
			capabilities = capabilities,
			on_attach = go_on_attach,
			settings = {
				gopls = {
					usePlaceholders = false,
					analyses = {
						unusedparams = true,
					},
				},
			},
		})

		lspconfig.qmlls.setup({
			cmd = { "qmlls6" },
			capabilities = capabilities,
			on_attach = basic_on_attach,
		})

		lspconfig.marksman.setup({
			capabilities = capabilities,
			on_attach = basic_on_attach,
		})
	end,
}
