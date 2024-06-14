-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- local map = vim.keymap.set
---@param mode string Vim Mode for the mapping
---@param lhs string Keybinding for the mapping
---@param rhs string Target command(lua,vimscript)
---@param opts table options
local map = function(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end
---@param description string
---@return table
local opts = function(description)
  return { noremap = true, silent = true, desc = description }
end

map("n", "<leader>j", "j^", opts("goto start of next line"))
map("n", "<leader>J", "j$", opts("goto end of next line"))
map("n", "<leader>k", "k^", opts("goto start of previous line"))
map("n", "<leader>K", "k$", opts("goto end of previous line"))
map("n", "<Esc>", ":q<CR>", opts("Close"))
map({ "n", "i" }, "<A-f>", '<Esc>"_dd', opts("Delete Current Line"))
map({ "n", "i" }, "<A-d>", "<Esc>:t .<CR>", opts("Copy Line Down"))
map("n", "<leader>i", "gg=G", opts("Indent Whole file"))
map("n", "<A-a>", 'ggvG"+y', opts("Select All and copy"))
map({ "n", "i" }, "<C-b>", "<PageDown>H0", opts("actual Page down"))
map("n", "<leader>ll", ":Lazy<CR>", opts("Open Lazy.nvim"))
map("n", "<leader>le", ":LazyExtras<CR>", opts("Open LazyVim Extras"))
map("n", "<leader>fN", ":Neotree toggle=true position=current<CR>", opts("Neotree Netrw Style"))
map("n", "<leader>sf", ":%s/original/updated", opts("Substite all in Current file"))
map("x", "p", "P", opts("fix the stupid behaviour of neovim"))
map("x", "d", '"_d', opts("fix the stupid behaviour of neovim"))
map({ "n", "x" }, "dd", '"_dd', opts("fix the stupid behaviour of neovim"))
map("n", "<leader>ut", "<cmd>lua require('undotree').toggle()<cr>", opts("Toggle UndoTree"))

---@param keymaps string
---@param description string
---@return table
local wkopts = function(keymaps, description)
  return { keymaps, description, noremap = true, silent = true }
end
local wk = require("which-key")
wk.register({
  gd = {
    name = "Generate Docs",
    f = wkopts("<cmd>Neogen file<CR>", "Generate Doc for file"),
    c = wkopts("<cmd>Neogen class<CR>", "Generate Doc for class"),
    t = wkopts("<cmd>Neogen type<CR>", "Generate Doc for type"),
    n = wkopts("<cmd>Neogen func<CR>", "Generate Doc for function"),
  },
  d = {
    name = "Database UI",
    e = wkopts("<cmd>DBUI<CR>", "Database Explorer"),
    a = wkopts("<cmd>DBUIAddConnection<CR>", "Add Database Connection"),
  },
}, { prefix = "<leader>" })

local Util = require("lazyvim.util")
local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "<leader>ld", function()
  Util.terminal.open(
    { "lazydocker", "-f", Util.root.get() .. "docker-compose.yml" },
    { cwd = Util.root.get(), esc_esc = false }
  )
end, { desc = "LazyDocker (root dir)" })
local Util = require("lazyvim.util")
local map = vim.keymap.set
map("n", "<leader>lg", function()
  Util.lazygit({ cwd = Util.root.git() })
end, { desc = "Lazygit (Root Dir)" })
map("n", "<leader>lG", function()
  Util.lazygit()
end, { desc = "Lazygit (cwd)" })
map("n", "<leader>lb", Util.lazygit.blame_line, { desc = "Git Blame Line" })
