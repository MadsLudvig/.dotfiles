return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  keys = {
    { "<leader>gg", ":LazyGit<CR>", desc = "Lazy[G]it" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
