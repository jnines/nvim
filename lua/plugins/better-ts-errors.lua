return {
	"OlegGulevskyy/better-ts-errors.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	ft = { "javascript", "typescript", "typescriptreact", "javascriptreact" },
	opts = {
		keymaps = {
			toggle = "<leader>dd", -- default '<leader>dd'
			go_to_definition = "<leader>dx", -- default '<leader>dx'
		},
	},
}
