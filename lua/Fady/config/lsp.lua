--                ╭─────────────────────────────────────────────╮
--                │ Written by Fady nagh from http://fadyio.com │
--                │             Email:me@fadyio.com             │
--                │               Github: @fadyio               │
--                ╰─────────────────────────────────────────────╯

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event) end,
})

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"gopls",
		"graphql",
		"helm_ls",
		"jsonls",
		"pyright",
		"sqlls",
		"terraformls",
		"yamlls",
	},
})

local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = {
					"vim",
					"use",
					"after_each",
				},
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

-- setup languages
-- GoLang
lspconfig["gopls"].setup({
	cmd = { "gopls" },
	on_attach = on_attach,
	capabilities = capabilities,
	filetype = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = require("lspconfig.util").root_pattern("go.work", "go.mod", ".git"),
})

local get_servers = require("mason-lspconfig").get_installed_servers
for _, server_name in ipairs(get_servers()) do
	lspconfig[server_name].setup({
		capabilities = lsp_capabilities,
	})
end

require("mason-null-ls").setup({
	ensure_installed = {
		"gofmt",
		"goimports",
		"isort",
		"fixjson",
		"black",
		"terraform_fmt",
		"yamlfmt",
		"stylua",
		"jq",
		"ansiblelint",
		"flake8",
		"golangci_lint",
		"hadolint",
		"todo_comments",
		"trail_space",
		"zsh",
		"yamllint",
	},
	automatic_installation = true,
	handlers = {},
})

-- disable the virtual text
vim.diagnostic.config({
	virtual_text = false,
	virtual_lines = { only_current_line = true },
	underline = false,
	severity_sort = true,
	float = {
		border = "rounded",
	},
})

-- Change diagnostic symbols in the sign column (gutter)
local signs = { Error = "", Warn = "", Hint = "󱍅", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
