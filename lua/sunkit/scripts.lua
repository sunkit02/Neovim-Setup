local vim = vim

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

-- Toggle linewrap
BufsLineWrap = {}

local function get_buf_wrap_state()
  local bufnr = vim.fn.bufnr("%")

  if BufsLineWrap[bufnr] == nil then
    BufsLineWrap[bufnr] = {
      linewrap = false,
      maps_set = false,
    }
  end

  return BufsLineWrap[bufnr]
end


function ToggleLineWrap()
  local state = get_buf_wrap_state()

  if state.linewrap == true then
    state.linewrap = false
  else
    state.linewrap = true
  end

  SyncLineWrapState()
end

-- FIX: Toggling linewrap for a `Buffer` in different `Window`s will cause the 
-- state to be out of sync. Can be fixed by toggling again but would be nice 
-- if can be automatically fixed (With a autocmd on `BufWinEnter` perhaps?)
function SyncLineWrapState()
  local state = get_buf_wrap_state()

  if state.linewrap then
    vim.cmd([[
      set wrap
      set linebreak
      ]])

    -- Set special keymaps
    vim.api.nvim_buf_set_keymap(0, "n", "j", "gj", { noremap = true, silent = true, desc = "Treat j as gj" })
    vim.api.nvim_buf_set_keymap(0, "n", "k", "gk", { noremap = true, silent = true, desc = "Treat k as gk" })
    vim.api.nvim_buf_set_keymap(0, "n", "^", "g^", { noremap = true, silent = true, desc = "Treat ^ as g^" })
    vim.api.nvim_buf_set_keymap(0, "n", "0", "g0", { noremap = true, silent = true, desc = "Treat 0 as g0" })

    state.maps_set = true
    print("LineWrapOn")
  elseif not state.linewrap and state.maps_set then
    vim.cmd([[
      set nowrap
      set nolinebreak
      ]])

    -- Delete special keymaps
    vim.api.nvim_buf_del_keymap(0, "n", "j")
    vim.api.nvim_buf_del_keymap(0, "n", "k")
    vim.api.nvim_buf_del_keymap(0, "n", "^")
    vim.api.nvim_buf_del_keymap(0, "n", "0")

    state.maps_set = false
    print("LineWrapOff")
  end
end


local auto_wrap_group = vim.api.nvim_create_augroup("AutoWrap", { clear = true })
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  callback = function ()
    SyncLineWrapState()
  end,
  group = auto_wrap_group,
  pattern = "*",
})
