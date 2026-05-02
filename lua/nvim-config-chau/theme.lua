vim.opt.termguicolors = true

-- Sonokai
vim.pack.add { "https://github.com/sainnhe/sonokai" }

-- Styles: default, atlantis, andromeda, shusia, maia
vim.g.sonokai_style = 'default'
vim.g.sonokai_enable_italic = 1
vim.g.sonokai_disable_italic_comment = 1

vim.cmd.colorscheme('sonokai')
