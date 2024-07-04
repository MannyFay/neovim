-------------------------------------------------------------------------------
-- https://github.com/ellisonleao/dotenv.nvim

-- Dotenv Pluging
-------------------------------------------------------------------------------
return{
    'ellisonleao/dotenv.nvim',
    config = function()
    local dotenv = require('dotenv')
    dotenv.setup({
  enable_on_load = true,   -- Load .env if buffer gets opened.
  verbose        = false,  -- Show error notification if .env file is not found and if .env is loaded.
})
end,
}
