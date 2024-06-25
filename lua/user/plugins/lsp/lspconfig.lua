-------------------------------------------------------------------------------
-- LSP Plugin
-- https://github.com/neovim/nvim-lspconfig
-- Plugin to use LSP servers.
-------------------------------------------------------------------------------
return{
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason-lspconfig",
      { "antosha417/nvim-lsp-file-operations", config = true },
      { "folke/neodev.nvim", opts = {} },
    },
    config = function()
    
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- import mason_lspconfig plugin
    local mason_lspconfig = require("mason-lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

-------------------------------------------------------------------------------
-- Key Mappings

-- Provide key mappings for LSP and enhance autocompletion:
local on_attach = function(_, bufnr)
  vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
  -- vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)  -- Go to definition (gd).
  -- vim.keymap.set('n', 'si', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)       -- Show information in floating window (si):
  -- keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
  -- keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
  -- keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
  -- keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
  -- keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
  -- keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
  -- keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
  -- keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
  -- keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
  -- keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
  -- keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
  -- keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side

  -- TypeScript specific key mappings (e.g. rename file and update imports)
  --if client.name == "tsserver" then
  --  keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
  --  keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
  --  keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
  --end
end

-------------------------------------------------------------------------------
-- Configuration

-- Change the Diagnostic symbols in the sign column (gutter):
local diagnosticIcons = {
  Error = ' ',
  Warn  = ' ',
  Hint  = ' ',
  Info  = ' ',
}

for type, icon in pairs(diagnosticIcons) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end


-- Combine additional default capabilities of Nvim-CMP with the LSP capabilities to work smoothly in autocomplete:
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())


mason_lspconfig.setup_handlers({
  -- Default handler for installed servers:
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = capabilities,
      on_attach    = on_attach,
    })
  end,
  ["svelte"] = function()
    lspconfig["svelte"].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePost", {
          pattern = { "*.js", "*.ts" },
          callback = function(ctx)
            -- Here use ctx.match instead of ctx.file
            client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
          end,
        })
      end,
    })
  end,
  ["graphql"] = function()
    lspconfig["graphql"].setup({
      capabilities = capabilities,
      filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
    })
  end,
  ["emmet_ls"] = function()
    lspconfig["emmet_ls"].setup({
      capabilities = capabilities,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    })
  end,
  ["lua_ls"] = function()
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach    = on_attach,
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',                                 -- Version of Lua you're using (most likely LuaJIT in the case of Neovim).
          },
          diagnostics = {
            globals = {'vim'},                                  -- Get the language server to recognize the 'vim' global.
          },
          workspace = {
            -- Make the server aware of Neovim runtime files.
            library = {
              [vim.fn.expand('$VIMRUNTIME/lua')]   = true,
              [vim.fn.stdpath('config') .. '/lua'] = true,
            },
          },
          telemetry = {
            enable = false,                                     -- Do not send telemetry data containing a randomized but unique identifier.
          },
          completion = {
            callSnippet = "Replace",
          },
        },
      },
    })
  end,
  ["tsserver"] = function()
    lspconfig["tsserver"].setup({
      capabilities = capabilities,
      filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
      cmd = { "typescript-language-server", "--stdio" },
    })
  end,
  ["intelephense"] = function()
    lspconfig["intelephense"].setup({
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        client.server_capabilities.documentFormattingProvider      = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
      capabilities = capabilities,
      filetypes    = { 'php', 'blade' },
      settings = {
        intelephense = {
          filetypes = { 'php', 'blade' },
          files = {
            associations = { '*php', '*.blade.php' },
            maxSize = 5000000,
          }
        }
      }
    })
  end,
})

end,
}
