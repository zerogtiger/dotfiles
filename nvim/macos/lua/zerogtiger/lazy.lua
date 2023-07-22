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
    { 'lukas-reineke/indent-blankline.nvim' },

    -- Startup screen via Alpha
    {
        'goolord/alpha-nvim',
        event = "VimEnter",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

    -- Colorschemes
    { 'morhetz/gruvbox',                name = 'gruvbox' },
    { 'dracula/vim',                    name = 'dracula' },
    { 'catppuccin/nvim',                name = 'catppuccin' },
    { 'folke/tokyonight.nvim',          name = 'tokyonight' },
    { 'joshdick/onedark.vim',           name = 'onedark' },
    { 'nordtheme/vim',                  name = 'nordtheme' },
    { 'cocopon/iceberg.vim',            name = 'iceberg' },
    { 'sainnhe/everforest',             name = 'everforest' },
    { 'ayu-theme/ayu-vim',              name = 'ayutheme' },
    { 'rose-pine/neovim',               name = 'rosepine' },
    { 'NLKNguyen/papercolor-theme',     name = 'papercolor' },
    { 'junegunn/seoul256.vim',          name = 'seoul256' },

    -- Games and other useless stuff
    { 'seandewar/nvimesweeper' },
    { 'seandewar/killersheep.nvim' },
    { 'Eandrju/cellular-automaton.nvim' },
    { 'alec-gibson/nvim-tetris' },

})
