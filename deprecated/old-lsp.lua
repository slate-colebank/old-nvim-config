return {
  {
    "williamboman/mason.nvim",
    config=function()
      require("mason").setup {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        },
      } 
    end
  },
  {
    "mfussenegger/nvim-jdtls",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config=function()
    require("mason-lspconfig").setup {
      ensure_installed = {
        "clangd",
        "jdtls"
      },
      automatic_installation = true,
    }
    end
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    -- event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "ms-jpq/coq_nvim", branch = "coq" },
      { "ms-jpq/coq.artifacts", branch = "artifacts" },
      { 'ms-jpq/coq.thirdparty', branch = "3p" },
    },
    init = function()
      vim.g.coq_settings = {
        auto_start = 'shut up', -- if you want to start COQ at startup
        -- Your COQ settings here
      }
    end,
    config = function()
      opts = {
        inlay_hints = {
          enabled = true,
          exclude = { "txt" },
        },
        document_highlight = { enabled = true },
        diagnostics = {
          underline = true,
        },
        settings = {
          --[[
          clangd = {
            inlayHints = {
              enabled = false,
              ParameterNames = true,
              DeducedTypes = true,
            }
          },
          --]]
          java = {
            inlayHints = { parameterNames = { enabled = "all" } };
          }
        }
      }
      local lspconfig = require("lspconfig")
      local coq = require("coq")

      lspconfig.clangd.setup(coq.lsp_ensure_capabilities({
        filetypes = { "c", "cpp"},
        -- inlayHints = {enabled = false,},
        on_attach = function(client, bufnr)
          -- vim.lsp.buf.inlay_hint.enable(0, true)
        end
      }))
      lspconfig.jdtls.setup(coq.lsp_ensure_capabilities({
         -- jdtls coq setup
        on_attach = function(client, bufnr)
          vim.lsp.buf.inlay_hint(0, true)
         end
      }))
    end
  },
  {
    { "p00f/clangd_extensions.nvim" },
  },
}
