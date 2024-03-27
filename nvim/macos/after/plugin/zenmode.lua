require("zen-mode").setup({
    window = {
        backdrop = 0, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
        width = 120,    -- width of the Zen window
    },
    plugins = {
        twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
    }
})

vim.keymap.set('n', '<leader>zz', vim.cmd.ZenMode)
