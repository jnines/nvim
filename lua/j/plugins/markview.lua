return {
	"OXY2DEV/markview.nvim",
	lazy = false,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},

	vim.keymap.set("n", "<leader>mp", ":Markview toggle<CR>", { desc = "Markdown Preview" }),
}
