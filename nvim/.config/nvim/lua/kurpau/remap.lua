vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Quicklist navigation
vim.keymap.set("n", "<M-j>", ":cnext<cr>")
vim.keymap.set("n", "<M-k>", ":cprev<cr>")

-- ============== toggle file explorer (nvim-tree) ============
vim.keymap.set("n", "<leader>pv", ":NvimTreeToggle<cr>")
-- =================================================

-- move entire line in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in the middle of the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- preserve the yanked word after pasting in another
vim.keymap.set("x", "<leader>p", [["_dP]])

-- yank to system clipboard with leader key
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- prevent accidental quitting without saving
vim.keymap.set("n", "Q", "<nop>")

-- use fzf to find folders and enter new tmux session
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- edit all the same words you're currently on
vim.keymap.set("n", "<leader>ew", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
