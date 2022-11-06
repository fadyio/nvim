local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions
local actions = null_ls.builtins.code_actions

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should useinstead
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
	sources = {
		-- formatting
		formatting.stylua, --lua
		formatting.clang_format, -- c and c++
		formatting.rustfmt, -- for rust
		formatting.shfmt, -- for shell
		formatting.markdownlint, --for markdown
		formatting.cmake_format, --for cmake files
		formatting.sqlfluff, -- for sql and postgres
		formatting.yapf, --for python

		-- diagnostics
		diagnostics.ansiblelint, -- for ansible
		diagnostics.codespell, -- for text files
		diagnostics.cppcheck, -- for c and c++
		diagnostics.eslint_d, -- for javascript
		diagnostics.flake8, -- for python
		diagnostics.gitlint, -- for git
		diagnostics.luacheck, -- for lua
		diagnostics.markdownlint, -- for markdown
		diagnostics.shellcheck, -- for shell
		diagnostics.semgrep, -- Static analysis at ludicrous speedo
		diagnostics.zsh, -- for zsh
		diagnostics.yamllint, -- for yaml

		-- actions
		actions.gitsigns,
	},
})
