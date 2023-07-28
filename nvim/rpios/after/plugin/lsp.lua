local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    -- 'lua_ls',
    -- 'clangd',
    'jdtls',  -- java
    -- 'pylsp',  --python3 virtual environment
    -- 'r_language_server',
    'ltex',   --latex
    -- 'rome',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, { desc = '[F]or[M]ats current buffer' })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = '[G]oto [D]efinition' })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = '[G]oto [I]mplementation' })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = '[K] hover documentation' })
    -- vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
    --  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    --  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    --  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    --  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    --  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

require 'lspconfig'.jdtls.setup { cmd = { 'jdtls' } }

-- require('lspconfig')['clangd'].setup {
--     cmd = {"clangd", "-fallback-style=\"{ IndentWidth: 4}\""}
--     -- cmd = {"clangd", "--indent-file=4"}
-- }
