return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",   
  build = ":TSUpdate",
  lazy = false,
  opts = {
    ensure_installed = { "rust", "python", "bash", "toml", "regex", "c", "cpp" },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
}
