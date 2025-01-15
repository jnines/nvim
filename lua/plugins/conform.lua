return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				bash = { "shfmt" },
				sh = { "shfmt" },
				zsh = { "shfmt" },
			},

			format_on_save = function(bufnr)
				if vim.b[bufnr].disable_autoformat then
					return
				end
				return { timeout_ms = 1000, lsp_format = "fallback" }
			end,

			formatters = {
				prettier = {
					prepend_args = { "--single-quote", "--jsx-single-quote" },
				},
				shfmt = {
					args = { "-bn" },
				},
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>,", function()
			conform.format({
				timeout_ms = 1000,
				lsp_fallback = true,
				async = false,
			})
		end, { desc = "Format file or section" })

		vim.keymap.set({ "n", "v" }, "<leader>F", function()
			vim.b.disable_autoformat = not vim.b.disable_autoformat
			if vim.b.disable_autoformat then
				print("Auto Formatting disabled")
			else
				print("Auto Formatting enabled")
			end
		end, {
			desc = "Toggle Auto formatting",
		})
	end,
}
