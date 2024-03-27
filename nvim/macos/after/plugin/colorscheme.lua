vim.cmd.highlight('DiagnosticUnderlineError', 'gui=undercurl')
vim.cmd.highlight('DiagnosticUnderlineHint', 'gui=undercurl')
vim.cmd.highlight('DiagnosticUnderlineWarn', 'gui=undercurl')
vim.cmd.highlight('DiagnosticUnderlineInfo', 'gui=undercurl')
vim.cmd.highlight('DiagnosticUnderlineOk', 'gui=undercurl')
vim.cmd("colorscheme modus")

-- vim.cmd("colorscheme default")
-- vim.cmd("hi Pmenu guifg=#f6f3e8 guibg=#333333 gui=none")
-- vim.cmd("hi Visual guibg=#555555 gui=none")
-- vim.cmd("hi cursorline guibg=#333333 gui=none")
-- vim.cmd("hi cursorcolumn guibg=#191919 gui=none")
-- vim.cmd("hi colorcolumn guibg=#444444 gui=none")
-- vim.cmd("hi signcolumn guibg=#444444 gui=none")
-- vim.cmd("hi endofbuffer guifg=#444444 gui=none")
-- vim.cmd("hi linenr guibg=#222222 guifg=#AAAAAA gui=none")
-- vim.cmd("hi cursorlinenr guibg=#222222 guifg=#FFFFFF gui=none")
-- -- vim.cmd("hi linenrbelow guifg=#AAAAAA gui=none")
-- -- vim.cmd("hi linenrbelow guifg=#AAAAAA gui=none")
-- -- vim.cmd("hi Normal guifg=#454545 gui=none")
-- -- vim.cmd("hi statusline guifg=#ffffff")
-- -- vim.cmd("hi statusline guifg=#ffffff")
-- -- vim.cmd("hi Status2 guifg=#F6955B guibg=#38A89D")
-- vim.cmd("hi clear Conceal")



-- vim.g.gruvbox_contrast_dark = 'hard'
-- vim.cmd.colorscheme("gruvbox")
-- vim.cmd.colorscheme("onenord")
-- vim.cmd.colorscheme("dracula")
-- vim.api.nvim_set_hl(0, 'Visual', { standout = true })

-- require("rose-pine").setup({
--     variant = "moon", -- auto, main, moon, or dawn
--     dark_variant = "moon", -- main, moon, or dawn
--     dim_inactive_windows = true,
--     extend_background_behind_borders = false,
--
--     enable = {
--         terminal = true,
--         legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
--         migrations = true, -- Handle deprecated options automatically
--     },
--
--     styles = {
--         bold = true,
--         italic = true,
--         transparency = false,
--     },
--
--     groups = {
--         border = "muted",
--         link = "iris",
--         panel = "surface",
--
--         error = "love",
--         hint = "iris",
--         info = "foam",
--         note = "pine",
--         todo = "rose",
--         warn = "gold",
--
--         git_add = "foam",
--         git_change = "rose",
--         git_delete = "love",
--         git_dirty = "rose",
--         git_ignore = "muted",
--         git_merge = "iris",
--         git_rename = "pine",
--         git_stage = "iris",
--         git_text = "rose",
--         git_untracked = "subtle",
--
--         h1 = "iris",
--         h2 = "foam",
--         h3 = "rose",
--         h4 = "gold",
--         h5 = "pine",
--         h6 = "foam",
--     },
--
--     highlight_groups = {
--         -- Comment = { fg = "foam" },
--         -- VertSplit = { fg = "muted", bg = "muted" },
--     },
--
--     before_highlight = function(group, highlight, palette)
--         -- Disable all undercurls
--         -- if highlight.undercurl then
--         --     highlight.undercurl = false
--         -- end
--         --
--         -- Change palette colour
--         -- if highlight.fg == palette.pine then
--         --     highlight.fg = palette.foam
--         -- end
--     end,
-- })
--
-- vim.cmd("colorscheme rose-pine")
