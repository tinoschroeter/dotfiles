local EVE = {}
local api = vim.api
local curl = require("plenary.curl")

local function get_env_or_default(var_name, default)
  local value = vim.fn.getenv(var_name)
  return value ~= vim.NIL and value or default
end

EVE.config = {
  api_url = get_env_or_default("EVE_ONLINE_API_URL", ""),
  api_user = get_env_or_default("EVE_ONLINE_API_USER", ""),
  api_key = get_env_or_default("EVE_ONLINE_API_KEY", ""),
}

local status_options = {
  "online",
  "offline",
  "away",
}

-- Window-Buffer Setup
local function create_window()
  local buf = api.nvim_create_buf(false, true)
  api.nvim_buf_set_option(buf, "bufhidden", "wipe")

  local width = api.nvim_get_option("columns")
  local height = api.nvim_get_option("lines")

  -- Calculate Floating Window Size
  local win_height = 3
  local win_width = 25
  local row = math.ceil((height - win_height) / 2 - 1)
  local col = math.ceil((width - win_width) / 2)

  -- Window Options
  local opts = {
    style = "minimal",
    relative = "editor",
    width = win_width,
    height = win_height,
    row = row,
    col = col,
    border = "rounded",
    title = " EVE Online Status ",
    title_pos = "center",
  }

  -- Create the window
  local win = api.nvim_open_win(buf, true, opts)
  api.nvim_win_set_option(win, "cursorline", true)

  return buf, win
end

-- Validate configuration
local function validate_config()
  local missing = {}
  if EVE.config.api_url == "" then
    table.insert(missing, "api_url")
  end
  if EVE.config.api_user == "" then
    table.insert(missing, "api_user")
  end
  if EVE.config.api_key == "" then
    table.insert(missing, "api_key")
  end

  if #missing > 0 then
    local msg = string.format(
      "EVEissing configuration: %s. Set the environment variables AVAILABILITY_API_URL, AVAILABILITY_API_USER, AVAILABILITY_API_KEY oder konfiguriere sie in der setup() Funktion.",
      table.concat(missing, ", ")
    )
    vim.notify(msg, vim.log.levels.ERROR)
    return false
  end
  return true
end

-- Retrieve status
local function get_status()
  if not validate_config() then
    return nil
  end

  local url = string.format("%s/availability/status/%s", EVE.config.api_url, EVE.config.api_user)
  local response = curl.get(url, {
    headers = {
      Authorization = string.format("Bearer %s", EVE.config.api_key),
    },
  })

  if response.status == 200 then
    return vim.fn.json_decode(response.body).status
  end
  return nil
end

-- Set status
local function set_status(status)
  if not validate_config() then
    return false
  end

  local url = string.format("%s/availability/status/%s", EVE.config.api_url, EVE.config.api_user)
  local response = curl.post(url, {
    body = vim.fn.json_encode({ status = status }),
    headers = {
      content_type = "application/json",
      Authorization = string.format("Bearer %s", EVE.config.api_key),
    },
  })

  return response.status == 200
end

-- Show status list
function EVE.show_status_picker()
  local buf, win = create_window()

  -- Fill buffer with status options
  api.nvim_buf_set_lines(buf, 0, -1, false, status_options)

  -- Mark current status
  local current_status = get_status()
  if current_status then
    for i, status in ipairs(status_options) do
      if status == current_status then
        api.nvim_win_set_cursor(win, { i, 0 })
        break
      end
    end
  end

  -- Keymaps
  local opts = { noremap = true, silent = true }
  api.nvim_buf_set_keymap(
    buf,
    "n",
    "<CR>",
    string.format([[<cmd>lua require('eve-online').select_status(%d)<CR>]], buf),
    opts
  )
  api.nvim_buf_set_keymap(buf, "n", "q", "<cmd>q<CR>", opts)
end

-- Select and set status
function EVE.select_status(buf)
  local selected_line = api.nvim_win_get_cursor(0)[1]
  local status = status_options[selected_line]

  if set_status(status) then
    vim.notify(string.format("Status set to '%s'", status))
  else
    vim.notify("Error setting status", vim.log.levels.ERROR)
  end

  api.nvim_win_close(0, true)
end

-- Setup Funktion
function EVE.setup(opts)
  EVE.config = vim.tbl_deep_extend("force", EVE.config, opts or {})
  validate_config()
end

return EVE
