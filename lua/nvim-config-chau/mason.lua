-- Base Mason
vim.pack.add {
    "https://github.com/mason-org/mason.nvim",
}
require('mason').setup {}


-- Mason language servers
vim.pack.add {
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason-lspconfig.nvim",
}
require('mason-lspconfig').setup {
    ensure_installed = {
        'marksman',

        -- Writing
        'prosemd_lsp',
        'vale_ls',

        'ts_ls',

        'dockerls',
        'docker_compose_language_service',

        'jsonls',
        'taplo',
        'yamlls',
        'lemminx',

        'pyright',
        'ruff',

        'gopls',
        'golangci_lint_ls',

        'kotlin_language_server',
        'gradle_ls',

        'clojure_lsp',

        'efm',
        'lua_ls',
        'rust_analyzer',
        'tinymist',
    }
}

-- Plugin for MasonUpdateAll command
vim.pack.add { 'https://github.com/RubixDev/mason-update-all' }
require('mason-update-all').setup {}

-- Auto-update Mason language servers
vim.cmd('MasonUpdateAll')
