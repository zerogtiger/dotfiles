vim.keymap.set('n', '<leader>fe', vim.cmd.NvimTreeToggle)

require("nvim-tree").setup {
    renderer = {
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
                modified = true,
            },
            glyphs = {
                default = "=",
                symlink = "%",
                bookmark = "@",
                modified = "*",
                folder = {
                    arrow_closed = ">",
                    arrow_open = "v",
                    default = "{}",
                    open = "{/",
                    empty = "[]",
                    empty_open = "[/",
                    symlink = "%",
                    symlink_open = "%",
                },
                git = {
                    unstaged = "x",
                    staged = "-/",
                    unmerged = "Y",
                    renamed = "-",
                    untracked = "#",
                    deleted = "~",
                    ignored = "o",
                },
            },
        },
    },
    diagnostics = {
        icons = {
            hint = "!)",
            info = "i)",
            warning = "!\\",
            error = "x)",
        },
    },
}

