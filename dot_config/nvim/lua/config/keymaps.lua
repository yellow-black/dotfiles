-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ESC
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- 改行追加
map("n", "o", "o<Esc>", opts)
map("n", "O", "O<Esc>", opts)

if vim.g.vscode then
  map("n", "<leader>e", function()
    require("vscode").action("workbench.view.explorer")
  end, { desc = "Open VSCode Explorer" })

  map("n", "<leader>f", function()
    require("vscode").action("workbench.action.findInFiles")
  end, { desc = "Find in Files" })

  map("n", "<leader>g", function()
    require("vscode").action("workbench.view.scm")
  end, { desc = "Show VSCode Source Control" })

  map("n", "<leader>x", function()
    require("vscode").action("workbench.view.extensions")
  end, { desc = "Show VSCode Extensions" })
end
