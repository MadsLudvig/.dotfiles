return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    opts = {
      ensure_installed = { "bash", "c", "html", "lua", "markdown", "vim", "vimdoc", "rust" },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "ruby" },
      },
      indent = { enable = true, disable = { "ruby" } },
      autotag = { enable = true },
    },
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-context" },
      { "JoosepAlviste/nvim-ts-context-commentstring" },
    },

    config = function(_, opts)
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

      ---@diagnostic disable-next-line: missing-fields
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
