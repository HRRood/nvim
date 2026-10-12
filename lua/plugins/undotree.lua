-- Neovim 0.12 ships an undo tree; no plugin needed
vim.cmd.packadd("nvim.undotree")
vim.keymap.set("n", "<leader>u", "<cmd>Undotree<cr>", { desc = "Toggle undo tree" })

return {}
