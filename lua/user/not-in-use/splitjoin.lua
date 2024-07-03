------------------------------------------------------------------------------
-- Splitjoin Plugin

-- SplitJoin (split or join list-like syntax constructs (like arrays))
-- https://github.com/bennypowers/splitjoin.nvim
------------------------------------------------------------------------------
return{
  'bennypowers/splitjoin.nvim',
  config = function()
    local splitjoin = require('splitjoin')

    splitjoin.setup({

  lazy = true,
  keys = {
    { '<Leader>jo', function() splitjoin.join() end, desc = 'Join the object under cursor' },
    { '<Leader>so,', function() splitjoin.split() end, desc = 'Split the object under cursor' },
  },

    })
  end,
}
