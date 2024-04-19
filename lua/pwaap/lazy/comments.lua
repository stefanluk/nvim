return {
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        }
    },
    {
        'numToStr/Comment.nvim',
        config = function()
       		local prehook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
            require("Comment").setup({
                pre_hook = prehook
            })
        end,
        lazy = false,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
    },

}
