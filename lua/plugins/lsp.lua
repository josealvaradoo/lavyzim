return {
  "neovim/nvim-lspconfig",
  dependencies = { "williamboman/mason-lspconfig.nvim" },
  config = function()
    -- `on_attach` se ejecutará cada vez que un LSP se conecte a un buffer
    local on_attach = function(client, bufnr)
      local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = "LSP: " .. desc })
      end

      -- Mapeos de LSP
      map("n", "K", vim.lsp.buf.hover, "Mostrar Hover")
      map("n", "gd", vim.lsp.buf.definition, "Ir a Definición")
      map("n", "gD", vim.lsp.buf.declaration, "Ir a Declaración")
      map("n", "gi", vim.lsp.buf.implementation, "Ir a Implementación")
      map("n", "<leader>ca", vim.lsp.buf.code_action, "Acciones de Código")
      map("n", "<leader>rn", vim.lsp.buf.rename, "Renombrar Símbolo")
      map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Acciones de Código")
    end

    -- Obtener la lista de servidores de `mason-lspconfig`
    local servers = require("mason-lspconfig").get_installed_servers()

    -- Configurar cada servidor
    for _, server_name in ipairs(servers) do
      require("lspconfig")[server_name].setup({
        on_attach = on_attach,
        -- capabilities: serán configuradas por el plugin de autocompletado
      })
    end
  end,
}
