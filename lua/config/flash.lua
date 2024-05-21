require("flash").setup({
	search = {
		-- search/jump in all windows
		multi_window = true,
		-- search direction
		forward = true,
		-- when `false`, find only matches in the given direction
		wrap = true,
		mode = "exact",
		-- behave like `incsearch`
		incremental = true,
		-- Excluded filetypes and custom window filters
		exclude = {
			"notify",
			"cmp_menu",
			"noice",
			"flash_prompt",
			function(win)
				-- exclude non-focusable windows
				return not vim.api.nvim_win_get_config(win).focusable
			end,
		},
	},
	keys = {
		{
			"s",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
		{
			"S",
			mode = { "n", "x", "o" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		},
		{
			"r",
			mode = "o",
			function()
				require("flash").remote()
			end,
			desc = "Remote Flash",
		},
		{
			"R",
			mode = { "o", "x" },
			function()
				require("flash").treesitter_search()
			end,
			desc = "Treesitter Search",
		},
		{
			"<c-s>",
			mode = { "c" },
			function()
				require("flash").toggle()
			end,
			desc = "Toggle Flash Search",
		},
	},
	jump = {
		-- jump position
		pos = "start", ---@type "start" | "end" | "range"
		-- clear highlight after jump
		nohlsearch = true,
		-- automatically jump when there is only one match
		autojump = true,
	},
	label = {
		-- allow uppercase labels
		uppercase = true,
		-- add any labels with the correct case here, that you want to exclude
		exclude = "",
		-- position of the label extmark
		style = "overlay", ---@type "eol" | "overlay" | "right_align" | "inline"
		-- flash tries to re-use labels that were already assigned to a position,
		-- when typing more characters. By default only lower-case labels are re-used.
		reuse = "lowercase", ---@type "lowercase" | "all" | "none"
		-- for the current window, label targets closer to the cursor first
		distance = true,
		-- minimum pattern length to show labels
		-- Ignored for custom labelers.
		min_pattern_length = 0,
		-- Enable this to use rainbow colors to highlight labels
		-- Can be useful for visualizing Treesitter ranges.
		rainbow = {
			enabled = false,
			-- number between 1 and 9
			shade = 5,
		},
	},
	highlight = {
		-- show a backdrop with hl FlashBackdrop
		backdrop = true,
		-- Highlight the search matches
		matches = true,
		-- extmark priority
		priority = 5000,
		groups = {
			match = "FlashMatch",
			current = "FlashCurrent",
			backdrop = "FlashBackdrop",
			label = "FlashLabel",
		},
	},
	modes = {
		-- options used when flash is activated through
		-- a regular search with `/` or `?`
		search = {
			-- when `true`, flash will be activated during regular search by default.
			-- You can always toggle when searching with `require("flash").toggle()`
			enabled = true,
			highlight = { backdrop = false },
			jump = { history = true, register = true, nohlsearch = true },
			search = {
				-- `forward` will be automatically set to the search direction
				-- `mode` is always set to `search`
				-- `incremental` is set to `true` when `incsearch` is enabled
			},
		},
		-- options used when flash is activated through
		-- `f`, `F`, `t`, `T`, `;` and `,` motions
		char = {
			enabled = true,
			jump_labels = true,
			-- This allows using those keys directly after the motion
			label = { exclude = "hjkliardc" },
		},
	},
	-- options for the floating window that shows the prompt,
	-- for regular jumps
	prompt = {
		enabled = true,
		prefix = { { "⚡", "FlashPromptIcon" } },
		win_config = {
			relative = "editor",
			width = 1, -- when <=1 it's a percentage of the editor width
			height = 1,
			row = -1, -- when negative it's an offset from the bottom
			col = 0, -- when negative it's an offset from the right
			zindex = 1000,
		},
	},
})
