return {
	"ThePrimeagen/harpoon",
	dependencies = { "nvim-lua/plenary.nvim" },
	branch = "harpoon2",
	config = function()
		local harpoon = require("harpoon")
		local extensions = require("harpoon.extensions")
		harpoon:setup({
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = true,
			},
		})
		vim.keymap.set("n", "<leader>hm", function()
			harpoon:list():append()
		end, { desc = "Mark file" })
		vim.keymap.set("n", "<leader>hh", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Marks menu" })
		harpoon:extend({
			UI_CREATE = function(cx)
				vim.keymap.set("n", "<C-v>", function()
					harpoon.ui:select_menu_item({ vsplit = true })
				end, { buffer = cx.bufnr })
			end,
			harpoon:extend(extensions.builtins.navigate_with_number()),
		})
	end,
}
