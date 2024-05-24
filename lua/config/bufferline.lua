--                ╭─────────────────────────────────────────────╮
--                │ Written by Fady nagh from http://fadyio.com │
--                │             Email:me@fadyio.com             │
--                │               Github: @fadyio               │
--                ╰─────────────────────────────────────────────╯
local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline.setup({
	highlights = require("catppuccin.groups.integrations.bufferline").get(),
	options = {
		mode = "buffers",
		style_preset = bufferline.style_preset.default,
		numbers = "ordinal",
		modified_icon = "",
		buffer_close_icon = "",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_prefix_length = 15,
		max_name_length = 14,
		tab_size = 14,
		color_icons = true,
		offsets = {
			{
				filetype = "NvimTree",
				text = "  Files",
				highlight = "StatusLine",
				text_align = "left",
			},
		},
		separator_style = "slope",
		show_close_icon = false,

		custom_areas = {
			left = function()
				return {
					{ text = "  ", fg = "#8fff6d" },
				}
			end,
		},
	},

	-- move between buffer in nvovim with leader key and number of buffer
	vim.keymap.set("n", "<Leader>1", function()
		require("bufferline").go_to_buffer(1, true)
	end, { noremap = true, silent = true }),
	vim.keymap.set("n", "<Leader>2", function()
		require("bufferline").go_to_buffer(2, true)
	end, { noremap = true, silent = true }),
	vim.keymap.set("n", "<Leader>3", function()
		require("bufferline").go_to_buffer(3, true)
	end, { noremap = true, silent = true }),
	vim.keymap.set("n", "<Leader>4", function()
		require("bufferline").go_to_buffer(4, true)
	end, { noremap = true, silent = true }),
	vim.keymap.set("n", "<Leader>5", function()
		require("bufferline").go_to_buffer(5, true)
	end, { noremap = true, silent = true }),
	vim.keymap.set("n", "<Leader>6", function()
		require("bufferline").go_to_buffer(6, true)
	end, { noremap = true, silent = true }),
	vim.keymap.set("n", "<Leader>7", function()
		require("bufferline").go_to_buffer(7, true)
	end, { noremap = true, silent = true }),
	vim.keymap.set("n", "<Leader>8", function()
		require("bufferline").go_to_buffer(8, true)
	end, { noremap = true, silent = true }),
	vim.keymap.set("n", "<Leader>9", function()
		require("bufferline").go_to_buffer(9, true)
	end, { noremap = true, silent = true }),
})
