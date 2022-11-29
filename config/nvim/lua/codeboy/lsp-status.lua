local icons = {
    errors = '  ',
    warnings = '  ',
    hints = ' ﯦ ',
    info = '  ',
}

local severity_level = {
  errors = vim.diagnostic.severity.ERROR,
  warnings = vim.diagnostic.severity.WARN,
  info = vim.diagnostic.severity.INFO,
  hints = vim.diagnostic.severity.HINT,
}

local separator_icon = ' '

local function get_err_status()
  local error_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  if error_count and error_count > 0 then
    return icons.errors .. error_count
  else
    return ''
  end
end

local function get_warn_status()
  local warn_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  if warn_count and warn_count > 0 then
    return icons.warnings .. warn_count
  else
    return ''
  end
end

local function get_info_status()
  local info_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  if info_count and info_count > 0 then
    return icons.info .. info_count
  else
    return ''
  end
end

local function get_hint_status()
  local hint_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
  if hint_count and hint_count > 0 then
    return icons.hints .. hint_count
  else
    return ''
  end
end

local function get_lsp_status()
  local status_parts = {}
  local diagnostic_list = {}

  for i, level in pairs(severity_level) do
    diagnostic_list[i] = #vim.diagnostic.get(0, { severity = level })
  end

  if diagnostic_list then
    if diagnostic_list.errors and diagnostic_list.errors > 0 then
      table.insert(status_parts, icons.errors  .. diagnostic_list.errors)
    end

    if diagnostic_list.warnings and diagnostic_list.warnings > 0 then
      table.insert(status_parts, icons.warnings .. diagnostic_list.warnings)
    end

    if diagnostic_list.info and diagnostic_list.info > 0 then
      table.insert(status_parts, icons.info .. diagnostic_list.info)
    end

    if diagnostic_list.hints and diagnostic_list.hints > 0 then
      table.insert(status_parts, icons.hints .. diagnostic_list.hints)
    end
  end

  if #status_parts == 0 then
    return ''
  else
    return ' ' .. table.concat(status_parts, separator_icon)
  end
end

return {
  status = get_lsp_status,
  get_err_status = get_err_status,
  get_warn_status = get_warn_status,
  get_info_status = get_info_status,
  get_hint_status = get_hint_status,
}
