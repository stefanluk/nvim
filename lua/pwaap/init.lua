require("pwaap.remap")
require("pwaap.options")
require("pwaap.lazy_init")

local augroup = vim.api.nvim_create_augroup

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    callback = function()
        vim.highlight.on_yank()
    end,
})
