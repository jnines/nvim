return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"saghen/blink.cmp",
		"b0o/schemastore.nvim",
		{ "antosha417/nvim-lsp-file-operations" },
	},
	config = function()
		local blink = require("blink.cmp")
		require("lsp-file-operations").setup()

		vim.diagnostic.config({
			virtual_lines = {
				current_line = true,
			},
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.INFO] = "󰋼 ",
					[vim.diagnostic.severity.HINT] = "󰌵 ",
				},
				numhl = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.HINT] = "",
					[vim.diagnostic.severity.INFO] = "",
				},
			},
		})
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
		km.set("n", "K", vim.lsp.buf.hover, { desc = "Selection documentation" })
		km.set("n", "<leader>xx", ":LspRestart<CR>", { desc = "Restart LSP" })
		km.set("n", "<leader>L", "<ESC>wbywofmt.Println()<ESC>hp", { desc = "Log under cursor" })
		km.set("n", "<leader>ge", "oif err != nil {<CR>}<ESC>Oreturn ", { desc = "Go Err" })
		km.set("n", "<leader>L", "<ESC>wbywoconsole.log()<ESC>hp", { desc = "Log under cursor" })

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, blink.get_lsp_capabilities())
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}

		local schemas = require("schemastore")
		local servers = {
			bashls = {},
			html = {},
			ts_ls = {},
			cssls = {},
			tailwindcss = {},
			graphql = {},
			emmet_ls = {},
			pyright = {},
			jsonls = {
				settings = {
					json = {
						schemas = schemas.json.schemas(),
						validate = { enable = true },
					},
				},
			},
			yamlls = {
				settings = {
					yaml = {
						schemaStore = { enable = false, url = "" },
						schemas = schemas.yaml.schemas(),
					},
				},
			},
			lua_ls = {
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
			},
			marksman = {},
			gopls = {
				settings = {
					gopls = {
						usePlaceholders = false,
						analyses = {
							unusedparams = true,
						},
					},
				},
			},
			qmlls = { cmd = { "qmlls6" } },
		}

		for serv, cfg in pairs(servers) do
			cfg.capabilities = vim.tbl_deep_extend("force", {}, capabilities, cfg.capabilities or {})
			vim.lsp.config(serv, cfg)
			vim.lsp.enable(serv)
		end
	end,
}
