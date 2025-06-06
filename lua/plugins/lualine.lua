return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")
		local harpoon = require("harpoon")
		local harpoon_line = function()
			local total_marks = harpoon:list():length()

			if total_marks == 0 then
				return ""
			end

			local curr_mark = "—"

			local mark_idx = harpoon:list():get()
			if mark_idx ~= nil then
				curr_mark = tostring(mark_idx)
			end

			return string.format("⇁ %s/%d", curr_mark, total_marks)
		end

		lualine.setup({
			options = {
				theme = "auto",
				disabled_filetypes = {
					statusline = { "alpha", "NvimTree" },
					winbar = {
						"help",
						"alpha",
						"dashboard",
						"neogitstatus",
						"NvimTree",
						"Trouble",
						"lir",
						"Outline",
						"spectre_panel",
						"toggleterm",
					},
					NvimTree = {},
				},
			},
			sections = {
				lualine_c = {
					{ "filesize" },
					{ "filename", path = 3 },
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#9c814f" },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
			winbar = {
				lualine_a = { { "filename", path = 1 }, harpoon_line },
				lualine_z = { "hostname" },
			},
			inactive_winbar = {
				lualine_a = { { "filename", path = 1 }, harpoon_line },
				lualine_z = { "hostname" },
			},
			extensions = { "lazy" },
		})
	end,
}
