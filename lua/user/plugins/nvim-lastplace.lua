------------------------------------------------------------------------------
-- Neovim Lastplace Plugin

-- ~/.dotfiles/nvim/lua/user/plugin_options/nvim-lastplace.lua

-- https://github.com/ethanholz/nvim-lastplace
------------------------------------------------------------------------------
return{
    "ethanholz/nvim-lastplace",
    config = function()
    local lastplace = require("nvim-lastplace")
    lastplace.setup ({
  lastplace_ignore_buftype = {
    'quickfix',
    'nofile',
    'help'
  },
  lastplace_ignore_filetype = {
    'gitcommit',
    'gitrebase',
    'svn',
    'hgcommit'
  },
  lastplace_open_folds = true

    })

    end,
}
