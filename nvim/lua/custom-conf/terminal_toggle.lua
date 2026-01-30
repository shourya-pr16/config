-- TERMINAL TOGGLE (bottom split)
local term_buf = nil
local term_win = nil

function _G.toggle_bottom_terminal()
  -- If terminal window exists and is valid → close it
  if term_win and vim.api.nvim_win_is_valid(term_win) then
    vim.api.nvim_win_close(term_win, true)
    term_win = nil
    return
  end

  -- Create buffer if it doesn't exist
  if not term_buf or not vim.api.nvim_buf_is_valid(term_buf) then
    term_buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_option(term_buf, "bufhidden", "hide")
  end

  -- Open bottom split
  vim.cmd("botright split")

  term_win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_buf(term_win, term_buf)

  -- Resize split to 40% of screen height
  local height = math.floor(vim.o.lines * 0.4)
  vim.api.nvim_win_set_height(term_win, height)

  -- Start terminal only first time
  if vim.bo[term_buf].buftype ~= "terminal" then
    vim.cmd("terminal")
  end

  -- Enter insert mode automatically
  vim.cmd("startinsert")
end

-- Keymap: Ctrl + /
vim.keymap.set({ "n", "t" }, "<C-/>", toggle_bottom_terminal, { silent = true })
vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>")

