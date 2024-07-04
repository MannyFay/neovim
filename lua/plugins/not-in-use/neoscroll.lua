----------------------------------------------
-- Neoscroll Plugin
-- NeoScroll (enable smooth scrolling to avoid hard jumps)
-- https://github.com/karb94/neoscroll.nvim
------------------------------------------------------------------------------
return{
    'karb94/neoscroll.nvim',
    config = function()
        local neoscroll = require('neoscroll')

        neoscroll.setup({
    -- Hide cursor while scrolling:
    hide_cursor = true,
    -- Stop at <EOF> when scrolling downwards:
    stop_eof = true,
    -- Stop scrolling when the cursor reaches the scrolloff margin of the file:
    respect_scrolloff = false,
    -- The cursor will keep on scrolling even if the window cannot scroll further:
    cursor_scrolls_alone = true,
    -- Default easing function:
    easing_function = nil,
    -- Function to run before the scrolling animation starts:
    pre_hook = nil,
    -- Function to run after the scrolling animation ends:
    post_hook = nil,
    -- Disable "Performance Mode" on all buffers:
    performance_mode = false,
        })

local keymap = {
      -- Scroll half screen up (<Leader>k):
  [" k"] = function() neoscroll.ctrl_b({ duration = 100 }) end;
      -- Scroll half screen down (<Leader>j):
  [" j"] = function() neoscroll.ctrl_f({ duration = 100 }) end;
    --   -- Scroll one screen up:
  ["<C-k>"] = function() neoscroll.scroll(-0.5, { move_cursor=true; duration = 100 }) end;
      -- Scroll one screen down:
  ["<C-j>"] = function() neoscroll.scroll(0.5, { move_cursor=true; duration = 100 }) end;
}
local modes = { 'n', 'v', 'x' }
for key, func in pairs(keymap) do
  vim.keymap.set(modes, key, func)
end

    end,
}
