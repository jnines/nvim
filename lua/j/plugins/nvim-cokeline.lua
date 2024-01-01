return {
	"willothy/nvim-cokeline",
	config = function()
		local cokeline = require("cokeline")
		local mappings = require("cokeline/mappings")
		local get_hex = require("cokeline.hlgroups").get_hl_attr

		local comments_fg = get_hex("Comment", "fg")
		local errors_fg = get_hex("DiagnosticError", "fg")
		local warnings_fg = get_hex("DiagnosticWarn", "fg")

		local red = vim.g.terminal_color_1
		local yellow = vim.g.terminal_color_3
		local teal = vim.g.terminal_color_4

		local components = {
			space = {
				text = " ",
				truncation = { priority = 1 },
			},

			separator = {
				text = function(buffer)
					return buffer.index ~= 1 and "󱋱" or ""
				end,
				truncation = { priority = 1 },
			},

			devicon = {
				text = function(buffer)
					return (mappings.is_picking_focus() or mappings.is_picking_close()) and buffer.pick_letter .. " "
						or buffer.devicon.icon
				end,
				fg = function(buffer)
					return (mappings.is_picking_focus() and yellow)
						or (mappings.is_picking_close() and red)
						or buffer.devicon.color
				end,
				bold = function(_)
					return mappings.is_picking_focus()
				end,
				italic = function(_)
					return mappings.is_picking_focus()
				end,
				truncation = { priority = 1 },
			},

			unique_prefix = {
				text = function(buffer)
					return buffer.unique_prefix
				end,
				fg = comments_fg,
				italic = true,
				truncation = {
					priority = 3,
					direction = "left",
				},
			},
			filename = {
				text = function(buffer)
					return buffer.filename
				end,
				bold = function(buffer)
					return buffer.is_focused
				end,
				underline = function(buffer)
					return buffer.is_focused and buffer.diagnostics.errors ~= 0
				end,
				truncation = {
					priority = 2,
					direction = "left",
				},
			},

			diagnostics = {
				text = function(buffer)
					return (buffer.diagnostics.errors ~= 0 and "  " .. buffer.diagnostics.errors)
						or (buffer.diagnostics.warnings ~= 0 and "  " .. buffer.diagnostics.warnings)
						or ""
				end,
				fg = function(buffer)
					return (buffer.diagnostics.errors ~= 0 and errors_fg)
						or (buffer.diagnostics.warnings ~= 0 and warnings_fg)
						or nil
				end,
				truncation = { priority = 1 },
			},

			close_or_unsaved = {
				text = function(buffer)
					return buffer.is_modified and "●" or "󰅙"
				end,
				fg = function(buffer)
					return buffer.is_modified and red or teal
				end,
				delete_buffer_on_left_click = true,
				truncation = { priority = 1 },
			},
		}

		cokeline.setup({
			default_hl = {
				fg = function(buffer)
					return buffer.is_focused and get_hex("Normal", "fg") or get_hex("Comment", "fg")
				end,
				bg = function()
					return get_hex("ColorColumn", "bg")
				end,
			},
			sidebar = {
				filetype = { "NvimTree" },
				components = {
					{
						text = function(_)
							return "   File Exporer"
						end,
						fg = yellow,
						bg = function()
							return get_hex("NvimTreeNormal", "bg")
						end,
						bold = true,
					},
				},
			},
			components = {
				components.space,
				components.separator,
				components.space,
				components.devicon,
				components.space,
				components.unique_prefix,
				components.filename,
				components.diagnostics,
				components.space,
				components.space,
				components.close_or_unsaved,
			},
		})
		vim.keymap.set("n", "<leader>bp", function()
			mappings.pick("focus")
		end, { desc = "Pick buffer to focus" })
	end,
}
