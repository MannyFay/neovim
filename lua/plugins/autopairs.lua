
------------------------------------------------------------------------------
-- Autopairs Plugin

--- ~/.dotfiles/nvim/lua/user/plugin_options/autopairs.lua
-- https://github.com/windwp/nvim-autopairs
-----------------------------------------------------------------------------
return {
	"windwp/nvim-autopairs",
	event = { "InsertEnter" },
	dependencies = {
	"hrsh7th/nvim-cmp",
	},
	config = function()
		-- import nvim-autopairs
		local autopairs = require("nvim-autopairs")

	-- configure autopairs
	autopairs.setup({
check_ts  = true,
  ts_config = {
    lua = {
      'string',
      'source',
    },
    javascript = {
      'string'         ,
      'template_string',
    },
    java = false,
  },
  disable_filetype = {
    'TelescopePrompt',
    'spectre_panel'  ,
  },
  fast_wrap = {
    map   = '<M-e>',
    chars = {
      '{',
      '[',
      '(',
      '"',
      "'",
    },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    -- Offset from pattern match:
    offset = 0,
    end_key = '$',
    keys = 'qwertyuiopzxcvbnmasdfghjkl',
    check_comma = true,
    highlight = 'PmenuSel',
    highlight_grey = 'LineNr',
  },

	})

    -- import nvim-autopairs completion functionality
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    -- import nvim-cmp plugin (completions plugin)
    local cmp = require("cmp")

    -- make autopairs and completion work together
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

	end,
}
