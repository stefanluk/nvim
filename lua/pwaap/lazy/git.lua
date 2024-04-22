local icons = {
    BoldLineMiddle = "┃",
    BoldLineDashedMiddle = "┋",
    TriangleShortArrowRight = "",
}


return {
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>gg", vim.cmd.Git)
            vim.keymap.set("n", "<leader>gp", function()
                vim.cmd.Git('push')
            end)
            vim.keymap.set("n", "<leader>gl", function()
                vim.cmd.Git('pull')
            end)
            vim.keymap.set("n", "<leader>gp", function()
                vim.cmd.Git('push')
            end)
            vim.keymap.set("n", "<leader>gc", function()
                vim.fn.input(":Git commit -m \"")
            end)
            vim.keymap.set("n", "<leader>gm", function()
                vim.fn.input(":Git merge ")
            end)
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup {
                signs = {
                    add = {
                        hl = "GitSignsAdd",
                        text = icons.BoldLineMiddle,
                        numhl = "GitSignsAddNr",
                        linehl = "GitSignsAddLn",
                    },
                    change = {
                        hl = "GitSignsChange",
                        text = icons.BoldLineDashedMiddle,
                        numhl = "GitSignsChangeNr",
                        linehl = "GitSignsChangeLn",
                    },
                    delete = {
                        hl = "GitSignsDelete",
                        text = icons.TriangleShortArrowRight,
                        numhl = "GitSignsDeleteNr",
                        linehl = "GitSignsDeleteLn",
                    },
                    topdelete = {
                        hl = "GitSignsDelete",
                        text = icons.TriangleShortArrowRight,
                        numhl = "GitSignsDeleteNr",
                        linehl = "GitSignsDeleteLn",
                    },
                    changedelete = {
                        hl = "GitSignsChange",
                        text = icons.BoldLineMiddle,
                        numhl = "GitSignsChangeNr",
                        linehl = "GitSignsChangeLn",
                    },
                },
                signcolumn = true,
                linehl = false,
                attach_to_untracked = false,
                current_line_blame = true,
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                    delay = 500,
                    ignore_whitespace = false,
                    virt_text_priority = 100,
                },
                current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
                sign_priority = 6,
                update_debounce = 200,
                max_file_length = 40000, -- Disable if file is longer than this (in lines)
                preview_config = {
                    -- Options passed to nvim_open_win
                    border = 'single',
                    style = 'minimal',
                    relative = 'cursor',
                    row = 0,
                    col = 1
                },
            }

            -- If you want insert `(` after select function or method item
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            local cmp = require('cmp')
            cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
            )

            vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>")
            vim.keymap.set("n", "<leader>gd", ":Gitsigns diffthis HEAD<CR>")

        end
    }
}

