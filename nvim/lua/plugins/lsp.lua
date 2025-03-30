vim.lsp.config["lua"] = {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".luarc.jsonc" },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
    },
  },
}

vim.lsp.config["svelte"] = {
  cmd = { "svelteserver", "--stdio" },
  filetypes = { "svelte" },
  root_markers = { "package.json", ".git" },
}

vim.lsp.config["typescript"] = {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_markers = { "package.json", "tsconfig.json", ".git" },
}

vim.lsp.enable("lua")
vim.lsp.enable("svelte")
vim.lsp.enable("typescript")

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  severity_sort = true,
})

local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- stylua: ignore start
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
  callback = function(event)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })
    vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.documentHighlightProvider then
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, { buffer = event.buf, callback = vim.lsp.buf.document_highlight })
      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, { buffer = event.buf, callback = vim.lsp.buf.clear_references })
    end
  end,
})
-- stylua: ignore end

return {
  { "j-hui/fidget.nvim", opts = {} },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, {
        name = "lazydev",
        group_index = 0,
      })
    end,
  },
  {
    "saghen/blink.cmp",
    build = "cargo build --release",
    opts = {
      sources = {
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
        },
      },
      fuzzy = {
        implementation = "prefer_rust_with_warning",
        prebuilt_binaries = { force_version = "v1.0.0" },
      },
    },
    dependencies = { "rafamadriz/friendly-snippets" },
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
  },
  { "nvim-tree/nvim-web-devicons", opts = {} },
  { "nvim-java/nvim-java" },
  {
    "chomosuke/typst-preview.nvim",
    lazy = false, -- or ft = 'typst'
    version = "1.2.2",
    opts = {
      invert_colors = "always",
      get_main_file = function()
        return "main.typ"
      end,
    },
  },
  { "Joakker/vim-antlr4" },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
}
