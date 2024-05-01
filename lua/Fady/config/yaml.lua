local yaml_cfg = require("yaml-companion").setup({
  builtin_matchers = {
    -- Detects Kubernetes files based on content
    kubernetes = { enabled = true },
  },
  schemas = {
    {
      name = "Kubernetes 1.27.12",
      uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.27.12-standalone-strict/all.json",
    },
    {
      name = "Kubernetes 1.26.14",
      uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.26.14-standalone-strict/all.json",
    },
  },
  lspconfig = {
    on_attach = default_on_attach,
    capabilities = capabilities,
    cmd = { "node", vim.fn.expand("~/Repos/yaml-language-server/out/server/src/server.js"), "--stdio" },
    settings = {
      yaml = {
        -- if these lines are commented out, there are no completions
        -- schemas = {
        --   kubernetes = '/*',
        -- },
      },
    },
  },
})
require("lspconfig")["yamlls"].setup(yaml_cfg)
