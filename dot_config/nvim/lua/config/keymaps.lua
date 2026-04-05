-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

if vim.g.vscode then
  vim.keymap.set("n", "<leader>e", function()
    require("vscode").action("workbench.view.explorer")
  end, { desc = "Open VSCode Explorer" })

  vim.keymap.set("n", "<leader>f", function()
    require("vscode").action("workbench.action.findInFiles")
  end, { desc = "Find in Files" })

  vim.keymap.set("n", "<leader>g", function()
    require("vscode").action("workbench.view.scm")
  end, { desc = "Show VSCode Source Control" })

  vim.keymap.set("n", "<leader>x", function()
    require("vscode").action("workbench.view.extensions")
  end, { desc = "Show VSCode Extensions" })
end
