local command = vim.api.nvim_create_user_command
local to_sysreg = function (modifier)
  local filename = vim.fn.expand(modifier)
  vim.fn.setreg("+", filename)
  print(filename)
end
command("E", "edit <args>", {
  nargs = "?", -- 0 or 1 argument (just like :e)
  complete = "file", -- tab-completion like :e (files & directories)
  desc = "Just like :edit / :e",
})
-- write filename to buffer
command("Rname", function () to_sysreg("%") end, { desc = "relative file name" })
command("Tname", function () to_sysreg("%:t") end, { desc = "tail of the file name" })
command("Fname", function () to_sysreg("%:p") end, { desc = "full path file name" })
command("LspOff", function () vim.cmd("lsp disable") end, { desc = "turn off lsp server once and for all" })
-- adjust file line width to specific width or 80
command("Format", function (opts)
  local fmt = ":%!fmt"
  if opts.args and opts.args ~= "" then
    local width = opts.args + 1
    fmt = ":%!fmt --width=" .. width .. " --goal=" .. width
    vim.wo.colorcolumn = tostring(width)
  else
    vim.wo.colorcolumn = ""
  end
  vim.cmd(fmt)
end, { nargs = "?", desc = "format text width to specific length or default to fmt" })

command("Quit", function ()
  local count = vim.api.nvim_get_current_buf()
  if count == 1 then
    vim.cmd("q")
  else
    vim.cmd("bd")
  end
end, { desc = "close buffer or quit when only one buffer exists" })

command("Restart", function ()
  local session = vim.fn.stdpath("state") .. "/restart_session.vim"
  vim.cmd("mksession! " .. vim.fn.fnameescape(session))
  vim.cmd("restart source " .. vim.fn.fnameescape(session))
end, { desc = "restart neovim while preserving open buffers" })

command("ToUnix", "%!dos2unix", { desc = "convert whole file from dos to unix format" })

-- treesitter parser language per filetype supported by Cpname
local ts_lang_of = {
  json = "json",
  yaml = "yaml",
}

-- strip a matching pair of surrounding quotes (single or double)
local function strip_quotes(text)
  if #text >= 2 then
    local first, last = text:sub(1, 1), text:sub(-1)
    if (first == '"' and last == '"') or (first == "'" and last == "'") then
      return text:sub(2, -2)
    end
  end
  return text
end

-- resolve the dotted path of the JSON/YAML field under the cursor via treesitter
local copy_field_path = function ()
  local bufnr = vim.api.nvim_get_current_buf()
  local lang = ts_lang_of[vim.bo[bufnr].filetype]
  if not lang then
    vim.notify("Cpname: unsupported filetype (want json or yaml)", vim.log.levels.WARN)
    return
  end
  local parser = vim.treesitter.get_parser(bufnr, lang)
  local tree = parser:parse()[1]
  local cursor = vim.api.nvim_win_get_cursor(0)
  local row, col = cursor[1] - 1, cursor[2]
  local node = tree:root():named_descendant_for_range(row, col, row, col)

  local path = {}
  while node ~= nil do
    -- both json "pair" and yaml "*_mapping_pair" nodes expose a "key" field
    local key_nodes = node:field("key")
    if key_nodes and #key_nodes > 0 then
      local key = strip_quotes(vim.treesitter.get_node_text(key_nodes[1], bufnr))
      table.insert(path, 1, key)
    end
    node = node:parent()
  end

  if #path == 0 then
    vim.notify("Cpname: cursor is not inside a mapping field", vim.log.levels.WARN)
    return
  end
  local result = table.concat(path, ".")
  vim.fn.setreg("+", result)
  print(result)
end
command("Cpname", copy_field_path, { desc = "copy JSON/YAML field path under cursor" })
