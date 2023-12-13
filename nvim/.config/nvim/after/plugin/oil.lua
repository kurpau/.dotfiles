require("oil").setup({
	vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
	default_file_explorer = false,
	-- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
	delete_to_trash = false,
	-- Skip the confirmation popup for simple operations
	skip_confirm_for_simple_edits = false,
	-- Selecting a new/moved/renamed file or directory will prompt you to save changes first
	prompt_save_on_select_new_entry = true,
	-- Oil will automatically delete hidden buffers after this delay
	-- You can set the delay to false to disable cleanup entirely
	-- Note that the cleanup process only starts when none of the oil buffers are currently displayed
	cleanup_delay_ms = 2000,
	-- Window-local options to use for oil buffers
	win_options = {
		wrap = false,
		signcolumn = "no",
		cursorcolumn = false,
		foldcolumn = "0",
		spell = false,
		list = false,
		conceallevel = 3,
		concealcursor = "nvic",
	},
	-- Buffer-local options to use for oil buffers
	buf_options = {
		buflisted = false,
		bufhidden = "hide",
	},
})
