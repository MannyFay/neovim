-------------------------------------------------------------------------------
-- WhichKey Plugin Options
-- https://github.com/folke/which-key.nvim
-- Display possible keybindings after pressing the leader key.
-------------------------------------------------------------------------------

return { 
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
	  vim.o.timeout    = true  -- Turn on after timeout length is elapsed.
	  vim.o.timeoutlen = 500   -- Milliseconds till Which-Key waits to activate.
	end, 
	opts = {
	  -- your configurion comes here
	  -- or leave it empty to use the default settings
	  -- refer to the configuration section below
	},
}
