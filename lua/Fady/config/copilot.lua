--                ╭─────────────────────────────────────────────╮
--                │ Written by Fady nagh from http://fadyio.com │
--                │             Email:me@fadyio.com             │
--                │               Github: @fadyio               │
--                ╰─────────────────────────────────────────────╯

local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
	return
end

copilot.setup({
	panel = { enabled = false },
	suggestion = { enabled = false },
	filetypes = {
		yaml = false,
		markdown = false,
		help = false,
		gitcommit = false,
		gitrebase = false,
		hgcommit = false,
		svn = false,
		cvs = false,
		["."] = false,
	},
	copilot_node_command = "node", -- Node.js version must be > 16.x
	server_opts_overrides = {},
})

require("CopilotChat").setup({
	model = "gpt-4", -- GPT model to use, 'gpt-3.5-turbo' or 'gpt-4'
	question_header = "  Fady", -- Header to use for user questions
	answer_header = "  Copilot", -- Header to use for AI answers
	error_header = "  Errors", -- Header to use for errors
	separator = "", -- Separator to use in chat
	show_help = false,
	auto_insert_mode = true, -- Automatically enter insert mode
	-- default window options
	window = {
		layout = "float", -- 'vertical', 'horizontal', 'float'
		width = 0.5, -- fractional width of parent, or absolute width in columns when > 1
		height = 0.5, -- fractional height of parent, or absolute height in rows when > 1
		relative = "editor", -- 'editor', 'win', 'cursor', 'mouse'
		border = "single", -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
		title = "Copilot Chat", -- title of chat window
	},
})
