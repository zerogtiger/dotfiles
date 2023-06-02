
-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end
require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'
  
  use 'mbbill/undotree'

  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful LSP status thingy
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  }

  -- Minesweeper
  use 'seandewar/nvimesweeper'
  use 'seandewar/killersheep.nvim'
  use 'Eandrju/cellular-automaton.nvim'
  use 'alec-gibson/nvim-tetris'

  -- Make
  use 'tpope/vim-dispatch'

  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  }

  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }


  -- Git related
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'lewis6991/gitsigns.nvim'

    -- VimTex
  use {'lervag/vimtex',}

  -- file explorer
  -- use 'preservim/nerdtree'
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
    config = function()
      require("nvim-tree").setup {}
    end
  }
  -- use 'nvim-tree/nvim-tree.lua'
  -- use 'nvim-tree/nvim-web-devicons'

  -- LaTeX related
  -- use 'lervag/vimtex'

  -- start screen with alpha-nvim
  use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
      -- require('alpha').setup(require'alpha-config')
      require('alpha-config')
    end
  }
  -- use 'navarasu/onedark.nvim' -- Theme inspired by Atom
  use{'morhetz/gruvbox', as = 'gruvbox'} -- Gruvbox theme
  use{'dracula/vim', as = 'dracula'}
  use{'catppuccin/nvim', as = 'catppuccin'}
  use{'folke/tokyonight.nvim', as = 'tokyonight'}
  use{'joshdick/onedark.vim', as = 'onedark'}
  use{'nordtheme/vim', as = 'nordtheme'}
  use{'cocopon/iceberg.vim', as = 'iceberg'}
  use{'sainnhe/everforest', as = 'everforest'}
  use{'ayu-theme/ayu-vim', as = 'ayutheme'}
  use{'rose-pine/neovim', as = 'rosepine'}
  use{'NLKNguyen/papercolor-theme', as = 'papercolor'}
  use{'junegunn/seoul256.vim', as = 'seoul256'}

  use 'nvim-lualine/lualine.nvim' -- Fancier statusline
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  -- use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  -- use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

  -- Special install of telescope windows using MinGW
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
  local has_plugins, plugins = pcall(require, 'custom.plugins')
  if has_plugins then
    plugins(use)
  end

  if is_bootstrap then
    require('packer').sync()
  end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Tab space set to 4
-- expandtab doesn't work due to sleuth
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.smartindent = true
vim.opt.scrolloff = 5
-- vim.w.expandtab = true
-- vim.o.tabstop = 4
-- vim.o.shiftwidth=4

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = false
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 50
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd [[let g:gruvbox_contrast_dark='hard']]
vim.cmd [[colorscheme gruvbox]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Set lualine as statusline
-- See `:help lualine.txt`
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = '|',
    section_separators = '',
  },
}

-- Enable Comment.nvim
require('Comment').setup()

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}

-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>lg', require('telescope.builtin').live_grep, { desc = '[L]ive [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>cl', require('telescope.builtin').colorscheme, { desc = '[C]o[L]orscheme' })
vim.keymap.set('n', '<leader>of', require('telescope.builtin').oldfiles, { desc = '[O]ld [F]iles' })

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'c', 'cpp', 'java', 'vim', 'lua', 'markdown', 'python', 'typescript', 'vimdoc' },

  highlight = { enable = true,
            disable = {'latex'}, -- list of language that will be disabled
    },
  indent = { enable = true, disable = { 'python' } },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
vim.g.tex_flavor = 'latex'
vim.g.vimtex_quickfix_mode=0
-- vim.g.conceallevel=2
-- vim.g.tex_conceal='abdmgs'
-- vim.g.

vim.g.vimtex_view_method = 'general'
-- vim.g.vimtex_view_method = 'sumatrapdf'
vim.g.vimtex_view_general_viewer='SumatraPDF'

-- let g:vimtex_view_general_viewer = 'open'
-- vim.g.vimtex_view_general_options = '-SIGHUP @pdf'
-- vim.g.vimtex_vew_general_options =[[C:\Program Files (x86)\Foxit Software\Foxit PDF Editor\FoxitPDFEditor.exe" @pdf /A nolock=1]]

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- tsserver = {},

  -- sumneko_lua = {
  --   Lua = {
  --     workspace = { checkThirdParty = false },
  --     telemetry = { enable = false },
  --   },
  -- },

  -- lua_ls = {},
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

-- Turn on lsp status information
require('fidget').setup()

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- require('nvim-tree').setup({
-- renderer = {
--         icons = {
--             show = {
--                 folder = true,
--                 file = true,
--                 git = true,
--                 folder_arrow = true,
--                 modified = true,
--             }
--         }
--     },
-- })

vim.keymap.set('n', '<leader>fe', vim.cmd.NvimTreeToggle, { desc = '[F]ile [E]xplorer' })
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = '[U]ndotree Toggle' })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format)

vim.opt.colorcolumn = "100"

vim.opt.conceallevel=2


-- Building & running code related
-- Current file name
fn = vim.fn.expand('%')
if fn:sub(1, 2)==[[./]] then
  fn = fn:sub(3)
elseif fn:sub(1,2)==[[.\]] then
    fn = fn:sub(3)
end
-- print("Current file: \""..fn.."\"")

-- Reset file name
vim.api.nvim_create_user_command("FNReset", function ()
  fn = vim.fn.expand('%')
  if fn:sub(1,2)==[[./]] then
    fn = fn:sub(3)
  elseif fn:sub(1,2)==[[.\]] then
    fn = fn:sub(3)
  end
  print("Current file: \""..fn.."\"")
end, {})

-- Current file name
vim.api.nvim_create_user_command("FN", function ()
  print("Current file: \"".. fn.."\"")
end, {})

-- Delete all buffers
vim.api.nvim_create_user_command("BufClear", function ()
  vim.cmd([[%bd! | e# | bd#]])
end, {})

-- Hotkeys
vim.keymap.set('n', '<F2>', function() run_file() end, { desc = 'Runs executable associated with the current file' })
vim.keymap.set('n', '<F3>', function() compile_file() end, { desc = 'Compiles the current file' })
vim.keymap.set('n', '<F4>', function() compile_run_file() end, { desc = 'Compiles the current file then runs the executable' })
vim.keymap.set('n', '<F12>', function() debug_file() end, { desc = 'Debugs the current file' })
vim.keymap.set('i', '<C-e>', '<C-o>A', { desc = 'Puts cursor at the end of the line without exiting insert mode' })
-- vim.keymap.set('n', '<leader>e', function() vim.cmd [[NERDTreeToggle]] end, { desc = 'Open file explorer (NERDTree)' })

-- Helper functions
function file_ext(flnm)
    return flnm:match("(%.%w+)$") or ""
end

function file_name(flnm)
    return flnm:sub(1, #flnm-#file_ext(flnm))
end

-- <F2>: Run file
function run_file()
  local cmd = ':vsplit | wincmd L | 60 wincmd | | startinsert | term '
  if file_ext(fn) == '.cpp'  then
    cmd = cmd .. cpp_run()
  elseif file_ext(fn) == '.java' then
      cmd = cmd .. java_run()
    -- print(fn)
    -- print(cmd)
  else
      print 'No assigned executable for current file type'
      return
  end
  vim.cmd(cmd);
end

-- <F3>: Compile file
function compile_file()
  local cmd = ':vsplit | wincmd L | 60 wincmd | | term '
  if file_ext(fn) == '.cpp'  then
    cmd = cmd .. cpp_compile()
  elseif file_ext(fn) == '.java' then
    cmd = cmd .. java_compile()
  else
    print 'No assigned compiler for current file type'
    return
  end
  vim.cmd(cmd)
end

-- <F4>: Compile run file
function compile_run_file()
  local cpl_cmd = ':vsplit | wincmd L | 60 wincmd | | term '
  local run_cmd = 'Hex | startinsert | term '
  if file_ext(fn) == '.cpp'  then
    cpl_cmd = cpl_cmd .. cpp_compile()
    run_cmd = run_cmd .. cpp_run()
  elseif file_ext(fn) == '.java' then
    cpl_cmd = cpl_cmd .. java_compile()
    run_cmd = run_cmd .. java_run()
  else
      print 'No assigned compiler / executable for current file type'
    return
  end
  vim.cmd(cpl_cmd)
  vim.cmd(':redraw')
  local exit_code = vim.fn.jobwait({vim.b.terminal_job_id}, -1)[1]
  if (exit_code == 0) then
    vim.cmd(run_cmd)
  end
end

-- <F12>: Debug file
function debug_file()
    local cmd = ':vsplit | wincmd L | 127 wincmd | | startinsert | term '
    if file_ext(fn) == '.cpp' then
        cmd = cmd..cpp_debug()
    else
        print 'No assigned debugger for current file type'
        return
    end
    vim.cmd(cmd)
end

-- C++
function cpp_compile()
  return 'g++ -g -Wshadow -Wall -Wextra --std=c++17 '..fn..' -o '..file_name(fn)
end

function cpp_run()
  return [[.\]].. file_name(fn)
end

function cpp_debug()
    return 'gdb -tui '..file_name(fn)
end

-- Java
function java_compile()
    return [[C:\tools\jdk-17_windows-x64_bin\jdk-17.0.5\bin\javac.exe -d ./build/ ]] .. fn
end

function java_run()
    return [[C:\tools\jdk-17_windows-x64_bin\jdk-17.0.5\bin\java.exe -cp ./build/ ]] .. file_name(fn)
end

-- Set block cursor for normal, visual, command, and insert mode (deprecated, found workaround)
-- vim.opt.guicursor = 'n-v-c-i:block-Cursor'
-- vim.set(guicursor=n-v-c-i:block-Cursor)
-- require'lspconfig'.jdtls.setup{ cmd = {'jdtls'} }
