return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				mode = "tabs",
				diagnostics = "nvim_lsp",
				offsets = {
					filetype = "NvimTree",
					text = function()
						return "File Explorer"
					end,
					text_align = "center",
					separator = true,
				},
				separator_style = "slant",
				always_show_bufferline = false,
			},
		})
	end,
}
