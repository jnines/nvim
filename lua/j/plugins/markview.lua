return {
	"OXY2DEV/markview.nvim",
	lazy = false,

	vim.keymap.set("n", "<leader>mp", ":Markview toggle<CR>", { desc = "Markdown Preview" }),
}
