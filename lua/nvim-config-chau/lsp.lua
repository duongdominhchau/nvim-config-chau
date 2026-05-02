require('config/mason')
vim.pack.add { 'https://github.com/b0o/schemastore.nvim' }

local schemastore = require('schemastore')

vim.lsp.config('efm', require('config/efm_config'))
vim.lsp.enable('efm')

vim.lsp.config('ts_ls', {
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end
})
vim.lsp.enable('ts_ls')

vim.lsp.config('jsonls', {
    settings = {
        json = {
            schemas = schemastore.json.schemas(),
            validate = { enable = true },
        },
    },
})
vim.lsp.enable('jsonls')

vim.lsp.config('yamlls', {
    settings = {
        yaml = {
            schemaStore = {
                -- You must disable built-in schemaStore support if you want to use
                -- this plugin and its advanced options like `ignore`.
                enable = false,
                -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                url = "",
            },
            schemas = schemastore.yaml.schemas(),
        },
    },
})
vim.lsp.enable('yamlls')

vim.lsp.config('pyright', {
    on_attach = function()
        vim.diagnostic.config {
            underline = false,
            virtual_text = false,
            signs = true,
            update_in_insert = false,
        }
    end
})
vim.lsp.enable('pyright')

vim.lsp.config('lua_ls', {
    settings = {
        workspace = {
            preloadFileSize = 100
        }
    }
})
vim.lsp.enable('lua_ls')

vim.lsp.config('rust_analyzer', {
    settings = {
        ['rust-analyzer'] = {
            diagnostics = {
                procMacro = { enable = true },
            }
        }
    }
})
vim.lsp.enable('rust_analyzer')

local function goto_next()
    vim.diagnostic.jump { count = 1, float = true }
end
local function goto_prev()
    vim.diagnostic.jump { count = -1, float = true }
end

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', goto_next)
vim.keymap.set('n', ']d', goto_prev)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
        vim.keymap.set('n', ']g', goto_next, opts)
        vim.keymap.set('n', '[g', goto_prev, opts)
    end,
})
