return {
	{ -- Autoformat
		"stevearc/conform.nvim",
		lazy = false,
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			notify_on_error = false,
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort" },
				javascript = { "eslint_d" },
				blade = { "blade-formatter" },
				astro = { "prettierd" },
			},
			format_on_save = function(bufnr)
				local disable_filetypes = { c = true, cpp = true, blade = true }
				if disable_filetypes[vim.bo[bufnr].filetype] then
					return false
				end
				return {
					lsp_fallback = true,
					timeout_ms = 500,
				}
			end,
		},
	},
}
