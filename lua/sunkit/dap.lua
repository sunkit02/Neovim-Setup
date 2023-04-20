local function get_file_table_from_directory(directory)
    local file_table = {}
    local i = 1
    for file in io.popen("command ls -p \"" .. directory .. "\""):lines() do
        if file:sub(-1) ~= "/" then
            file_table[i] = file
            i = i + 1
        end
    end

    return file_table
end


local vim = vim
local dap = require('dap')
local dapui = require("dapui")

vim.keymap.set("n", "<F2>", dapui.toggle)
vim.keymap.set("n", "<F3>", dap.disconnect)
-- vim.keymap.set("n", "<F4>", dap.debug_test)
vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<F7>", dap.step_over)
vim.keymap.set("n", "<F8>", dap.step_into)
vim.keymap.set("n", "<F9>", dap.step_out)
vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<Leader>B", function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
vim.keymap.set("n", "<Leader>lp", function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set("n", "<Leader>dr", dap.repl.open)

dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
    name = 'lldb'
}


dap.configurations.cpp = {
    {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},

        -- 💀
        -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
        --
        --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
        --
        -- Otherwise you might get the following error:
        --
        --    Error on launch: Failed to attach to the target process
        --
        -- But you should be aware of the implications:
        -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
        -- runInTerminal = false,
    },
}

-- If you want to use this for Rust and C, add something like this:

dap.configurations.c = {
    {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Test to run: ', vim.fn.getcwd(), 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},

        -- 💀
        -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
        --
        --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
        --
        -- Otherwise you might get the following error:
        --
        --    Error on launch: Failed to attach to the target process
        --
        -- But you should be aware of the implications:
        -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
        -- runInTerminal = false,
    },
}

dap.configurations.rust = {
    {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Executable name: ', vim.fn.getcwd() .. '/target/debug/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},

        -- 💀
        -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
        --
        --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
        --
        -- Otherwise you might get the following error:
        --
        --    Error on launch: Failed to attach to the target process
        --
        -- But you should be aware of the implications:
        -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
        -- runInTerminal = false,
    }
}

require("dapui").setup()
require("nvim-dap-virtual-text").setup()


-- Auto open and close dapui
dap.listeners.after.event_initialized["dapui_config"] = function ()
    dapui.open()
end
dap.listeners.before.event_initialized["dapui_config"] = function ()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function ()
    dapui.close()
end

