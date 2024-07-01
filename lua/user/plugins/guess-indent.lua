


------------------------------------------------------------------------------
-- Guess Indent Plugin

-- https://github.com/NMAC427/guess-indent.nvim
-- https://github.com/Darazaki/indent-o-matic if guess indent is to slow!
------------------------------------------------------------------------------
return{
    'nmac427/guess-indent.nvim',
    config = function()
        local guess_indent = require('guess-indent')

    guess_indent.setup({
  -- enable automatic execution of plugin:
  auto_cmd = true,
  -- don't overwrite settings of .editorconfig file:
  override_editorconfig = false,
  -- filetypes where automatic execution of plugin is disabled:
  filetype_exclude = {
    'netrw',
    'tutor',
  },
  -- buffer types where automatic execution of plugin is disabled:
  buftype_exclude = {
    'help',
    'nofile',
    'terminal',
    'prompt',
  },
})
end,
}
