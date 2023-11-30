return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	config = function()
		local outline = require("outline")

		outline.setup({
			preview_window = {
				auto_preview = true,
			},
		})
	end,
	vim.keymap.set("n", "<leader>o", "<cmd>Outline<cr>", { desc = "Toggle outline" }),
}
