local util = require("formatter.util")

local function prettier(parser)
	if not parser then
		return {
			exe = "prettier",
			args = {
				"--stdin-filepath",
				util.escape_path(util.get_current_buffer_file_path()),
			},
			stdin = true,
			try_node_modules = true,
		}
	end

	return {
		exe = "prettier",
		args = {
			"--stdin-filepath",
			util.escape_path(util.get_current_buffer_file_path()),
			"--parser",
			parser,
			"--tab-width",
			"2",
		},
		stdin = true,
		try_node_modules = true,
	}
end

require("formatter").setup({
	filetype = {
		javascript = { prettier("babel") },
		vue = { prettier("vue") },
		css = { prettier("css") },
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
	},
})

-- format on save
vim.cmd([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]])
