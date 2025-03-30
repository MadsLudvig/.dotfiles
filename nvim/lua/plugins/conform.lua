return {
  {
    "stevearc/conform.nvim",
    event = "VimEnter",
    opts = {
      notify_on_error = true,
      format_on_save = {
        timeout_ms = 50,
        lsp_fallback = function(bufnr)
          return not disable_filetypes[vim.bo[bufnr].filetype]
        end,
      },
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        xml = { "xmlformat" },
      },
    },
  },
}
