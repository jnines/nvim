return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")

		wk.setup({
			replace = {
				key = {
					{ "<tab>", "TAB" },
					{ "<space>", "SPC" },
					{ "<leader>", "SPC" },
				},
			},
		})

		wk.add({
			{ "<leader>G", ":LazyGit<CR>", desc = "Git" },
			{ "<leader>b", group = "Buffers" },
			{ "<leader>c", group = "Code" },
			{ "<leader>d", group = "Diagnostics" },
			{ "<leader>e", group = "File Tree" },
			{ "<leader>f", group = "File" },
			{ "<leader>g", group = "GoTo" },
			{ "<leader>h", group = "Harpoon" },
			{ "<leader>i", group = "Icons" },
			{ "<leader>q", "<cmd>xa<CR><cmd>qa<CR>", desc = "Quit" },
			{ "<leader>r", group = "Rename" },
			{ "<leader>s", group = "Splits" },
			{ "<leader>t", group = "Tabs" },
			{ "<leader>x", group = "Extras" },
		})
	end,
}
