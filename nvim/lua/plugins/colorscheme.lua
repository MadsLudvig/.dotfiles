return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    enabled = true,
    config = function()
      require("cyberdream").setup({
        italic_comments = true,
        hide_fillchars = true,
        borderless_telescope = true,
        terminal_colors = true,
        theme = {
          colors = {
            bg = "#1e1e23",
          },
        },
      })
      vim.cmd("colorscheme cyberdream") -- set the colorscheme
    end,
  },
}
