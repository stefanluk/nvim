--Remap space as leader key
vim.g.mapleader = " "

-- NORMAL MODE
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Clear highlight search on pressing <Esc> in normal mode

-- Move text up and down
vim.keymap.set("n", "<A-k>", "<Esc>:m .-2<cr>")
vim.keymap.set("n", "<A-j>", "<Esc>:m .+1<cr>")

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })


-- INSERT MODE 
vim.keymap.set("i", "jj", "<ESC>")


-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move text up and down
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")


