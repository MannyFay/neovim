return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      ---@type lspconfig.options
      servers = {
        -- phpactor = {
        --   filetypes = { "php", "blade" },
        --   settings = {
        --     phpactor = {
        --       filetypes = { "php", "blade" },
        --       files = {
        --         associations = { "*.php", "*.blade.php" }, -- Associating .blade.php files as well
        --         maxSize = 5000000,
        --       },
        --     },
        --   },
        -- },
        intelephense = {
          filetypes = { "php", "blade" },
          settings = {
            intelephense = {
              filetypes = { "php", "blade" },
              files = {
                associations = { "*.php", "*.blade.php" }, -- Associating .blade.php files as well
                maxSize = 5000000,
              },
            },
          },
        },
        cssls = {
          filetypes = { "css", "scss", "less", "sass" },
        },
      },
    },
  },
}
