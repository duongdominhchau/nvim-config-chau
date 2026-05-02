local function prettier(parser)
    return {
        formatCommand = 'prettier --parser ' .. parser,
        formatStdin = true,
    }
end

return {
    init_options = {
        documentFormatting = true,
        documentRangeFormatting = true,
    },
    settings = {
        languages = {
            markdown = {
                -- Must be a list, as there may be multiple tools for the same language
                {
                    formatCommand = 'mdformat --number --wrap 80 -',
                    formatStdin = true
                },
            },
            python = {
                {
                    formatCommand = 'ruff format -',
                    formatStdin = true
                },
            },
            sql = {
                {
                    formatCommand = "sql-formatter",
                    formatStdin = true
                },
                {
                    lintCommand = [[
                    sqlfluff lint --disable-progress-bar --format github-annotation - |
                        jq -r '.[] | {line,start_column,end_column,annotation_level,message} | join("|")'
                    ]],
                    lintSource = 'sqlfluff',
                    lintStdin = true,
                    lintIgnoreExitCode = true,
                    lintFormats = {
                        '%l|%c|%k|%trror|%m',
                        '%l|%c|%k|%tarning|%m',
                        '%l|%c|%k|%totice|%m',
                    }
                },
            },
            -- javascript = { prettier('typescript') },
            -- typescript = { prettier('typescript') },
            -- html = { prettier('html') },
        }
    },
    filetypes = { 'python', 'markdown', 'sql', 'html', 'javascript', 'typescript' },
}
