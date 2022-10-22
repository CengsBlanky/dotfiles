local icons = {
    errors = '',
    warnings = '',
    hints = 'ﯦ',
    info = '',
}

local severity_level = {
  errors = vim.diagnostic.severity.ERROR,
  warnings = vim.diagnostic.severity.WARN,
  info = vim.diagnostic.severity.INFO,
  hints = vim.diagnostic.severity.HINT,
}

local indicator_separator = ' '

local function diagnostic()
  local diagnostics_list = {}
  for i, level in pairs(severity_level) do
    diagnostics_list[i] = #vim.diagnostic.get(0, { severity = level })
  end
  return diagnostics_list
end

local function get_lsp_status()
  local status_parts = {}
  local buf_diagnostic = diagnostic()

  if buf_diagnostic then
    if buf_diagnostic.errors and buf_diagnostic.errors > 0 then
      table.insert(status_parts, icons.errors  .. indicator_separator .. buf_diagnostic.errors)
    end

    if buf_diagnostic.warnings and buf_diagnostic.warnings > 0 then
      table.insert(status_parts, icons.warnings .. indicator_separator .. buf_diagnostic.warnings)
    end

    if buf_diagnostic.info and buf_diagnostic.info > 0 then
      table.insert(status_parts, icons.info .. indicator_separator .. buf_diagnostic.info)
    end

    if buf_diagnostic.hints and buf_diagnostic.hints > 0 then
      table.insert(status_parts, icons.hints .. indicator_separator .. buf_diagnostic.hints)
    end
  end

  if #status_parts == 0 then
    return ''
  else
    return ' ' .. table.concat(status_parts, indicator_separator)
  end
end

return {
  status = get_lsp_status
}
