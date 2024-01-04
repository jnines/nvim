return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local gs = require("gitsigns")

		gs.setup({
			numhl = true,
			signcolumn = false,
		})
	end,
}
