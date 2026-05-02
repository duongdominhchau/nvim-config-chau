vim.pack.add {
    { src = "https://github.com/saghen/blink.cmp", version = 'v1' }
}

require('blink.cmp').setup {
    completion = {
        trigger = {
            show_on_backspace = true,
            show_on_backspace_in_keyword = true,
            show_on_insert = true,
        },
        list = {
            selection = {
                preselect = false,
                auto_insert = true,
            }
        },
    },
    keymap = {
        preset = "enter",
        ["<Tab>"] = { 'select_next', 'snippet_forward', 'fallback' },
        ["<S-Tab>"] = { 'select_prev', 'snippet_backward', 'fallback' },
    },
}
