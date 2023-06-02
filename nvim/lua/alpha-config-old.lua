-- alpha-config.lua

local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
 return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
[[        _            _    _        _            _             _              _            _               _   _          _           _             _           _            _            _            _        _       ]],
[[       / /\         / /\ /\ \     /\_\         /\ \     _    /\ \           /\ \         /\ \            /\_\/\_\ _     /\ \       /\ \           /\ \        /\ \         / /\         /\ \         /\ \     /\ \     ]],
[[      / /  \       / /  \\ \ \   / / /        /  \ \   /\_\ /  \ \          \_\ \       /  \ \          / / / / //\_\   \ \ \     /  \ \         /  \ \      /  \ \       / /  \       /  \ \       /  \ \    \_\ \    ]],
[[     / / /\ \__   / / /\ \\ \ \_/ / /        / /\ \ \_/ / // /\ \ \         /\__ \     / /\ \ \        /\ \/ \ \/ / /   /\ \_\   / /\ \ \       / /\ \ \    / /\ \ \     / / /\ \__   / /\ \ \     / /\ \ \   /\__ \   ]],
[[    / / /\ \___\ / / /\ \ \\ \___/ /        / / /\ \___/ // / /\ \ \       / /_ \ \   / / /\ \ \      /  \____\__/ /   / /\/_/  / / /\ \ \     / / /\ \_\  / / /\ \ \   / / /\ \___\ / / /\ \ \   / / /\ \_\ / /_ \ \  ]],
[[    \ \ \ \/___// / /  \ \ \\ \ \_/        / / /  \/____// / /  \ \_\     / / /\ \ \ / / /  \ \_\    / /\/________/   / / /    / / /  \ \_\   / / /_/ / / / / /  \ \_\  \ \ \ \/___// / /  \ \_\ / /_/_ \/_// / /\ \ \ ]],
[[     \ \ \     / / /___/ /\ \\ \ \        / / /    / / // / /   / / /    / / /  \/_// / /   / / /   / / /\/_// / /   / / /    / / /    \/_/  / / /__\/ / / / /   / / /   \ \ \     / / /   / / // /____/\  / / /  \/_/ ]],
[[ _    \ \ \   / / /_____/ /\ \\ \ \      / / /    / / // / /   / / /    / / /      / / /   / / /   / / /    / / /   / / /    / / /          / / /_____/ / / /   / / /_    \ \ \   / / /   / / // /\____\/ / / /        ]],
[[/_/\__/ / /  / /_________/\ \ \\ \ \    / / /    / / // / /___/ / /    / / /      / / /___/ / /   / / /    / / /___/ / /__  / / /________  / / /\ \ \  / / /___/ / //_/\__/ / /  / / /___/ / // / /      / / /         ]],
[[\ \/___/ /  / / /_       __\ \_\\ \_\  / / /    / / // / /____\/ /    /_/ /      / / /____\/ /    \/_/    / / //\__\/_/___\/ / /_________\/ / /  \ \ \/ / /____\/ / \ \/___/ /  / / /____\/ // / /      /_/ /          ]],
[[ \_____\/   \_\___\     /____/_/ \/_/  \/_/     \/_/ \/_________/     \_\/       \/_________/             \/_/ \/_________/\/____________/\/_/    \_\/\/_________/   \_____\/   \/_________/ \/_/       \_\/           ]],
}

 dashboard.section.buttons.val = {
   dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
   dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
   dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
   dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
   dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.vim<CR>"),
   dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
 return "Evil"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
