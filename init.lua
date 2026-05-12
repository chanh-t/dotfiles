vim.opt.number = true

-- Indentation: 2 spaces, no hard tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

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

-- Format on save via Prettier (shell-based, no plugin manager required)
local prettier_fts = {
  javascript = true, javascriptreact = true,
  typescript = true, typescriptreact = true,
  json = true, jsonc = true,
  css = true, scss = true, html = true,
  markdown = true, yaml = true,
}
vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("PrettierFormat", { clear = true }),
  callback = function(args)
    if not prettier_fts[vim.bo[args.buf].filetype] then return end
    if vim.fn.executable("prettier") == 0 then return end
    vim.system(
      { "prettier", "--write", args.file },
      { text = true },
      function() vim.schedule(function() vim.cmd.checktime() end) end
    )
  end,
})
