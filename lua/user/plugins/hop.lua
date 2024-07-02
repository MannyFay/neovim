-------------------------------------------------------------------------------
-- Hop Plugin
-- https://github.com/phaazon/hop.nvim
-- Fast motions with visual feedback.
-------------------------------------------------------------------------------
return{
    'phaazon/hop.nvim',
    config = function()

        local hop = require('hop')
        hop.setup ({
  multi_windows = true,  -- Enable Hop for multi buffer use.
        })


-------------------------------------------------------------------------------
-- Key Mappings

-- Hop to character in (multiple) buffer:
vim.api.nvim_set_keymap(
    "n", "<Leader>c", ":HopChar1MW<CR>",
    { noremap = false, silent = true }
)

-- Hop to word in (multiple) buffer:
vim.api.nvim_set_keymap(
    "n", "<Leader>w", ":HopWordMW<CR>",
    { noremap = false, silent = true }
)

-- Hop to pattern in (multiple) buffer:
vim.api.nvim_set_keymap(
    "n", "<Leader>p", ":HopPatternMW<CR>",
    { noremap = false, silent = true }
)

-- Hop to a line start in (multiple) buffer (  l):
vim.api.nvim_set_keymap(
    "n", "<Leader>l", ":HopLineMW<CR>",
    { noremap = false, silent = true }
)
end,
}
