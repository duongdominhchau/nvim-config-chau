-- === Custom commands ===

-- View output of Lua `print()`
vim.api.nvim_create_user_command('Messages', [[vnew | put=execute('messages')"]], {})

-- Update packages
vim.api.nvim_create_user_command('PkgUpdate', function()
    vim.pack.update()
end, {})
