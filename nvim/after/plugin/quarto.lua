require('quarto').setup{
  debug = false,
  closePreviewOnExit = true,
  lspFeatures = {
    enabled = true,
    chunks = "curly",
    languages = { "r", "python", "julia", "bash", "html" },
    diagnostics = {
      enabled = true,
      triggers = { "BufWritePost" },
    },
    completion = {
      enabled = true,
    },
  },
  codeRunner = {
    enabled = true,
    default_method = "molten", -- "molten", "slime", "iron" or <function>
    ft_runners = {}, -- filetype to runner, ie. `{ python = "molten" }`.
    -- Takes precedence over `default_method`
    never_run = { 'yaml' }, -- filetypes which are never sent to a code runner
  },
}

local runner = require("quarto.runner")

vim.keymap.set("n", "<leader>qp", ":QuartoPreview<CR>", { silent = true, desc = "[Q]uarto [P]review" })

vim.keymap.set("n", "<leader>qc", runner.run_cell,  { desc = "Quarto Run cell", silent = true })
vim.keymap.set("n", "<leader>qa", runner.run_above, { desc = "run cell and above", silent = true })
vim.keymap.set("n", "<leader>qA", runner.run_all,   { desc = "run all cells", silent = true })
vim.keymap.set("n", "<leader>ql", runner.run_line,  { desc = "run line", silent = true })
-- vim.keymap.set("v", "<localleader>r",  runner.run_range, { desc = "run visual range", silent = true })
-- vim.keymap.set("n", "<leader>RA", function()
--   runner.run_all(true)
-- end, { desc = "run all cells of all languages", silent = true })
