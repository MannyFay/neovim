-- Insert this to your Packer plugins file:

-------------------------------------------------------------------------------
-- TODO Comments

-- use({
--   'folke/todo-comments.nvim',
--   requires = 'nvim-lua/plenary.nvim',
--   config = function()
--     require('plugin_options.active.todo-comments')
--   end,
-- })



-------------------------------------------------------------------------------
-- TODO Comments Plugin
-- https://github.com/folke/todo-comments.nvim
-- Searchable comments like TODO, BUG, FIXME, etc.
-------------------------------------------------------------------------------

-- Import TODO Comments plugin with a protected call:
local todo_comments_status_ok, todo_comments = pcall(require, "todo-comments")
if not todo_comments_status_ok then
  return "Error: */lua/plugin_options/active/todo-comments.lua -> NvimTree plugin could not be loaded. Sure you have installed it in your plugins file?"
end



-------------------------------------------------------------------------------
-- Key Mappings

vim.keymap.set("n", "]t", function()
  todo_comments.jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  todo_comments.jump_prev()
end, { desc = "Previous todo comment" })



-------------------------------------------------------------------------------
-- Appearance

todo_comments.setup({

})

