local icons = {
    BoldLineMiddle = "┃",
    BoldLineDashedMiddle = "┋",
    TriangleShortArrowRight = "",
}


return {
    {
        "tpope/vim-fugitive",
        config = function() 
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
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
                -- signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
                -- numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
                -- linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
                -- word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
                -- watch_gitdir = {
                --     follow_files = true
                -- },
                -- auto_attach = true,
                attach_to_untracked = false,
                -- current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
                -- current_line_blame_opts = {
                --     virt_text = true,
                --     virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                --     delay = 1000,
                --     ignore_whitespace = false,
                --     virt_text_priority = 100,
                -- },
                current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
                -- current_line_blame_formatter_opts = {
                --     relative_time = false,
                -- },
                -- sign_priority = 6,
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
            vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>")

        end
    }
}

