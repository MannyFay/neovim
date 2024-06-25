-------------------------------------------------------------------------------
-- Copilot Chat Plugin
-- https://github.com/CopilotC-Nvim/CopilotChat.nvim
-------------------------------------------------------------------------------
return{
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
        { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
        { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    config = function()
    local chat = require("CopilotChat")

    chat.setup ({
    debug = true,

    })
    end,
}

