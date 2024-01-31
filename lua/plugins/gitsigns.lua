return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local gs = require("gitsigns")

		gs.setup({
			numhl = true,
			signcolumn = false,
		})
		vim.keymap.set("n", "<leader>gb", gs.toggle_current_line_blame, { desc = "Git blame toggle" })
		vim.keymap.set("n", "<leader>gp", gs.preview_hunk, { desc = "Git preview hunk" })
	end,
}
