-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/cengshuai/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/cengshuai/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/cengshuai/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/cengshuai/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/cengshuai/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/Users/cengshuai/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "git@github.com:L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/cengshuai/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "git@github.com:hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/cengshuai/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "git@github.com:hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/cengshuai/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "git@github.com:hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/cengshuai/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "git@github.com:saadparwaiz1/cmp_luasnip"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/Users/cengshuai/.local/share/nvim/site/pack/packer/start/emmet-vim",
    url = "git@github.com:mattn/emmet-vim"
  },
  ["flutter-tools.nvim"] = {
    loaded = true,
    path = "/Users/cengshuai/.local/share/nvim/site/pack/packer/start/flutter-tools.nvim",
    url = "git@github.com:akinsho/flutter-tools.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/cengshuai/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "git@github.com:lewis6991/gitsigns.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/cengshuai/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "git@github.com:williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/cengshuai/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "git@github.com:williamboman/mason.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/Users/cengshuai/.local/share/nvim/site/pack/packer/start/neoformat",
    url = "git@github.com:sbdchd/neoformat"
  },
  nerdtree = {
    loaded = true,
    path = "/Users/cengshuai/.local/share/nvim/site/pack/packer/start/nerdtree",
    url = "git@github.com:preservim/nerdtree"
  },
  ["nightfox.nvim"] = {
    loaded = true,
    path = "/Users/cengshuai/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
    url = "git@github.com:EdenEast/nightfox.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/cengshuai/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "git@github.com:hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/cengshuai/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "git@github.com:neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/cengshuai/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "git@github.com:nvim-treesitter/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/cengshuai/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "git@github.com:wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/cengshuai/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "git@github.com:nvim-lua/plenary.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/cengshuai/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "git@github.com:nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/cengshuai/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "git@github.com:nvim-telescope/telescope.nvim"
  },
  ["vim-buftabline"] = {
    loaded = true,
    path = "/Users/cengshuai/.local/share/nvim/site/pack/packer/start/vim-buftabline",
    url = "git@github.com:ap/vim-buftabline"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/cengshuai/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "git@github.com:tpope/vim-commentary"
  },
  ["vim-cool"] = {
    loaded = true,
    path = "/Users/cengshuai/.local/share/nvim/site/pack/packer/start/vim-cool",
    url = "git@github.com:romainl/vim-cool"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/Users/cengshuai/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "git@github.com:ryanoasis/vim-devicons"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/Users/cengshuai/.local/share/nvim/site/pack/packer/start/vim-easy-align",
    url = "git@github.com:junegunn/vim-easy-align"
  },
  ["vim-fish"] = {
    loaded = true,
    path = "/Users/cengshuai/.local/share/nvim/site/pack/packer/start/vim-fish",
    url = "git@github.com:dag/vim-fish"
  },
  ["vim-sneak"] = {
    loaded = true,
    path = "/Users/cengshuai/.local/share/nvim/site/pack/packer/start/vim-sneak",
    url = "git@github.com:justinmk/vim-sneak"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/Users/cengshuai/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "git@github.com:honza/vim-snippets"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/cengshuai/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "git@github.com:tpope/vim-surround"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/cengshuai/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "git@github.com:christoomey/vim-tmux-navigator"
  }
}

time([[Defining packer_plugins]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end