require("lint").setup({
	linters_by_ft = {
		javascript = { "eslint_d" },
		typescript = { "eslint_d" },
		python = { "pylint" },
	},
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
