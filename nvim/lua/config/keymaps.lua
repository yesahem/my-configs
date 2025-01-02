-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- These are the Default non customized keymaps -- 

-- local fzf = require("fzf-lua")

-- vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find Files (fzf-lua)" })
-- vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Live Grep (fzf-lua)" })
-- vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Buffers (fzf-lua)" })
-- vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Help Tags (fzf-lua)" })




-- Alternative KeyMaps binding config file -- 


local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local util = require("lazyvim.util")
local set_keymap = vim.api.nvim_set_keymap
local snacks = require("snacks")

-- Borderless terminal
vim.keymap.set("n", "<C-/>", function()
  snacks.terminal(nil, { border = "none" })
end, { desc = "Term with border" })

-- Borderless lazygit
vim.keymap.set("n", "<leader>gg", function()
  snacks.terminal({ "lazygit" }, { cwd = util.root(), esc_esc = false, ctrl_hjkl = false, border = "none" })
end, { desc = "Lazygit (root dir)" })

-- Split windows
keymap.set("n", "ss", ":vsplit<Return>", opts)
keymap.set("n", "sv", ":split<Return>", opts)

-- Tabs
keymap.set("n", "te", ":tabedit<Return>", opts)
keymap.set("n", "L", ":tabnext<Return>", opts)
keymap.set("n", "H", ":tabprev<Return>", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

keymap.del({ "n", "i", "v" }, "<A-j>")
keymap.del({ "n", "i", "v" }, "<A-k>")
keymap.del("n", "<C-Left>")
keymap.del("n", "<C-Down>")
keymap.del("n", "<C-Up>")
keymap.del("n", "<C-Right>")

keymap.set("n", "<C-h>", '<Cmd>lua require("tmux").move_left()<CR>', { silent = true })
keymap.set("n", "<C-j>", '<Cmd>lua require("tmux").move_bottom()<CR>', { silent = true })
keymap.set("n", "<C-k>", '<Cmd>lua require("tmux").move_top()<CR>', { silent = true })
keymap.set("n", "<C-l>", '<Cmd>lua require("tmux").move_right()<CR>', { silent = true })

keymap.set("n", "<M-h>", '<Cmd>lua require("tmux").resize_left()<CR>', { silent = true })
keymap.set("n", "<M-j>", '<Cmd>lua require("tmux").resize_bottom()<CR>', { silent = true })
keymap.set("n", "<M-k>", '<Cmd>lua require("tmux").resize_top()<CR>', { silent = true })
keymap.set("n", "<M-l>", '<Cmd>lua require("tmux").resize_right()<CR>', { silent = true })

keymap.set("v", "<leader>y", '"+y', opts)

-- package-info keymaps
set_keymap(
  "n",
  "<leader>cpt",
  "<cmd>lua require('package-info').toggle()<cr>",
  { silent = true, noremap = true, desc = "Toggle" }
)
set_keymap(
  "n",
  "<leader>cpd",
  "<cmd>lua require('package-info').delete()<cr>",
  { silent = true, noremap = true, desc = "Delete package" }
)
set_keymap(
  "n",
  "<leader>cpu",
  "<cmd>lua require('package-info').update()<cr>",
  { silent = true, noremap = true, desc = "Update package" }
)
set_keymap(
  "n",
  "<leader>cpi",
  "<cmd>lua require('package-info').install()<cr>",
  { silent = true, noremap = true, desc = "Install package" }
)
set_keymap(
  "n",
  "<leader>cpc",
  "<cmd>lua require('package-info').change_version()<cr>",
  { silent = true, noremap = true, desc = "Change package version" }
)