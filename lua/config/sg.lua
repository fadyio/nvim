local status_ok, nvim_tree = pcall(require, "sg")
if not status_ok then
	return
end

-- Setup the LSP server to attach when you edit an sg:// buffer
require("sg").setup({})
