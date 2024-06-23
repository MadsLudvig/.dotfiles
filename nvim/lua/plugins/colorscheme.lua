return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    enabled = true,
    config = function()
      require("cyberdream").setup({
        -- Recommended - see "Configuring" below for more config options
        -- transparent = true,
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
--
-- return {
--   {
--     "rebelot/kanagawa.nvim",
--     priority = 1000,
--     name = "kanagawa",
--     config = function()
--       require("kanagawa").setup({})
--       vim.cmd("colorscheme kanagawa")
--     end,
--   },
--   {
--     "rose-pine/neovim",
--     priority = 1000,
--     name = "rose-pine",
--     config = function()
--       require("rose-pine").setup({})
--     end,
--   },
--   {
--     "navarasu/onedark.nvim",
--     priority = 1000,
--     name = "onedark",
--     config = function()
--       require("onedark").setup({
--         style = "darker",
--       })
--       require("onedark").load()
--     end,
--   },
--   {
--     "catppuccin/nvim",
--     priority = 1000,
--     name = "catppuccin",
--     config = function()
--       -- local color = "#14141f"
--       require("catppuccin").setup({
--         -- color_overrides = {
--         --   mocha = {
--         --     base = color,
--         --     mantle = color,
--         --     crust = color,
--         --   },
--         -- },
--       })
--     end,
--   },
