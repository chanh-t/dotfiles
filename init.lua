vim.opt.number = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup()
vim.api.nvim_create_autocmd("VimEnter", { callback = function() require("nvim-tree.api").tree.open() end })
vim.api.nvim_create_autocmd("QuitPre", { callback = function() vim.cmd("NvimTreeClose") end })
