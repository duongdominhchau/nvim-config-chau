-- Tiny config that doesn't belong to any other file

vim.opt.textwidth = 120

-- Always show diagnostic indicator column
vim.opt.signcolumn = 'yes'

-- Show whitespace by default
vim.opt.list = true

-- Don't remember current working directory
vim.opt.viewoptions = 'cursor'

-- View output of Lua `print()`
vim.api.nvim_create_user_command('Messages', [[vnew | put=execute('messages')"]], {})

-- Update packages
vim.api.nvim_create_user_command('PkgUpdate', function()
    vim.pack.update()
end, {})
