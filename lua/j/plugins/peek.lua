return {
	"toppair/peek.nvim",
	build = "deno task --quiet build:fast",
	config = function()
		local peek = require("peek")

		peek.setup({
			theme = "dark",
		})
		local function peekt()
			if peek.is_open() then
				peek.close()
			else
				peek.open()
			end
		end
		vim.keymap.set("n", "<leader>mp", peekt, { desc = "Markdown Preview" })
	end,
}
