vim.lsp.set_log_level(vim.log.levels.ERROR)

require("mason").setup();

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "clangd",
    "jdtls",
    "ltex",
    "texlab",
    "pylsp",
    "r_language_server",
    "ts_ls",
    "html",
    "cssls",
    "tailwindcss",
    "rust_analyzer",
    "biome",
  }
})

vim.diagnostic.config({
  virtual_text = true,
  signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN]  = "󰀪",
            [vim.diagnostic.severity.HINT]  = "󰌶",
            [vim.diagnostic.severity.INFO]  = "󰋽",
        },
    },
})

-- Capabilities for nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Shared on_attach
local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr }

  vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end

-- Lua LS
vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        checkThirdParty = false,
      },
    },
  },
})

-- Clangd
vim.lsp.config("clangd", {
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = {
    "clangd",
    "--fallback-style={IndentWidth: 4}",
  },
})

-- JDTLS
vim.lsp.config("jdtls", {
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = { "jdtls" },
})

-- Generic servers
local servers = {
  "ltex",
  "texlab",
  "pylsp",
  "r_language_server",
  "ts_ls",
  "html",
  "cssls",
  "tailwindcss",
  "rust_analyzer",
  "biome",
}

for _, server in ipairs(servers) do
  vim.lsp.config(server, {
    capabilities = capabilities,
    on_attach = on_attach,
  })
end

-- Enable all servers
vim.lsp.enable({
  "lua_ls",
  "clangd",
  "jdtls",
  "ltex",
  "texlab",
  "pylsp",
  "r_language_server",
  "ts_ls",
  "html",
  "cssls",
  "tailwindcss",
  "rust_analyzer",
  "biome",
})

local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
  }),
  sources = {
    { name = "nvim_lsp" },
  },
})

-- local lsp = require("lsp-zero")
--
-- lsp.preset("recommended")
--
-- lsp.set_sign_icons({
-- error = '',
-- warn = '󰀪',
-- hint = '󰌶',
-- info = '󰋽'
-- })
--
-- lsp.ensure_installed({
--     'lua_ls',
--     'clangd',
--     'jdtls',  -- java
--     'ltex',   --latex
--     'texlab', -- latex
--     'pylsp',  --python
--     'r_language_server',
--     -- 'typescript-language-server',
--     'ts_ls',
--     'html', -- html
--     'cssls',
--     'tailwindcss',
--     'rust_analyzer',
--     'biome', -- json, js, ts
--     -- deprecated
--     -- 'tsserver',
-- })
--
-- -- Fix Undefined global 'vim'
-- lsp.nvim_workspace()
--
-- local cmp = require('cmp')
-- local cmp_select = { behavior = cmp.SelectBehavior.Select }
-- local cmp_mappings = lsp.defaults.cmp_mappings({
--     ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
--     ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
--     ['<Tab>'] = cmp.mapping.confirm({ select = true }),
--     ["<C-Space>"] = cmp.mapping.complete(),
-- })
--
-- lsp.setup_nvim_cmp({
--     mapping = cmp_mappings
-- })
--
-- lsp.on_attach(function(client, bufnr)
--     local opts = { buffer = bufnr, remap = false }
--
--     vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, { desc = '[F]or[M]ats current buffer' })
--     vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = '[G]oto [D]efinition' })
--     vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = '[G]oto [I]mplementation' })
--     vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = '[K] hover documentation' })
--     -- vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
--     --  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
--     vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
--     vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
--     --  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
--     --  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
--     --  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
--     --  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
--     vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
-- end)
--
-- lsp.setup()
--
-- vim.diagnostic.config({
--     virtual_text = true
-- })
--
-- -- JDTLS setup
-- require 'lspconfig'.jdtls.setup { cmd = { 'jdtls' } }
--
-- -- require('lspconfig')['clangd'].setup {
-- --     cmd = {"clangd", "-fallback-style=\"{ IndentWidth: 4}\""}
-- --     -- cmd = {"clangd", "--indent-file=4"}
-- -- }
