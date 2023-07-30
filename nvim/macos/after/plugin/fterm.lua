require 'FTerm'.setup({
    border = 'double',
})

vim.api.nvim_create_user_command('FTermOpen', function()
    require('FTerm').open()
    vim.cmd.stopinsert()
end, { bang = true })
vim.api.nvim_create_user_command('FTermClose', require('FTerm').close, { bang = true })
vim.api.nvim_create_user_command('FTermExit', require('FTerm').exit, { bang = true })
vim.api.nvim_create_user_command('FTermToggle', function()
    require('FTerm').toggle()
    vim.cmd.stopinsert()
end, { bang = true })

vim.keymap.set('n', '<leader>t', vim.cmd.FTermToggle, { desc = '[F]loat terminal [T]oggle' })
