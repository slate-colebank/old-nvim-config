--[[
local coq = require("coq")
local jdtls = require("jdtls")

local config = coq.lsp_ensure_capabilities({
    cmd = { vim.fm.expand('~/.local/share/nvim/mason/bin/jdtls') },
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
})
-- require('jdtls').start_or_attach(config)
jdtls.start_or_attach(config)

vim.defer_fn(function()
  local coq = require("coq")

  local config = {
    cmd = { vim.fn.expand('~/.local/share/nvim/mason/bin/jdtls') },
    root_dir = require('lspconfig').util.root_pattern('gradlew', '.git', 'mvnw')() or vim.fn.getcwd(),
    settings = {
      java = {
        inlayHints = {
          parameterNames = {
            enabled = "all",
          },
        },
      },
    },
    on_attach = function(client, bufnr)
      -- Enable inlay hints if supported
      if client.server_capabilities.inlayHintProvider then
        vim.lsp.buf.inlay_hint(bufnr, true)
      end
      -- Additional on_attach configuration can go here
    end,
  }

  require('jdtls').start_or_attach(coq.lsp_ensure_capabilities(config))
end, 100) -- Delay execution by 100ms to ensure coq is loaded
]]--
