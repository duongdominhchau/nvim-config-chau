-- Copied from https://gist.github.com/alextes/e6704e5376709d194d21f615f8542ccb
local function fix_current_workaround()
    local params = vim.lsp.util.make_range_params() -- get params for current position
    params.context = {
        diagnostics = vim.lsp.diagnostic.get_line_diagnostics(),
        only = { "quickfix" },
    }

    local actions_per_client, err = vim.lsp.buf_request_sync(
        0,
        "textDocument/codeAction",
        params,
        900
    )

    if err then
        return
    end

    if actions_per_client == nil or vim.tbl_isempty(actions_per_client) or #actions_per_client == 0 then
        vim.notify("no quickfixes available")
        return
    end

    -- Collect the available actions
    local actions = {}
    for cid, resp in pairs(actions_per_client) do
        if resp.result ~= nil then
            for _, result in pairs(resp.result) do
                -- add the actions with a cid to the table
                local action = {}
                action["cid"] = cid
                for k, v in pairs(result) do
                    action[k] = v
                end
                table.insert(actions, action)
            end
        end
    end

    -- Try to find a preferred action.
    local preferred_action = nil
    for _, action in ipairs(actions) do
        if action.isPreferred then
            preferred_action = action
            break
        end
    end

    local first_action = nil
    if #actions > 0 then
        first_action = actions[1]
    end

    local top_action = preferred_action or first_action

    local picked_one = false

    vim.lsp.buf.code_action({
        filter = function(action)
            if picked_one then
                return false
            elseif top_action ~= nil and action.title == top_action.title then
                picked_one = true
                return true
            else
                return false
            end
        end,
        apply = true,
    })
end


local function fix_current()
    fix_current_workaround()
end

vim.keymap.set("n", "<leader>qf", fix_current, { noremap = true, silent = true })
