local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({ buffer = bufnr })
end)

vim.diagnostic.config({
    virtual_text = false,
})

-- configure language servers
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())


lsp.setup()
