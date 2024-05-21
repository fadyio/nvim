local actions = require("diffview.actions")

require("diffview").setup({
	diff_binaries = false, -- Show diffs for binaries
	git_cmd = { "git" }, -- The git executable followed by default args.
	use_icons = true, -- Requires nvim-web-devicons
	show_help_hints = true, -- Show hints for how to open the help panel
	icons = { -- Only applies when use_icons is true.
		folder_closed = "",
		folder_open = "",
	},
	signs = {
		fold_closed = "",
		fold_open = "",
		done = "✓",
	},
	file_panel = {
		listing_style = "tree", -- One of 'list' or 'tree'
		tree_options = { -- Only applies when listing_style is 'tree'
			flatten_dirs = true, -- Flatten dirs that only contain one single dir
			folder_statuses = "only_folded", -- One of 'never', 'only_folded' or 'always'.
		},
		win_config = { -- See ':h diffview-config-win_config'
			position = "left",
			width = 35,
			win_opts = {},
		},
	},
})
