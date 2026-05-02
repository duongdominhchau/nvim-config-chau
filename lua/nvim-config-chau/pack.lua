-- === Simple packages without config ===

vim.pack.add {
    "https://github.com/nvim-lua/plenary.nvim",
    'https://github.com/scalameta/nvim-metals',
}

vim.pack.add { 'https://github.com/echasnovski/mini.nvim' }
require('mini.statusline').setup {}
require('mini.tabline').setup {}
require("mini.comment").setup {
    options = {
        ignore_blank_line = true,
    }
}

vim.pack.add { 'https://github.com/Wansmer/symbol-usage.nvim' }
require('symbol-usage').setup {}

vim.pack.add {
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/stevearc/dressing.nvim', -- optional for vim.ui.select
    "https://github.com/nvim-flutter/flutter-tools.nvim",
}
require('flutter-tools').setup {}

vim.pack.add {
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/folke/trouble.nvim",
}
require('trouble').setup {}
vim.keymap.set('n', '<leader>d', function()
    vim.cmd('Trouble diagnostics toggle')
end)

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
