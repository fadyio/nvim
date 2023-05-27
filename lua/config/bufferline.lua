local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline.setup({
	options = {
	mode = "buffers", -- set to "tabs" to only show tabpages instead
	           style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
	           numbers = "ordinal",
	           buffer_close_icon = '',
	           modified_icon = '●',
            close_icon = '',
            left_trunc_marker = '',
            right_trunc_marker = '',
            max_name_length = 18,
            tab_size = 18,
             diagnostics = "nvim_lsp",
		close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
		separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
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
