-- Source: https://echasnovski.com/blog/2026-03-13-a-guide-to-vim-pack#hooks
vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == 'nvim-treesitter' and kind == 'update' then
            if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
            vim.cmd('TSUpdate')
        end
    end
})
vim.pack.add {
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" }
}

require('nvim-treesitter').install {
    'bash',
    'c',
    'caddy',
    'clojure',
    'comment',
    'cpp',
    'css',
    'csv',
    'dart',
    'desktop',
    'diff',
    'dockerfile',
    'dot',
    'ebnf',
    'editorconfig',
    'elixir',
    'erlang',
    'fennel',
    'forth',
    'git_config',
    'git_rebase',
    'gitattributes',
    'gitcommit',
    'gitignore',
    'glsl',
    'go',
    'gomod',
    'gosum',
    'gowork',
    'graphql',
    'groovy',
    'haskell',
    'haskell_persistent',
    'html',
    'ini',
    'javascript',
    'json',
    'json5',
    'julia',
    'kotlin',
    'llvm',
    'lua',
    'make',
    'mermaid',
    'ocaml',
    'ocaml_interface',
    'ocamllex',
    'purescript',
    'python',
    'regex',
    'ruby',
    'rust',
    'scala',
    'sql',
    'swift',
    'toml',
    'typescript',
    'typespec',
    'typst',
    'unison',
    'xml',
    'yaml',
    'zig',
    'zsh',
}
vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)
        if lang and vim.treesitter.language.add(lang) then
            vim.treesitter.start()
        end
    end,
})
-- Tree-sitter-based indentation
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
