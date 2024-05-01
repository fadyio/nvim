local neogit = require("neogit")

neogit.setup({
	-- Used to generate URL's for branch popup action "pull request".
	git_services = {
		["github.com"] = "https://github.com/${owner}/${repository}/compare/${branch_name}?expand=1",
		["bitbucket.org"] = "https://bitbucket.org/${owner}/${repository}/pull-requests/new?source=${branch_name}&t=1",
		["gitlab.com"] = "https://gitlab.com/${owner}/${repository}/merge_requests/new?merge_request[source_branch]=${branch_name}",
	},
	-- Allows a different telescope sorter. Defaults to 'fuzzy_with_index_bias'. The example below will use the native fzf
	telescope_sorter = function()
		return require("telescope").extensions.fzf.native_fzf_sorter()
	end,
	-- Configure highlight group features
	highlight = {
		italic = true,
		bold = true,
		underline = true,
	},
	-- Change the default way of opening neogit
	kind = "tab",
	-- Disable line numbers and relative line numbers
	disable_line_numbers = true,
	status = {
		recent_commit_count = 10,
	},
	commit_editor = {
		kind = "auto",
	},
	commit_select_view = {
		kind = "tab",
	},
	commit_view = {
		kind = "vsplit",
		verify_commit = os.execute("which gpg") == 0, -- Can be set to true or false, otherwise we try to find the binary
	},
	log_view = {
		kind = "tab",
	},
	rebase_editor = {
		kind = "auto",
	},
	reflog_view = {
		kind = "tab",
	},
	merge_editor = {
		kind = "auto",
	},
	tag_editor = {
		kind = "auto",
	},
	preview_buffer = {
		kind = "split",
	},
	popup = {
		kind = "split",
	},
	signs = {
		-- { CLOSED, OPENED }
		hunk = { "", "" },
		item = { ">", "v" },
		section = { ">", "v" },
	},
	-- Each Integration is auto-detected through plugin presence, however, it can be disabled by setting to `false`
	integrations = {
		-- If enabled, use telescope for menu selection rather than vim.ui.select.
		telescope = true,
		-- Requires you to have `sindrets/diffview.nvim` installed.
		diffview = true,
	},
	mappings = {
		commit_editor = {
			["q"] = "Close",
			["<c-c><c-c>"] = "Submit",
			["<c-c><c-k>"] = "Abort",
		},
		rebase_editor = {
			["p"] = "Pick",
			["r"] = "Reword",
			["e"] = "Edit",
			["s"] = "Squash",
			["f"] = "Fixup",
			["x"] = "Execute",
			["d"] = "Drop",
			["b"] = "Break",
			["q"] = "Close",
			["<cr>"] = "OpenCommit",
			["gk"] = "MoveUp",
			["gj"] = "MoveDown",
			["<c-c><c-c>"] = "Submit",
			["<c-c><c-k>"] = "Abort",
		},
		finder = {
			["<cr>"] = "Select",
			["<c-c>"] = "Close",
			["<esc>"] = "Close",
			["<c-n>"] = "Next",
			["<c-p>"] = "Previous",
			["<down>"] = "Next",
			["<up>"] = "Previous",
			["<tab>"] = "MultiselectToggleNext",
			["<s-tab>"] = "MultiselectTogglePrevious",
			["<c-j>"] = "NOP",
		},
		-- Setting any of these to `false` will disable the mapping.
		popup = {
			["?"] = "HelpPopup",
			["A"] = "CherryPickPopup",
			["D"] = "DiffPopup",
			["M"] = "RemotePopup",
			["P"] = "PushPopup",
			["X"] = "ResetPopup",
			["Z"] = "StashPopup",
			["b"] = "BranchPopup",
			["c"] = "CommitPopup",
			["f"] = "FetchPopup",
			["l"] = "LogPopup",
			["m"] = "MergePopup",
			["p"] = "PullPopup",
			["r"] = "RebasePopup",
			["v"] = "RevertPopup",
			["w"] = "WorktreePopup",
		},
		status = {
			["q"] = "Close",
			["I"] = "InitRepo",
			["1"] = "Depth1",
			["2"] = "Depth2",
			["3"] = "Depth3",
			["4"] = "Depth4",
			["<tab>"] = "Toggle",
			["x"] = "Discard",
			["s"] = "Stage",
			["S"] = "StageUnstaged",
			["<c-s>"] = "StageAll",
			["u"] = "Unstage",
			["U"] = "UnstageStaged",
			["$"] = "CommandHistory",
			["#"] = "Console",
			["Y"] = "YankSelected",
			["<c-r>"] = "RefreshBuffer",
			["<enter>"] = "GoToFile",
			["<c-v>"] = "VSplitOpen",
			["<c-x>"] = "SplitOpen",
			["<c-t>"] = "TabOpen",
			["{"] = "GoToPreviousHunkHeader",
			["}"] = "GoToNextHunkHeader",
		},
	},
})
