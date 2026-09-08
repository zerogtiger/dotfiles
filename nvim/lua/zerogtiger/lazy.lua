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
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    }
  },

  -- Undotree
  { 'mbbill/undotree' },

  -- Commenting code
  { 'numToStr/Comment.nvim' },

  -- Floating termina via FTerm
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
    build = ':TSUpdate',
    branch = "main",
    lazy = false,
  },
  -- { 'nvim-treesitter/playground' },

  -- LSP
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
  },
  -- {
  --   'VonHeikemen/lsp-zero.nvim',
  --   branch = 'v2.x',
  --   dependencies = {
  --     -- LSP Support
  --     { 'neovim/nvim-lspconfig' }, -- Required
  --     {                            -- Optional
  --       'williamboman/mason.nvim',
  --       build = function()
  --         pcall(vim.cmd, 'MasonUpdate')
  --       end,
  --     },
  --     { 'williamboman/mason-lspconfig.nvim' }, -- Optional
  --
  --     -- Autocompletion
  --     { 'hrsh7th/nvim-cmp' },     -- Required
  --     { 'hrsh7th/cmp-nvim-lsp' }, -- Required
  --     { 'L3MON4D3/LuaSnip' },     -- Required
  --   }
  -- },

  -- Jupyter stuff
  {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    build = ":UpdateRemotePlugins",
    init = function()
      -- this is an example, not a default. Please see the readme for more configuration options
      vim.g.molten_output_win_max_height = 12
    end,
  },

  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
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

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 1000
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  -- Colorschemes
  --TESTING
  -- { 'zerogtiger/kanagawa_fork.nvim',    name = 'kanagawa_fork' },               -- TEST

  { 'morhetz/gruvbox',                  name = 'gruvbox' },    -- core
  { 'dracula/vim',                      name = 'dracula' },    -- core
  { 'rose-pine/neovim',                 name = 'rosepine' },   -- core
  { 'lifepillar/vim-solarized8',        name = 'solarized8' }, -- core
  { 'folke/tokyonight.nvim',            name = 'tokyonight' },
  { 'catppuccin/nvim',                  name = 'catppuccin' },
  { 'nordtheme/vim',                    name = 'nordtheme' },

  { 'cocopon/iceberg.vim',              name = 'iceberg' },         -- little contrast, mediocre LaTeX support
  { 'sainnhe/everforest',               name = 'everforest' },      -- bad support for concealment
  { 'NLKNguyen/papercolor-theme',       name = 'papercolor' },
  { 'junegunn/seoul256.vim',            name = 'seoul256' },        -- unique, slightly weird
  { 'pgdouyon/vim-yin-yang',            name = 'yin-yang' },        -- black and white
  { 'adigitoleo/vim-mellow',            name = 'mellow-theme' },    -- very red
  { 'foxbunny/vim-amber',               name = 'amber-theme' },     --troll theme
  { 'bluz71/vim-nightfly-colors',       name = 'nightfly-colors' }, -- buggy, no light theme
  { 'fenetikm/falcon',                  name = 'falcon-theme' },    -- pure latex support
  { 'ajmwagar/vim-deus',                name = 'deus-theme' },      --gruvbox variation
  { 'andreasvc/vim-256noir',            name = '256noir' },         --bad latex support, troll, old editor
  { 'xero/miasma.nvim',                 name = 'miasma-theme' },    --green filter
  { 'lunacookies/vim-colors-xcode',     name = 'xcode-theme' },     --ok latex support
  { 'rebelot/kanagawa.nvim',            name = 'kanagawa' },        -- beautiful (good latex support)
  { 'nyoom-engineering/oxocarbon.nvim', name = 'oxocarbon' },       -- not asthetic
  { 'HoNamDuong/hybrid.nvim',           name = 'hybrid' },          -- to be tested
  { 'scottmckendry/cyberdream.nvim',    name = 'cyberdream' },      -- troll, Cyberpunk style
  { 'olimorris/onedarkpro.nvim',        name = 'onedarkpro' },      -- to be tested
  { 'rmehri01/onenord.nvim',            name = 'onenord' },         -- better nord
  -- { 'joshdick/onedark.vim',             name = 'onedark' }, -- better alternative below
  -- { 'ayu-theme/ayu-vim',                name = 'ayutheme' },
  -- { 'tobi-wan-kenobi/zengarden',        name = 'zengarden' }, -- too similar to solarized
  -- { 'lunacookies/vim-corvine',          name = 'corvine' },
  -- { 'zefei/cake16',                     name = 'cake16' },
  -- { 'daschw/leaf.nvim',                 name = 'leaf.nvim' },
  -- { 'wimstefan/vim-artesanal',          name = 'artesanal' },   -- brackets too light
  -- { 'vim-scripts/newspaper.vim',        name = 'newspaper-theme' }, --bad latex support
  -- { 'd11wtq/subatomic256.vim',          name = 'subatomic256' }, --bad latex support
  -- { 'pbrisbin/vim-colors-off',          name = 'colors-off-theme' }, --bad latex support
  -- { 'srcery-colors/srcery-vim',         name = 'srcery-theme' }, --very bright colors, kinda ugly, similar to gruvbox
  -- { 'embark-theme/vim',                 name = 'embark-theme' },        -- too much green, not enough contrast
  -- { 'preservim/vim-colors-pencil',      name = 'colors-pencil-theme' }, --light
  -- { 'challenger-deep-theme/vim',        name = 'challenger-deep-theme' }, --light (buggy statusline)
  -- { 'tiagovla/tokyodark.nvim',          name = 'tokyodark' }, --bad latex support
  -- { 'robertmeta/nofrils',               name = 'nofrils-theme' }, --just ugly
  -- { 'danilo-augusto/vim-afterglow',     name = 'afterglow' }, --bad latex support
  -- { 'chriskempson/vim-tomorrow-theme',  name = 'tomorrow-theme' },
  -- { 'chriskempson/base16-vim',          name = 'base16-theme' }, --too many themes
  -- { 'FrenzyExists/aquarium-vim',        name = 'aquarium-theme' }, --buggy indentation
  -- { 'altercation/vim-colors-solarized', name = 'solarized-theme' }, --broken
  -- { 'i3d/vim-jimbothemes',              name = 'jimbothemes' }, --could not find theme
  -- { 'aktersnurra/no-clown-fiesta.nvim', name = 'no-clown-fiesta-theme' }, -- too similar to kanagawa
  -- { 'Verf/deepwhite.nvim',              name = 'deepwhite' }, --ugly
  -- { 'dylanaraps/wal.vim',               name = 'wal-theme' },
  -- { 'vv9k/vim-github-dark',             name = 'github-dark-theme' }, -- useless
  -- { 'relastle/bluewery.vim',            name = 'bluewery-theme' }, --bad latex support
  -- { 'whatyouhide/vim-gotham',           name = 'gotham-theme' }, -- not asthetic enough
  -- { 'doums/darcula',                    name = 'jetbrains-dracula-theme' }, --broken
  -- { 'projekt0n/github-nvim-theme',      name = 'github-theme' }, -- to be tested
  -- {
  --   'oneslash/helix-nvim',
  --   name = 'helix-theme',
  --   version = "*"
  -- },                                                       -- Bad latex support
  { 'archseer/colibri.vim',             name = 'colibri' },     -- waiting for issue update
  { "savq/melange-nvim",                name = 'melange' },     -- to be tested
  { "zerogtiger/modus-themes.nvim",     name = 'modus-theme' }, -- to be tested
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require 'nordic'.load()
    end,
    name = 'nordic',
  }, -- to be tested

  -- {
  --   "OXY2DEV/markview.nvim",
  --   lazy = false,      -- Recommended
  --   -- ft = "markdown" -- If you decide to lazy-load anyway
  --
  --   dependencies = {
  --       -- You will not need this if you installed the
  --       -- parsers manually
  --       -- Or if the parsers are in your $RUNTIMEPATH
  --       "nvim-treesitter/nvim-treesitter",
  --
  --       "nvim-tree/nvim-web-devicons"
  --   }
  -- },

  -- Games and other useless stuff
  { 'seandewar/nvimesweeper' },
  { 'seandewar/killersheep.nvim' },
  { 'Eandrju/cellular-automaton.nvim' },
  { 'alec-gibson/nvim-tetris' },
  { "axsaucedo/neovim-power-mode" },


  {
    "steveslatky/vimcino",
    --- optional custom options
    ---@field vimcino.Config
    opts = {
      -- Change up the functionally if wanted
    },
  },
  { 'alanfortlink/blackjack.nvim' },
  { 'seandewar/actually-doom.nvim' },
  -- { 'nda-cunh/SupraPacman' },
  {
    "Febri-i/snake.nvim",
    dependencies = {
      "Febri-i/fscreen.nvim"
    },
    opts = {}
  },
  {
    "NStefan002/2048.nvim",
    cmd = "Play2048",
    config = true,
  },

  -- -- Scrolling
  -- { 'psliwka/vim-smoothie' },

  -- My own stuff
  {
    'zerogtiger/TargetFile.nvim',
    dependencies = { 'numToStr/FTerm.nvim' }
  },

  -- -- AI stuff
  -- {
  --   "yetone/avante.nvim",
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   -- ⚠️ must add this setting! ! !
  --   build = vim.fn.has("win32") ~= 0
  --       and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
  --       or "make",
  --   event = "VeryLazy",
  --   version = false, -- Never set this value to "*"! Never!
  --   ---@module 'avante'
  --   ---@type avante.Config
  --   opts = {
  --     -- add any opts here
  --     -- for example
  --     provider = "gemini",
  --     providers = {
  --       gemini = {
  --         -- endpoint = "https://generativelanguage.googleapis.com",
  --         model = "gemini-2.0-flash",
  --         -- timeout = 40000, -- Timeout in milliseconds
  --         -- extra_request_body = {
  --         --   temperature = 0.75,
  --         --   max_tokens = 20480,
  --         -- },
  --       },
  --       -- moonshot = {
  --       --   endpoint = "https://api.moonshot.ai/v1",
  --       --   model = "kimi-k2-0711-preview",
  --       --   timeout = 30000, -- Timeout in milliseconds
  --       --   extra_request_body = {
  --       --     temperature = 0.75,
  --       --     max_tokens = 32768,
  --       --   },
  --       -- },
  --     },
  --   },
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     --- The below dependencies are optional,
  --     "echasnovski/mini.pick",       -- for file_selector provider mini.pick
  --     "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
  --     "hrsh7th/nvim-cmp",            -- autocompletion for avante commands and mentions
  --     "ibhagwan/fzf-lua",            -- for file_selector provider fzf
  --     "stevearc/dressing.nvim",      -- for input provider dressing
  --     "folke/snacks.nvim",           -- for input provider snacks
  --     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  --     "zbirenbaum/copilot.lua",      -- for providers='copilot'
  --     {
  --       -- support for image pasting
  --       "HakonHarnes/img-clip.nvim",
  --       event = "VeryLazy",
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  -- }
})

require("power-mode").setup({
  -- Enable power mode when Neovim starts (default: true)
  auto_enable = false,
})
