return {
  {
    "akinsho/toggleterm.nvim",
    keys = {
      { "<c-t>", mode = { "n", "t" }, function() end },
    },
    opts = {
      autochdir = true,
      open_mapping = [[<c-t>]],
      direction = "float",
      float_opts = {
        border = "curved",
      },
    },
  },
}
