-- Need to be activated before `nvim-lspconfig`
-- Lua LSP config
vim.pack.add {
    "https://github.com/folke/lazydev.nvim"
}
require('lazydev').setup {
    library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
}
