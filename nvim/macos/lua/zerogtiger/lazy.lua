local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

    -- File explorer via NvimTree
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {}
        end,
    },

    -- Fuzzy finder via Telescope
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- Undotree
    { 'mbbill/undotree' },

    -- Commenting code
    { 'numToStr/Comment.nvim' },

    -- Floating termina via FRerm
    { 'numToStr/FTerm.nvim' },

    -- Racket related
    -- { 'wlangstroth/vim-racket' },
    -- { 'MicahElliott/vrod' },

    -- md related
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },

    -- Latex related
    { 'lervag/vimtex' },

    -- Git related
    { 'tpope/vim-fugitive' },

    -- { 'tpope/vim-rhubarb' },
    { 'lewis6991/gitsigns.nvim' },

    -- Syntax highlighting via Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },
    { 'nvim-treesitter/playground' },

    -- LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    },

    -- Make related
    { 'tpope/vim-dispatch' },

    -- Statusline via Lualine
    { 'nvim-lualine/lualine.nvim' },

    -- Indentation indicator
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

    -- Color highlighter
    { "norcalli/nvim-colorizer.lua" },

    -- zen mode
    { "folke/zen-mode.nvim" },

    -- highlight active code via Twilight
    { "folke/twilight.nvim" },

    -- Startup screen via Alpha
    {
        'goolord/alpha-nvim',
        event = "VimEnter",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

    -- Colorschemes
    { 'morhetz/gruvbox',                  name = 'gruvbox' },
    { 'dracula/vim',                      name = 'dracula' },
    { 'catppuccin/nvim',                  name = 'catppuccin' },
    { 'folke/tokyonight.nvim',            name = 'tokyonight' },
    { 'joshdick/onedark.vim',             name = 'onedark' },
    { 'nordtheme/vim',                    name = 'nordtheme' },
    { 'cocopon/iceberg.vim',              name = 'iceberg' },
    { 'sainnhe/everforest',               name = 'everforest' },
    -- { 'ayu-theme/ayu-vim',                name = 'ayutheme' },
    { 'rose-pine/neovim',                 name = 'rosepine' },
    { 'NLKNguyen/papercolor-theme',       name = 'papercolor' },
    { 'junegunn/seoul256.vim',            name = 'seoul256' },
    { 'tobi-wan-kenobi/zengarden',        name = 'zengarden' }, --light
    { 'pgdouyon/vim-yin-yang',            name = 'yin-yang' },
    -- { 'lunacookies/vim-corvine',          name = 'corvine' },
    -- { 'zefei/cake16',                     name = 'cake16' },
    { 'adigitoleo/vim-mellow',            name = 'mellow-theme' },
    -- { 'daschw/leaf.nvim',                 name = 'leaf.nvim' },
    { 'wimstefan/vim-artesanal',          name = 'artesanal' },   --light
    { 'foxbunny/vim-amber',               name = 'amber-theme' }, --troll theme
    -- { 'vim-scripts/newspaper.vim',        name = 'newspaper-theme' }, --bad latex support
    -- { 'd11wtq/subatomic256.vim',          name = 'subatomic256' }, --bad latex support
    -- { 'pbrisbin/vim-colors-off',          name = 'colors-off-theme' }, --bad latex support
    { 'lifepillar/vim-solarized8',        name = 'solarized8' },
    -- { 'srcery-colors/srcery-vim',         name = 'srcery-theme' }, --very bright colors, kinda ugly, similar to gruvbox
    { 'bluz71/vim-nightfly-colors',       name = 'nightfly-colors' },
    { 'fenetikm/falcon',                  name = 'falcon-theme' },          --great latex support
    { 'embark-theme/vim',                 name = 'embark-theme' },
    { 'preservim/vim-colors-pencil',      name = 'colors-pencil-theme' },   --light
    { 'challenger-deep-theme/vim',        name = 'challenger-deep-theme' }, --light (buggy statusline)
    -- { 'tiagovla/tokyodark.nvim',          name = 'tokyodark' }, --bad latex support
    -- { 'robertmeta/nofrils',               name = 'nofrils-theme' }, --just ugly
    -- { 'danilo-augusto/vim-afterglow',     name = 'afterglow' }, --bad latex support
    -- { 'chriskempson/vim-tomorrow-theme',  name = 'tomorrow-theme' },
    -- { 'chriskempson/base16-vim',          name = 'base16-theme' }, --too many themes
    -- { 'FrenzyExists/aquarium-vim',        name = 'aquarium-theme' }, --buggy indentation
    -- { 'altercation/vim-colors-solarized', name = 'solarized-theme' }, --broken
    -- { 'i3d/vim-jimbothemes',              name = 'jimbothemes' }, --could not find theme
    { 'aktersnurra/no-clown-fiesta.nvim', name = 'no-clown-fiesta-theme' },
    -- { 'Verf/deepwhite.nvim',              name = 'deepwhite' }, --ugly
    { 'ajmwagar/vim-deus',                name = 'deus-theme' },   --gruvbox variation
    -- { 'dylanaraps/wal.vim',               name = 'wal-theme' },
    { 'andreasvc/vim-256noir',            name = '256noir' },      --bad latex support, but troll
    { 'vv9k/vim-github-dark',             name = 'github-dark-theme' },
    { 'xero/miasma.nvim',                 name = 'miasma-theme' }, --green filter
    -- { 'relastle/bluewery.vim',            name = 'bluewery-theme' }, --bad latex support
    { 'whatyouhide/vim-gotham',           name = 'gotham-theme' },
    -- { 'doums/darcula',                    name = 'jetbrains-dracula-theme' }, --broken
    { 'lunacookies/vim-colors-xcode',     name = 'xcode-theme' }, --ok latex support

    -- Games and other useless stuff
    { 'seandewar/nvimesweeper' },
    { 'seandewar/killersheep.nvim' },
    { 'Eandrju/cellular-automaton.nvim' },
    { 'alec-gibson/nvim-tetris' },

})
