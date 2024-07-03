-- Add this to your Packer plugin file:
-- use({
--   'chrisgrieser/nvim-genghis',
--   config = function()
--     require('user.plugin_options.nvim-genghis')
--   end
-- })




------------------------------------------------------------------------------
-- Neovim Genghis Plugin

-- Provide Unix commands in Neovims command line:
-- https://github.com/chrisgrieser/nvim-genghis
------------------------------------------------------------------------------
return{
  'chrisgrieser/nvim-genghis',
  config = function()
  local nvim_genghis = require('genghis')

-- Disable Ex-Commands:
vim.g.genghis_disable_commands = true

------------------------------------------------------------
-- Key Mappings

local keymap = vim.keymap.set

-- keymap('n', '<leader>yp', nvim_genghis.copyFilepath)
-- keymap('n', '<leader>yn', nvim_genghis.copyFilename)
-- keymap('n', '<leader>cx', nvim_genghis.chmodx)
-- keymap('n', '<leader>rf', nvim_genghis.renameFile)
-- keymap('n', '<leader>mf', nvim_genghis.moveAndRenameFile)
-- keymap('n', '<leader>nf', nvim_genghis.createNewFile)
-- keymap('n', '<leader>yf', nvim_genghis.duplicateFile)
-- keymap('n', '<leader>df', function () nvim_genghis.trashFile{trashLocation = '$HOME/.Trash'} end)
-- keymap('x', '<leader>x', nvim_genghis.moveSelectionToNewFile)
end,
}
