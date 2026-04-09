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

-- Move in Insert mode
map("i", "<C-h>", "<Left>", opts)
map("i", "<C-j>", "<Down>", opts)
map("i", "<C-k>", "<Up>", opts)
map("i", "<C-l>", "<Right>", opts)

if vim.g.vscode then
  -- map("n", "<leader>e", function()
  --   require("vscode").action("workbench.view.explorer")
  -- end, { desc = "Open VSCode Explorer" })

  -- map("n", "<leader>f", function()
  --   require("vscode").action("workbench.action.findInFiles")
  -- end, { desc = "Find in Files" })

  map("n", "<S-h>", function()
    require("vscode").action("workbench.action.previousEditor")
  end, { desc = "Navigate to Previous VSCode Editor" })

  map("n", "<S-l>", function()
    require("vscode").action("workbench.action.nextEditor")
  end, { desc = "Navigate to Next VSCode Editor" })

  pcall(vim.keymap.del, "n", "<leader>uZ")
  map("n", "<leader>uz", function()
    require("vscode").action("workbench.action.toggleZenMode")
  end, { desc = "Toggle VSCode Zen Mode" })

  pcall(vim.keymap.del, "n", "<leader>gg")
  pcall(vim.keymap.del, "n", "<leader>gG")
  map("n", "<leader>gg", function()
    require("vscode").action("lazygit-vscode.toggle")
  end, { desc = "Toggle VSCode LazyGit" })

  -- Git周りのキーマップは無意味なので削除
  local keys = { "<leader>gY", "<leader>gB", "<leader>gl", "<leader>gL", "<leader>gf", "<leader>gp", "<leader>gP",
    "<leader>gi", "<leader>gI", "<leader>gd", "<leader>gD", "<leader>gs", "<leader>gS" }
  for _, key in ipairs(keys) do
    pcall(vim.keymap.del, "n", key)
    pcall(vim.keymap.del, "x", key)
  end
end
