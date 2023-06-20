local vim  = vim

-- Toggles the visibility of the quickfix list
-- All open quickfix lists will be closed if multiple are allowed to be opened concurrently
function ToggleQuickFixList()
    if vim.fn.getwinvar(0, "&filetype") == "qf" then
        vim.cmd("cclose")
        return
    end

    -- Get reference initial window
    local initial_window = vim.api.nvim_get_current_win()

    local wins = vim.api.nvim_list_wins()

    local is_open = false;
    -- Check for any open quickfix lists
    for _, win in ipairs(wins) do
        vim.api.nvim_set_current_win(win)
        -- Close if any are open
        if vim.fn.getwinvar(0, "&filetype") == "qf" then
            vim.cmd("cclose")
            is_open = true
        end
    end

    if is_open then
        return
    end

    -- Open quickfix list since non is open
    vim.cmd("copen");
    vim.cmd("wincmd J");

    -- Bring focus back on the initial window again
    vim.api.nvim_set_current_win(initial_window)
end

function ShowMaxWidthLine()
    local wins = vim.api.nvim_list_wins()
    for _, win in ipairs(wins) do
        vim.cmd("set cc=80")
    end
end

function HideMaxWidthLine()
    local wins = vim.api.nvim_list_wins()
    for _, win in ipairs(wins) do
        vim.cmd("set cc=0")
    end
end
