vim.keymap.set('n', '<leader>fe', vim.cmd.NvimTreeToggle)

require("nvim-tree").setup({
  renderer = {
    -- full_name = false,
    -- group_empty = true,
    -- special_files = {},
    -- symlink_destination = false,
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "╰",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
    icons = {
      -- git_placement = "signcolumn",
      show = {
        file = true,
        folder = true,
        folder_arrow = false,
        git = true,
      },
    },
  },
  -- update_focused_file = {
  --   enable = true,
  --   update_root = true,
  --   ignore_list = { "help" },
  -- },
  -- diagnostics = {
  --   enable = true,
  --   show_on_dirs = true,
  -- },
  -- filters = {
  --   custom = {
  --     "^.git$",
  --   },
  -- },
  -- actions = {
  --   change_dir = {
  --     enable = false,
  --     restrict_above_cwd = true,
  --   },
  --   open_file = {
  --     resize_window = true,
  --     window_picker = {
  --       chars = "aoeui",
  --     },
  --   },
  --   remove_file = {
  --     close_window = false,
  --   },
  -- },
  -- log = {
  --   enable = false,
  --   truncate = true,
  --   types = {
  --     all = false,
  --     config = false,
  --     copy_paste = false,
  --     diagnostics = false,
  --     git = false,
  --     profile = false,
  --     watcher = false,
  --   },
  -- },
})
