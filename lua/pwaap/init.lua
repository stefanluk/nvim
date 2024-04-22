require("pwaap.remap")
require("pwaap.options")
require("pwaap.lazy_init")

local augroup = vim.api.nvim_create_augroup

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})
local PwaapGroup = augroup('Pwaap', {})

autocmd('TextYankPost', {
    group = yank_group,
    callback = function()
        vim.highlight.on_yank()
    end,
})

autocmd('LspAttach', {
    group = PwaapGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})
