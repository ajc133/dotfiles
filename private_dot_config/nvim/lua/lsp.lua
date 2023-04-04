local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<Leader>q", vim.diagnostic.setloclist, opts)

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

require("lsp-format").setup {
  typescript = {
    tab_width = function()
      return vim.opt.shiftwidth:get()
    end,
  },
  lua = {
    tab_width = function()
      return vim.opt.shiftwidth:get()
    end,
  },
  yaml = { tab_width = 2 },
}

local on_attach = function(client, bufnr)
  require("lsp-format").on_attach(client)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<Leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<Leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<Leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set("n", "<Leader>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<Leader>fo", vim.lsp.buf.format, bufopts)
end

local lsp_flags = {
  debounce_text_changes = 150,
}

require("lspconfig")["lua_ls"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  log_level = 2,
  -- root_dir = vim.fs.dirname(vim.fs.find( {".luarc.json", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", ".git"}, { upward = true })[1]),
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you"re using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

require("lspconfig")["ansiblels"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
}

require("lspconfig")["bashls"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
}

require("lspconfig")["gopls"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
}

require("lspconfig")["pyright"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
}

require("lspconfig")["tsserver"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
}

require("lspconfig")["terraformls"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
  filetypes = { "terraform", "hcl", "tf" }
}

require("lspconfig")["rust_analyzer"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
}

require("lspconfig")["jsonls"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
}

require("lspconfig")["yamlls"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
  filetypes = { "yaml", "yml" },
  settings = {
    validate = true,
  }
}
