------------------------------------------------------------------------------
-- Windows Plugin

-- Windows (min-/maximize buffer)
-- https://github.com/anuvyklack/windows.nvim
------------------------------------------------------------------------------
return{
  'anuvyklack/windows.nvim',
  dependencies = 'anuvyklack/middleclass',
  config = function()
    local windows = require('windows')

    windows.setup({

    })
------------------------------------------------------------
-- Appearance

local function cmd(command)
   return table.concat({ '<Cmd>', command, '<CR>' })
end

vim.keymap.set('n', '<Leader><Leader>m', cmd 'WindowsMaximize')
vim.keymap.set('n', '<Leader><Leader>=', cmd 'WindowsEqualize')
--vim.keymap.set('n', '<C-w>_', cmd 'WindowsMaximizeVertically')
--vim.keymap.set('n', '<C-w>|', cmd 'WindowsMaximizeHorizontally')
--vim.keymap.set('n', '<C-w>=', cmd 'WindowsEqualize')
  end,
}
