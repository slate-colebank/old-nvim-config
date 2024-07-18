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
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "windwp/nvim-autopairs",
    },
    
    config = function()
      local cmp = require('cmp')
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')

      cmp.setup {
        sources = {
          { name = "nvim_lsp"},
          { name = 'nvim_lsp_signature_help' },
          { name = "path" },
          { name = "buffer" },
        },

        mapping = {
          ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },

        window = {
          completion = {
            border = "rounded",
            winhighlight = "Normal:CmpNormal",
          },
          documentation = {
            border = "rounded",
            winhighlight = "Normal:CmpDocNormal",
          }
        }
      }

      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,

    config = function()
      local lspconfig = require('lspconfig')

      -- attach function
      local function on_attach(client, bufnr)
        if client.server_capabilities.inlayHintProvider then
          vim.lsp.inlay_hint.enable(true)
        end
      end


      lspconfig.clangd.setup {
        on_attach = on_attach,
        settings = {},
      }

      lspconfig.jdtls.setup {
        on_attach = on_attach,
        settings = {},
      }
    end
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },
}
