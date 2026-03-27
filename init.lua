vim.opt.number = true

-- Disable built-in file explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Fuzzy search with Telescope
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", telescope.live_grep,  { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", telescope.buffers,    { desc = "Buffers" })

-- Show diagnostics inline at end of line
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
})

-- LSP: TypeScript (native vim.lsp API, requires Neovim 0.11+)
vim.lsp.config("ts_ls", {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  root_markers = { "tsconfig.json", "package.json", ".git" },
  on_attach = function(_, bufnr)
    local opts = { buffer = bufnr }
    vim.keymap.set("n", "gd",         vim.lsp.buf.definition,   opts)
    vim.keymap.set("n", "K",          vim.lsp.buf.hover,        opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename,       opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,  opts)
    vim.keymap.set("n", "gr",         vim.lsp.buf.references,   opts)
  end,
})
vim.lsp.enable("ts_ls")
