vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.wrap = false
vim.o.shiftwidth = 4
vim.g.mapleader = " "
vim.o.winborder = "rounded"
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.expandtab = true
vim.laststatus = 0

vim.pack.add({
    { src = "https://github.com/scottmckendry/cyberdream.nvim" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/chomosuke/typst-preview.nvim" },
    { src = "https://github.com/saghen/blink.cmp" },
    { src = "https://github.com/zbirenbaum/copilot.lua" },
    { src = "https://github.com/dynamotn/Navigator.nvim" },
    { src = "https://github.com/folke/snacks.nvim" },
    { src = "https://github.com/folke/todo-comments.nvim" },
    { src = "https://github.com/folke/trouble.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/j-hui/fidget.nvim" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
})

require('nvim-treesitter.configs').setup {
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
}

-- Setup plugins
require("blink.cmp").setup()
require("Navigator").setup()
require("todo-comments").setup()
require("trouble").setup()
require("fidget").setup()
require("lualine").setup({
    options = {
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "|", right = "|" },
    },
})
require('copilot').setup({
    suggestion = {
        auto_trigger = true,
        keymap = {
            accept = "<C-j>",
        },
    },
})
require("oil").setup({
    default_file_explorer = true,
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    view_options = {
        show_hidden = true,
        natural_order = true,
    },
    keymaps = {
        ["g?"] = { "actions.show_help", mode = "n" },
        ["<CR>"] = "actions.select",
        ["-"] = { "actions.parent", mode = "n" },
        ["_"] = { "actions.open_cwd", mode = "n" },
        ["`"] = { "actions.cd", mode = "n" },
        ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
        ["gs"] = { "actions.change_sort", mode = "n" },
        ["gx"] = "actions.open_external",
        ["g."] = { "actions.toggle_hidden", mode = "n" },
        ["g\\"] = { "actions.toggle_trash", mode = "n" },
    },
    use_default_keymaps = false,
})

-- Set colorscheme
vim.cmd("colorscheme cyberdream")
-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Enable language servers
vim.lsp.enable({ "lua_ls", "svelte", "tinymist", "typescript-language-server", "rust_analyzer" })

-- Bind keybinds on LspAttach
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
        vim.keymap.set('n', 'gr', Snacks.picker.lsp_references)
        vim.keymap.set('n', 'gt', Snacks.picker.lsp_type_definitions)
        vim.keymap.set('n', '<leader>ss', Snacks.picker.lsp_symbols)
        vim.keymap.set('n', '<leader>sS', Snacks.picker.lsp_workspace_symbols)
        vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
    end
})

vim.api.nvim_create_autocmd("BufWritePre", {
    group = format_on_save_group,
    pattern = "*",
    callback = function()
        vim.lsp.buf.format({ async = true })
    end,
    desc = "Format buffer on save",
})

vim.api.nvim_create_autocmd("User", {
    pattern = "BlinkCmpMenuOpen",
    callback = function()
        vim.b.copilot_suggestion_hidden = true
    end,
})

vim.api.nvim_create_autocmd("User", {
    pattern = "BlinkCmpMenuClose",
    callback = function()
        vim.b.copilot_suggestion_hidden = false
    end,
})

vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>f', function() Snacks.picker.files() end)
vim.keymap.set('n', '<leader>h', function() Snacks.picker.help() end)
vim.keymap.set('n', '<leader>e', ':Oil<CR>')
vim.keymap.set({ 'n', 't' }, '<C-h>', ':NavigatorLeft<CR>')
vim.keymap.set({ 'n', 't' }, '<C-l>', ':NavigatorRight<CR>')
vim.keymap.set({ 'n', 't' }, '<C-k>', ':NavigatorUp<CR>')
vim.keymap.set({ 'n', 't' }, '<C-j>', ':NavigatorDown<CR>')
vim.keymap.set({ "n", "t" }, "<C-t>", function() Snacks.terminal.toggle("fish") end) -- Open Snacks picker
vim.keymap.set('n', '<leader>g', function() Snacks.lazygit() end)
vim.keymap.set('n', '<leader>t', function() Snacks.picker.todo_comments() end)
vim.keymap.set('n', '<leader>x', ":Trouble diagnostics toggle filter.buf=0<CR>")
vim.keymap.set('n', '<leader>X', ":Trouble diagnostics<CR>")
vim.keymap.set('n', '<leader>|', ":vsplit<CR>")
vim.keymap.set('n', '<leader>_', ":split<CR>")
