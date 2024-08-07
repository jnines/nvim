---@diagnostic disable: missing-fields
return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"tree-sitter/tree-sitter-regex",
			"nvim-treesitter/nvim-treesitter-context",
		},
		config = function()
			local treesitter = require("nvim-treesitter.configs")

			local tsctx = require("treesitter-context")

			vim.keymap.set("n", "<leader>gc", function()
				tsctx.go_to_context()
			end, { silent = true, desc = "Goto context" })

			treesitter.setup({
				highlight = {
					enable = true,
				},
				indent = { enable = true },
				ensure_installed = {
					"json",
					"javascript",
					"yaml",
					"html",
					"markdown",
					"markdown_inline",
					"bash",
					"vim",
					"dockerfile",
					"gitignore",
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
			})
		end,
	},
}
