local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

return packer.startup(
{
  function(use)
    use 'wbthomason/packer.nvim'
    use 'preservim/nerdtree'
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'justinmk/vim-sneak'
    use 'lewis6991/gitsigns.nvim'
    use 'junegunn/vim-easy-align'
    use 'romainl/vim-cool'
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'}
    use 'dag/vim-fish'
    use 'mattn/emmet-vim'
    use 'ap/vim-buftabline'
    use 'christoomey/vim-tmux-navigator'
    use 'sainnhe/gruvbox-material'
    use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate" }
    use 'ryanoasis/vim-devicons'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'
    use "honza/vim-snippets"
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'sbdchd/neoformat'
  end,
  config = {
    git = {
      default_url_format = 'git@github.com:%s.git'
    }
  }
})
