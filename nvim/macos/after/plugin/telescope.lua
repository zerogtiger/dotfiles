local builtin = require('telescope.builtin')

require "telescope".setup {
  pickers = {
    colorscheme = {
      enable_preview = true,
    }
  }
}

vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Buffers' })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>of', builtin.oldfiles, { desc = '[O]ld [F]iles' })
vim.keymap.set('n', '<leader>ht', builtin.help_tags, { desc = '[H]elp [T]ags' })
vim.keymap.set('n', '<leader>lg', builtin.live_grep, { desc = '[L]ive [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = '[/] Fuzzy search in current buffer' })
vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = '[G]oto [R]eference' })
vim.keymap.set('n', '<leader>ws', builtin.lsp_dynamic_workspace_symbols, { desc = '[W]orkspace [S]ymbols' })
vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, { desc = '[D]ocument [S]ymbols' })

-- vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>gs', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.keymap.set('n', '<leader>cl', builtin.colorscheme, { desc = '[C]o[L]orscheme' })
