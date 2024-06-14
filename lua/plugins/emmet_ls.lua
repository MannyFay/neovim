if true then
  return {}
end
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- @type lspconfig.options
      servers = {
        emmet_ls = {
          filetypes = {
            "blade",
            "css",
            "html",
            "javascriptreact",
            "typescriptreact",
            "sass",
            "scss",
            "vue",
          },
        },
      },
    },
  },
}
