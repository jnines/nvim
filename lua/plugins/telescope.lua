return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-project.nvim",
		"debugloop/telescope-undo.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "truncate " },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
			extensions = {
				project = {
					hidden_files = true,
					sync_with_nvim_tree = true,
				},
				fzf = {},
				undo = {
					side_by_side = true,
					layout_strategy = "vertical",
					layout_config = {
						preview_height = 0.9,
					},
					saved_only = true,
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("project")

		local km = vim.keymap

		km.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files" })
		km.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find with Live Grep" })
		km.set("n", "<leader>fq", "<cmd>Telescope quickfix<cr>", { desc = "List Quickfix" })
		km.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		km.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor" })
		km.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Find help tags" })
		km.set("n", "<leader>fs", "<cmd>Telescope spell_suggest<cr>", { desc = "Fix spelling" })
		km.set("n", "<leader>fp", "<cmd>Telescope project<cr>", { desc = "Find project" })
		km.set("n", "<leader>bm", "<cmd>Telescope buffers<cr>", { desc = "Buffer menu" })
		km.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Find keymaps" })
		km.set("n", "<leader>fw", "<cmd>Telescope grep_string<cr>", { desc = "Find word" })
		km.set("n", "<leader>u", "<cmd>Telescope undo<cr>", { desc = "Undo Tree" })
	end,
}
