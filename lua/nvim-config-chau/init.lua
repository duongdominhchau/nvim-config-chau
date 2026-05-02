local M = {}

function M.setup()
    -- Enable Lua module loader for better performance
    vim.loader.enable()

    require('nvim-config-chau.pack')
    require('nvim-config-chau.completion')
    require('nvim-config-chau.lsp')
    require('nvim-config-chau.treesitter')
    require('nvim-config-chau.theme')
    require('nvim-config-chau.code_action')
    require('nvim-config-chau.quick_fix')
    require('nvim-config-chau.filetree')
    require('nvim-config-chau.tabline')
    require('nvim-config-chau.statusline')
    require('nvim-config-chau.comment')
    require('nvim-config-chau.symbol-usage')
    require('nvim-config-chau.diagnostics')
    require('nvim-config-chau.scala')
    require('nvim-config-chau.flutter')
    require('nvim-config-chau.editor')
    require('nvim-config-chau.commands')
end

return M
