vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Quicklist navigation
vim.keymap.set("n", "<C-M-k>", ":cprev<cr>")
vim.keymap.set("n", "<C-M-j>", ":cnext<cr>")

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

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Search for exact word
vim.keymap.set("n", "<leader>/", function()
	local word = vim.fn.input("Search exact word: ")
	if word == "" then
		print("Exact search canceled by user")
		return
	end

	-- Check if the word contains non-word characters
	local search_pattern
	if word:find("%W") then
		-- Escape non-word characters
		search_pattern = vim.fn.escape(word, "\\/.*$^~[]")
	else
		-- Use word boundaries for exact words
		search_pattern = "\\<" .. vim.fn.escape(word, "\\/.*$^~[]") .. "\\>"
	end

	-- Set the search pattern and perform the initial search
	vim.fn.setreg("/", search_pattern)
	vim.cmd("normal! /" .. search_pattern .. "<CR>")

	-- Check if the search result is not found
	if vim.fn.search(search_pattern, "w") == 0 then
		print("Exact word '" .. word .. "' was not found.")
	else
		print("Found exact word '" .. word .. "'. Use 'n' or 'N' to navigate.")
	end
end, { noremap = true, silent = true })

-- Scroll horizontally

local function horizontal_scroll_mode(initial_char)
	if vim.o.wrap then
		return
	end

	vim.cmd("echohl Title")
	local typed_char = initial_char
	while vim.tbl_contains({ "h", "l", "H", "L" }, typed_char) do
		vim.cmd("normal! z" .. typed_char)
		vim.cmd("redraw")
		vim.cmd("echon '-- Horizontal scrolling mode (h/l/H/L)'")
		typed_char = vim.fn.nr2char(vim.fn.getchar())
	end
	vim.cmd("echohl None | echo '' | redraw")
end

vim.keymap.set("n", "zh", function()
	horizontal_scroll_mode("h")
end, { silent = true })

vim.keymap.set("n", "zl", function()
	horizontal_scroll_mode("l")
end, { silent = true })

vim.keymap.set("n", "zH", function()
	horizontal_scroll_mode("H")
end, { silent = true })

vim.keymap.set("n", "zL", function()
	horizontal_scroll_mode("L")
end, { silent = true })

-- keymap for oil.nvim
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
