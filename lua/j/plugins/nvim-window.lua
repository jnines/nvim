return {
	"yorickpeterse/nvim-window",
	config = function()
		local window = require("nvim-window")

		window.setup({
			hint_hl = "Bold",
		})

		vim.keymap.set("n", "<leader>w", window.pick, { desc = "Window picker" })
	end,
}
