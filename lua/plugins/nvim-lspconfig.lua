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
